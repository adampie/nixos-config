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
    ...
  }: {
    darwinConfigurations = {
      "Adams-MacBook-Pro" = import ./hosts/macos.nix {
        inherit inputs;
        system = "aarch64-darwin";
        profile = "personal";
      };
      "Adams-Work-MacBook-Pro" = import ./hosts/macos.nix {
        inherit inputs;
        system = "aarch64-darwin";
        profile = "work";
      };
    };

    homeConfigurations = {
      "adampie@personal" = import ./home-manager/profile.nix {
        profile = "personal";
      };
      "adampie@work" = import ./home-manager/profile.nix {
        profile = "work";
      };
    };

    nixosConfigurations = {};
  };
}
