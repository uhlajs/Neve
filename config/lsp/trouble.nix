{
  plugins.trouble = {
    enable = true;
    settings = {
      auto_close = true;
    };
  };
  # TODO: Add keybinds to close trouble (q would be nice), rn I need to use :x to close it...
  keymaps = [
    {
      mode = "n";
      key = "<leader>x";
      action = "+diagnostics/quickfix";
    }
    {
      mode = "n";
      key = "<leader>xt";
      action = "<cmd>Trouble<cr>";
      options = {
        silent = true;
        desc = "Trouble menu";
      };
    }
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options = {
        silent = true;
        desc = "Document Diagnostics (Trouble)";
      };
    }
  ];
}
