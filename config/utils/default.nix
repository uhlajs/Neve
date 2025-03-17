{
  lib,
  config,
  ...
}:
{
  imports = [
    ./better-escape.nix
    ./cloak.nix
    ./colorizer.nix
    ./harpoon.nix
    ./markdown-preview.nix
    ./mini.nix
    ./neocord.nix
    ./neotest.nix
    ./nvim-autopairs.nix
    ./nvim-surround.nix
    ./nvim-window-picker.nix
    ./nvterm.nix
    ./oil.nix
    ./obsidian.nix
    ./persistence.nix
    ./plenary.nix
    ./project-nvim.nix
    ./sidebar.nix
    ./tmux-navigator.nix
    ./todo-comments.nix
    ./ultimate-autopair.nix
    ./undotree.nix
    ./wakatime.nix
    ./which-key.nix
    ./wilder.nix
  ];

  options = {
    utils.enable = lib.mkEnableOption "Enable utils module";
  };
  config = lib.mkIf config.utils.enable {
    better-escape.enable = lib.mkDefault false;
    cloak.enable = lib.mkDefault false;
    harpoon.enable = lib.mkDefault false;
    markdown-preview.enable = lib.mkDefault false;
    mini.enable = lib.mkDefault true;
    neocord.enable = lib.mkDefault false;
    neotest.enable = lib.mkDefault false;
    nvim-autopairs.enable = lib.mkDefault false;
    colorizer.enable = lib.mkDefault true;
    nvim-surround.enable = lib.mkDefault true;
    nvim-window-picker.enable = lib.mkDefault true;
    nvterm.enable = lib.mkDefault false;
    oil.enable = lib.mkDefault false;
    obsidian.enable = lib.mkDefault true;
    persistence.enable = lib.mkDefault false;
    plenary.enable = lib.mkDefault false;
    project-nvim.enable = lib.mkDefault true;
    sidebar.enable = lib.mkDefault false;
    tmux-navigator.enable = lib.mkDefault true;
    todo-comments.enable = lib.mkDefault true;
    ultimate-autopair.enable = lib.mkDefault true;
    undotree.enable = lib.mkDefault false;
    wakatime.enable = lib.mkDefault false;
    which-key.enable = lib.mkDefault true;
    wilder.enable = lib.mkDefault false;
  };
}
