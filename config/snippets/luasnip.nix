{pkgs, ...}: {
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
}
