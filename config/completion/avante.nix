{ lib, config, ... }:
{
  options = {
    avante.enable = lib.mkEnableOption "Enable avante module";
  };
  config = lib.mkIf config.avante.enable {
    plugins.avante = {
      enable = true;
      settings = {
        provider = "openai";
        providers = {
          openai = {
            endpoint = "https://api.openai.com/v1";
            #model = "gpt-4.1-nano";
            model = "o4-mini";
            extra_request_body = {
              # timeout = 30000; # Timeout in milliseconds, increase this for reasoning models
              # temperature = 0.75;
              # max_completion_tokens = 8192; # Increase this to include reasoning tokens (for reasoning models)
              # reasoning_effort = "medium"; # low|medium|high, only used for reasoning models
            };
          };
        };

        diff = {
          autojump = true;
          debug = false;
          list_opener = "copen";
        };
        highlights = {
          diff = {
            current = "DiffText";
            incoming = "DiffAdd";
          };
        };
        hints = {
          enabled = true;
        };
        mappings = {
          diff = {
            both = "cb";
            next = "]x";
            none = "c0";
            ours = "co";
            prev = "[x";
            theirs = "ct";
          };
        };
        windows = {
          sidebar_header = {
            align = "center";
            rounded = true;
          };
          width = 30;
          wrap = true;
        };

      };
    };
  };
}
