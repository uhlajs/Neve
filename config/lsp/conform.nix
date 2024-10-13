{ pkgs, ... }:
{
  # TODO (Honza Uhlik): Remove this bugfix after this issue is resolved
  #   https://github.com/nix-community/nixvim/issues/1141#issuecomment-2054102360
  extraPackages = with pkgs; [ nixfmt ];

  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_on_error = true;
      # default_format_opts = {
      #   lsp_format = "fallback";
      # };
      # format_after_save = {
      #   lsp_format = "fallback";
      # };
      format_on_save = {
        timeoutMs = 500;
        lspFallback = true;
      };
      formatters_by_ft = {
        html = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        css = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        python = ["ruff" "ruff_format" "ruff_organize_imports"];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        markdown = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        rust = [ "rustfmt" ];
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>uf";
      action = ":FormatToggle<CR>";
      options = {
        desc = "Toggle Format Globally";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>uF";
      action = ":FormatToggle!<CR>";
      options = {
        desc = "Toggle Format Locally";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Buffer";
      };
    }

    {
      mode = "v";
      key = "<leader>cF";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Lines";
      };
    }
  ];
}
