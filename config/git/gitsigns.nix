{ lib, config, ... }:
{
  options = {
    gitsigns.enable = lib.mkEnableOption "Enable gitsigns module";
  };
  config = lib.mkIf config.gitsigns.enable {
    plugins.gitsigns = {
      enable = true;
      settings = {
        trouble = true;
        current_line_blame = false;
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>gb";
        action = ":Gitsigns blame<CR>";
        options = {
          silent = true;
          desc = "Blame file";
        };
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>gs";
        action = "gitsigns";
        options = {
          silent = true;
          desc = "+hunks";
        };
      }
      {
        mode = "n";
        key = "<leader>gsb";
        action = ":Gitsigns blame_line<CR>";
        options = {
          silent = true;
          desc = "Blame line";
        };
      }
      {
        mode = "n";
        key = "<leader>gsd";
        action = ":Gitsigns diffthis<CR>";
        options = {
          silent = true;
          desc = "Diff This";
        };
      }
      {
        mode = "n";
        key = "<leader>gsh";
        action = ":Gitsigns preview_hunk<CR>";
        options = {
          silent = true;
          desc = "Preview hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>gsl";
        action = ":Gitsigns preview_hunk_inline<CR>";
        options = {
          silent = true;
          desc = "Preview hunk line";
        };
      }
      {
        mode = "n";
        key = "<leader>gsR";
        action = ":Gitsigns reset_buffer<CR>";
        options = {
          silent = true;
          desc = "Reset Buffer";
        };
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>gsr";
        action = ":Gitsigns reset_hunk<CR>";
        options = {
          silent = true;
          desc = "Reset Hunk";
        };
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>gss";
        action = ":Gitsigns stage_hunk<CR>";
        options = {
          silent = true;
          desc = "Stage Hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>gsS";
        action = ":Gitsigns stage_buffer<CR>";
        options = {
          silent = true;
          desc = "Stage Buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>gsu";
        action = ":Gitsigns undo_stage_hunk<CR>";
        options = {
          silent = true;
          desc = "Undo Stage Hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>gsn";
        action = ":Gitsigns nav_hunk next<CR>";
        options = {
          silent = true;
          desc = "Jump to Next Hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>gsp";
        action = ":Gitsigns nav_hunk prev<CR>";
        options = {
          silent = true;
          desc = "Jump to Previous Hunk";
        };
      }
    ];
  };
}
