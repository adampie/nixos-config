{
  description = "NixOS config by adampie";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    nixpkgs-unstable,
  }: let
    systems = {
      darwin = "aarch64-darwin";
      linux = "x86_64-linux";
    };

    mkPkgs = system: {
      config = {
        allowUnfree = true;
      };
      overlays = [
        (final: prev: {
          unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        })
      ];
    };

    mkDarwinConfig = {
      hostName,
      system ? systems.darwin,
      profile,
    }: let
      host = import ./hosts/${profile}-mac.nix {
        inherit inputs system;
      };
    in
      host.darwinConfig;
  in {
    darwinConfigurations = {
      "Adams-MacBook-Pro" = mkDarwinConfig {
        hostName = "Adams-MacBook-Pro";
        profile = "personal";
      };

      "Work-MacBook-Pro" = mkDarwinConfig {
        hostName = "Adams-Work-MacBook-Pro";
        profile = "work";
      };
    };

    nixosConfigurations = {};
  };
}
