{
  plugins = {
    bufferline = {
      enable = true;
      settings = {
        options = {
          separatorStyle = "thick"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin“
          offsets = [
            {
              filetype = "neo-tree";
              text = "Neo-tree";
              highlight = "Directory";
              text_align = "left";
            }
          ];
        };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>bd";
      action = ":lua bufremove()<cr>";
      options = {
        desc = "Delete buffer";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>bD";
      action = "<cmd>bdelete<cr>";
      options = {
        desc = "Delete buffer and window";
      };
    }

    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>e #<cr>";
      options = {
        desc = "Switch to Other Buffer";
      };
    }

    # {
    #   mode = "n";
    #   key = "<leader>`";
    #   action = "<cmd>e #<cr>";
    #   options = {
    #     desc = "Switch to Other Buffer";
    #   };
    # }

    {
      mode = "n";
      key = "<leader>bl";
      action = "<cmd>BufferLineCloseRight<cr>";
      options = {
        desc = "Delete buffers to the right";
      };
    }

    {
      mode = "n";
      key = "<leader>bh";
      action = "<cmd>BufferLineCloseLeft<cr>";
      options = {
        desc = "Delete buffers to the left";
      };
    }

    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = {
        desc = "Delete other buffers";
      };
    }

    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options = {
        desc = "Toggle pin";
      };
    }

    {
      mode = "n";
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options = {
        desc = "Delete non-pinned buffers";
      };
    }
  ];
  extraConfigLua = ''
    ---@param buf number?
    function bufremove(buf)
      buf = buf or 0
      buf = buf == 0 and vim.api.nvim_get_current_buf() or buf

      if vim.bo.modified then
        local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
        if choice == 0 or choice == 3 then -- 0 for <Esc>/<C-c> and 3 for Cancel
          return
        end
        if choice == 1 then -- Yes
          vim.cmd.write()
        end
      end

      for _, win in ipairs(vim.fn.win_findbuf(buf)) do
        vim.api.nvim_win_call(win, function()
          if not vim.api.nvim_win_is_valid(win) or vim.api.nvim_win_get_buf(win) ~= buf then
            return
          end
          -- Try using alternate buffer
          local alt = vim.fn.bufnr("#")
          if alt ~= buf and vim.fn.buflisted(alt) == 1 then
            vim.api.nvim_win_set_buf(win, alt)
            return
          end

          -- Try using previous buffer
          local has_previous = pcall(vim.cmd, "bprevious")
          if has_previous and buf ~= vim.api.nvim_win_get_buf(win) then
            return
          end

          -- Create new listed buffer
          local new_buf = vim.api.nvim_create_buf(true, false)
          vim.api.nvim_win_set_buf(win, new_buf)
        end)
      end
      if vim.api.nvim_buf_is_valid(buf) then
        pcall(vim.cmd, "bdelete! " .. buf)
      end
    end

  '';
}
