{
  plugins.project-nvim = {
    enable = true;
    enableTelescope = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>p";
      action = ":Telescope projects<CR>";
      options = {
        desc = "Project Explorer";
        silent = true;
      };
    }
  ];
}
