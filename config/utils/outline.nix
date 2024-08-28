{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    outline-nvim
  ];

  extraConfigLua = ''
    require("outline").setup()
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>n";
      action = ":Outline<CR>";
      options = {
        desc = "Symbols Explorer";
        silent = true;
      };
    }
  ];
}
