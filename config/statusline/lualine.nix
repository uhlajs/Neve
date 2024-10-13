{
  plugins.lualine = {
    enable = true;
    settings = {
        alwaysDivideMiddle = true;
        globalstatus = true;
        ignoreFocus = ["neo-tree"];
        extensions = ["fzf"];
        theme = "auto";
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          left = "█"; # 
          right = "█"; # 
        };
        sections = {
          lualine_a = ["mode"];
          lualine_b = [
            {
              __unkeyed = "branch";
              icon.__unkeyed = "";
            }
            "diff"
            "diagnostics"
          ];
          lualine_c = ["filename"];
          lualine_x = ["filetype"];
          lualine_y = ["progress"];
          # lualine_z = [''" " .. os.date("%R")''];
        };
      };
    };
}
