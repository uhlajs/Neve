{
  plugins.obsidian = {
    enable = true;
    settings = {
      workspaces = [
        {
          name = "personal";
          path = "~/Nextcloud/Obsidian/Personal";
        }
      ];
    };
  };
  keymaps = [
    # Disable arrow keys
    {
      mode = "n";
      key = "<leader>os";
      action = ":ObsidianSearch<cr>";
      options = {
        silent = true;
        desc = "Search";
      };
    }
    {
      mode = "n";
      key = "<leader>oo";
      action = ":ObsidianQuickSwitch<cr>";
      options = {
        silent = true;
        desc = "Quick Switch";
      };
    }
    {
      mode = "n";
      key = "<leader>or";
      action = ":ObsidianRename<cr>";
      options = {
        silent = true;
        desc = "Rename";
      };
    }
    {
      mode = "n";
      key = "<leader>on";
      action = ":ObsidianNew<cr>";
      options = {
        silent = true;
        desc = "New";
      };
    }
  ];
}
