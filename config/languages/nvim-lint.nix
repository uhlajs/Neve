{
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
    };
  };
}
