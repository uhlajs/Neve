{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    luasnip.enable = lib.mkEnableOption "Enable luasnip module";
  };
  config = lib.mkIf config.luasnip.enable {
    plugins.luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = false;
        store_selection_keys = "<C-y>";
      };
      fromVscode = [
        {
          lazyLoad = true;
          paths = "${pkgs.vimPlugins.friendly-snippets}";
        }
      ];
    };
  };
}
