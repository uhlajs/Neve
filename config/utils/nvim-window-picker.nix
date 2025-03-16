{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    nvim-window-picker.enable = lib.mkEnableOption "Enable nvim-window-picker module";
  };
  config = lib.mkIf config.nvim-window-picker.enable {
    extraPlugins = with pkgs.vimPlugins; [
      nvim-window-picker
    ];

    extraConfigLua = ''
      require("window-picker").setup()
    '';
  };
}
