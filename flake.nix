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
      "Adams-MacBook-Pro" = import ./hosts/adams-macbook-pro.nix {
        inherit inputs;
        system = "aarch64-darwin";
      };
      "Adams-Work-MacBook-Pro" = import ./hosts/adams-work-macbook-pro.nix {
        inherit inputs;
        system = "aarch64-darwin";
      };
    };

    homeConfigurations = {
      "adampie@personal" = import ./home-manager/personal.nix;
      "adampie@work" = import ./home-manager/work.nix;
    };

    nixosConfigurations = {};
  };
}
