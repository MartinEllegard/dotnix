{
  description = "Home Manager configuration of martin";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # configuration = { pkgs, ... }: {
      #   environment.systemPackages = [
      #     pkgs.vim
      #     pkgs.git
      #     pkgs.xclip
      #     pkgs.wl-clipboard
      #     pkgs.hyprland
      #     pkgs.mako
      #     pkgs.hyprlock
      #     pkgs.hyprpaper
      #     pkgs.hyprcursor
      #   ];
      # };
    in
    {
      homeConfigurations."martin" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          # {
          #   wayland.windowManager.hyprland = {
          #     enable = true;
          #     # set the flake package
          #     package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
          #   };
          # }
          #configuration
          ./home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
