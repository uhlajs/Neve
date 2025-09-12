{ lib, config, ... }:
{
  options = {
    fugitive.enable = lib.mkEnableOption "Enable fugitive module";
  };
  config = lib.mkIf config.fugitive.enable {

    plugins.fugitive = {
      enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>gd";
        action = ":Gvdiffsplit!<CR>";
        options = {
          desc = "Diff mode";
        };
      }
      {
        mode = "n";
        key = "<leader>gh";
        action = ":diffget //2<CR>";
        options = {
          desc = "Take changes from left (LOCAL)";
        };
      }
      {
        mode = "n";
        key = "<leader>gl";
        action = ":diffget //3<CR>";
        options = {
          desc = "Take changes from right (REMOTE)";
        };
      }
      {
        mode = "n";
        key = "<leader>gp";
        action = ":diffput<CR>";
        options = {
          desc = "Push changes to the other side";
        };
      }
    ];
  };
}
