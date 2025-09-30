{ lib, config, ... }:
{
  options = {
    lsp-nvim.enable = lib.mkEnableOption "Enable lsp-nvim module";
  };
  config = lib.mkIf config.lsp-nvim.enable {
    plugins.lspconfig.enable = true;
    lsp = {
      servers = {
        clangd = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        nixd = {
          enable = true;
        };
        pyright = {
          enable = true;
        };
        ruff = {
          enable = true;
        };
      };
      keymaps = [
        {
          key = "gd";
          lspBufAction = "definition";
        }
        {
          key = "gD";
          lspBufAction = "references";
        }
        {
          key = "gt";
          lspBufAction = "type_definition";
        }
        {
          key = "gi";
          lspBufAction = "implementation";
        }
        {
          key = "K";
          lspBufAction = "hover";
        }
        {
          key = "<leader>cw";
          lspBufAction = "workspace_symbol";
        }
        {
          key = "<leader>cr";
          lspBufAction = "rename";
        }
        {
          key = "<leader>ca";
          lspBufAction = "code_action";
        }
        {
          key = "<C-k>";
          lspBufAction = "signature_help";
        }
        {
          action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=-1, float=true }) end";
          key = "]d";
        }
        {
          action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=1, float=true }) end";
          key = "[d";
        }
        {
          action = "<CMD>LspStop<Enter>";
          key = "<leader>lx";
        }
        {
          action = "<CMD>LspStart<Enter>";
          key = "<leader>ls";
        }
        {
          action = "<CMD>LspRestart<Enter>";
          key = "<leader>lr";
        }
        # {
        #   action = lib.nixvim.mkRaw "require('telescope.builtin').lsp_definitions";
        #   key = "gd";
        # }
        # {
        #   action = "<CMD>Lspsaga hover_doc<Enter>";
        #   key = "K";
        # }
      ];
    };
    extraConfigLua = ''
          local _border = "rounded"

          require('lspconfig.ui.windows').default_options = {
            border = _border
          }

          vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
              border = _border
            }
          )

          vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
              border = _border
            }
          )

          vim.diagnostic.config({
      			float = { border = "rounded" },
      			virtual_text = {
      				prefix = "",
      			},
            signs = true,
            underline = true,
            update_in_insert = true,
      		})
    '';
  };
}
