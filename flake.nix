{
  description = "Home Manager Standalone configuration of martin";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    shared-flake = {
      url = "github:MartinEllegard/home-manager-shared/main";
      flake = false;
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, shared-flake, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."martin" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          # Shared home configuration used accros multiple nix setup
          (import shared-flake)

          # Home-manager-standalone Config setup
          ./home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
