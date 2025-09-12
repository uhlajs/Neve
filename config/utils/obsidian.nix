{
  lib,
  config,
  ...
}:
{
  options = {
    obsidian.enable = lib.mkEnableOption "Enable obsidian module";
  };
  config = lib.mkIf config.obsidian.enable {
    plugins.obsidian = {
      enable = true;
      settings = {
        legacy_commands = false;
        workspaces = [
          {
            name = "personal";
            path = "~/Nextcloud/Obsidian/Personal";
          }
        ];
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>os";
        action = ":Obsidian search<cr>";
        options = {
          silent = true;
          desc = "Search";
        };
      }
      {
        mode = "n";
        key = "<leader>oo";
        action = ":Obsidian quick_switch<cr>";
        options = {
          silent = true;
          desc = "Quick Switch";
        };
      }
      {
        mode = "n";
        key = "<leader>or";
        action = ":Obsidian rename<cr>";
        options = {
          silent = true;
          desc = "Rename";
        };
      }
      {
        mode = "n";
        key = "<leader>on";
        action = ":Obsidian new<cr>";
        options = {
          silent = true;
          desc = "New";
        };
      }
    ];
  };
}
