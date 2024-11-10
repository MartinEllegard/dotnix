{ config, pkgs, inputs, ... }:
{
  home.username = "martin";
  home.homeDirectory = "/home/martin";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Install programs 
  home.packages = [
    # IMPORTANT: These need to be downloaded by system
    # pkgs.mako
    # pkgs.wl-clipboard
    # pkgs.xclip
    # pkgs.waybar

    pkgs.gruvbox-gtk-theme
    pkgs.gruvbox-plus-icons
    pkgs.beekeeper-studio

    # Create nerd font
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  programs = {
    git = {
      enable = true;
      userName = "Martin Ellegård";
      userEmail = "martin.ellegard@gmail.com";
    };
  };

  # environment.shells = [
  #   pkgs.fish
  # ];

  # Import dotfiles/configs
  home.file = {
    ".config/hypr".source = ./dotfiles/hypr;
    ".config/waybar".source = ./dotfiles/waybar;
    ".config/mako".source = ./dotfiles/mako;
    ".config/wofi".source = ./dotfiles/wofi;

    ".config/foot".source = ./dotfiles/foot;
    ".config/wezterm/wezterm.lua".source = ./dotfiles/wezterm/wezterm.lua;
    ".config/wezterm/keybindings-mac.lua".source = ./dotfiles/wezterm/keybindings-mac.lua;

    ".config/gtk-3.0".source = ./dotfiles/gtk-3.0;
    ".config/gtk-4.0".source = ./dotfiles/gtk-4.0;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
