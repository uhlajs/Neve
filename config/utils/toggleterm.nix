{
  plugins.toggleterm = {
    enable = true;
    settings = {
      open_mapping = "[[<leader>/]]";
      hidden = true;
      shade_terminals = true;
      start_in_insert = true;
      terminal_mappings = true;
      persist_mode = true;
      insert_mappings = true;
      close_on_exit = true;
      shell = "fish";
      direction = "float"; # 'vertical' | 'horizontal' | 'tab' | 'float'
      auto_scroll = true;
      float_opts = {
        border = "none"; # 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        width = 100000;
        height = 100000;
        zindex = 200;
      };
    };
  };

  # extraConfigLua = ''
  #   function _G.set_terminal_keymaps()
  #   	local opts = { buffer = 0 }
  #   	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  #   	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  #   	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  #   	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  #   	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  #   	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  #   	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
  #   end
  #
  #   -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  #   -- vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
  # '';
}
