{
  description = "Neve is a Neovim configuration built with Nixvim, which allows you to use Nix language to manage Neovim plugins/options";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      flake-utils,
      pre-commit-hooks,
      ...
    }@inputs:
    let
      config = import ./config; # import the module directly
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        nixvimLib = nixvim.lib.${system};
        pkgs = import nixpkgs { inherit system; };
        nixvim' = nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = config;
          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs = {
            inherit self;
          };
        };
      in
      {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = "Neve";
          };
          pre-commit-check = pre-commit-hooks.lib."x86_64-linux".run {
            src = ./.;
            excludes = [ ];
            hooks = {
              nixfmt-rfc-style.enable = true;
              mixed-line-ending = {
                enable = true;
                name = "Mixed line ending";
                description = "Replaces or checks mixed line ending";
                types = [ "text" ];
                entry = "${pkgs.python3Packages.pre-commit-hooks}/bin/mixed-line-ending";
              };
              trailing-whitespace = {
                enable = true;
                name = "Trim Trailing Whitespace";
                description = "This hook trims trailing whitespace.";
                types = [ "text" ];
                entry = "${pkgs.python3Packages.pre-commit-hooks}/bin/trailing-whitespace-fixer";
              };
            };
          };
        };

        packages = {
          # Lets you run `nix run .` to start nixvim
          default = nvim;
        };

        devShell = pkgs.mkShell {
          inherit (self.checks.${system}.pre-commit-check) shellHook;
        };

        formatter = pkgs.nixfmt-rfc-style;
      }
    );
}
