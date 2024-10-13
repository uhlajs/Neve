{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [
    nvim-window-picker
  ];

  extraConfigLua = ''
    require("window-picker").setup()
  '';
}
