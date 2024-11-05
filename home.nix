{ config, pkgs, ... }:
let
  home-manager-shared = builtins.fetchGit {
    url = "https://github.com/MartinEllegard/home-manager-shared";
    rev = "2319ad341a26546ecf750119a92932854539ef37";
  };
in
{
  imports = [
    (home-manager-shared + "/modules")
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
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

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.hyprland
    pkgs.hyprpaper
    pkgs.hyprlock
    pkgs.hyprcursor
    pkgs.mako
    pkgs.wl-clipboard
    pkgs.xclip

    pkgs.gruvbox-gtk-theme
    pkgs.gruvbox-plus-icons

    # Create nerd font
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.git = {
    enable = true;
    userName = "Martin Ellegård";
    userEmail = "martin.ellegard@gmail.com";
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

    ".config/hypr".source = ./dotfiles/hypr;
    ".config/waybar".source = ./dotfiles/waybar;
    ".config/mako".source = ./dotfiles/mako;
    ".config/wofi".source = ./dotfiles/wofi;

    ".config/foot".source = ./dotfiles/foot;

    ".config/gtk-3.0".source = ./dotfiles/gtk-3.0;
    ".config/gtk-4.0".source = ./dotfiles/gtk-4.0;

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/martin/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
