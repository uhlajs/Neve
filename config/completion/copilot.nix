{ lib, config, ... }:
{
  options = {
    copilot.enable = lib.mkEnableOption "Enable copilot module";
  };
  config = lib.mkIf config.copilot.enable {
    plugins = {
      copilot-lua = {
        enable = true;
        panel.enabled = false;
        suggestion.enabled = false;
      };
      copilot-cmp = {
        enable = true;
      };
      copilot-chat = {
        enable = true;
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>l";
        action = "<cmd>:CopilotChatToggle<cr>";
        options = {
          silent = true;
          desc = "Open Copilot Chat Assistant";
        };
      }
    ];
  };
}
