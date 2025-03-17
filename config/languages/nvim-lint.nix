{ lib, config, ... }:
{
  options = {
    nvim-lint.enable = lib.mkEnableOption "Enable nvim-lint module";
  };
  config = lib.mkIf config.nvim-lint.enable {
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
      };
    };
  };
}
