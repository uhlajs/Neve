{ lib, config, pkgs, ... }:
{
  options = {
    nvim-lint.enable = lib.mkEnableOption "Enable nvim-lint module";
  };
  config = lib.mkIf config.nvim-lint.enable {

    # TODO (Honza Uhlik): Remove this bugfix after this issue is resolved
    #   https://github.com/nix-community/nixvim/issues/1141#issuecomment-2054102360
    extraPackages = with pkgs; [
      bazel-buildtools
      cpplint
      nodePackages.jsonlint
      ruff
      shellcheck
      selene
      statix
      yamllint
    ];

    plugins.lint = {
      enable = true;
      lintersByFt = {
        c = [ "cpplint" ];
        cpp = [ "cpplint" ];
        nix = [ "statix" ];
        lua = [ "selene" ];
        python = [ "ruff" ];
        json = [ "jsonlint" ];
        bash = [ "shellcheck" ];
        yaml = [ "yamllint" ];
        bzl = ["buildifier"];
      };
    };
  };
}
