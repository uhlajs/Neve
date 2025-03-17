{
  lib,
  config,
  ...
}:
{
  imports = [
    ./alpha.nix
    ./barbecue.nix
    ./dressing-nvim.nix
    ./indent-blankline.nix
    ./noice.nix
    ./nui.nix
    ./notify.nix
    ./web-devicons.nix
  ];

  options = {
    ui.enable = lib.mkEnableOption "Enable ui module";
  };
  config = lib.mkIf config.ui.enable {
    alpha.enable = lib.mkDefault false;
    barbecue.enable = lib.mkDefault false;
    dressing-nvim.enable = lib.mkDefault false;
    indent-blankline.enable = lib.mkDefault true;
    noice.enable = lib.mkDefault false;
    notify.enable = lib.mkDefault true;
    nui.enable = lib.mkDefault true;
    web-devicons.enable = lib.mkDefault true;
  };
}
