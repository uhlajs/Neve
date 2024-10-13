{
  plugins.lint = {
    enable = true;
    lintersByFt = {
      c = [ "cpplint" ];
      cpp = [ "cpplint" ];
      lua = [ "selene" ];
      python = [ "ruff" ];
      json = [ "jsonlint" ];
      bash = [ "shellcheck" ];
    };
  };
}
