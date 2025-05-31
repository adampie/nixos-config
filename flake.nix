{
  description = "NixOS config by adampie";

  inputs = {
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    flake-schemas.url = "https://flakehub.com/f/DeterminateSystems/flake-schemas/*";
    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";

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
    flake-schemas,
    nixpkgs,
    nix-darwin,
    home-manager,
    nixpkgs-unstable,
    ...
  }: {
    schemas = flake-schemas.schemas;

    darwinConfigurations = {
      "Adams-MacBook-Pro" = import ./hosts/macbook {
        inherit inputs;
        system = "aarch64-darwin";
      };
      "Adams-Work-MacBook-Pro" = import ./hosts/macbook-work {
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
