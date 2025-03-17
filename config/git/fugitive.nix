{ lib, config, ... }:
{
  options = {
    fugitive.enable = lib.mkEnableOption "Enable fugitive module";
  };
  config = lib.mkIf config.fugitive.enable {

    plugins.fugitive = {
      enable = true;
    };
  };
}
