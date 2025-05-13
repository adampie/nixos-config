{
  inputs,
  system,
  ...
}: let
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [
      (final: prev: {
        unstable = import inputs.nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      })
    ];
  };
in
  inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = {inherit inputs pkgs;};
    modules = [
      # Darwin modules
      ../darwin/work.nix

      # Home Manager module
      inputs.home-manager.darwinModules.home-manager
      {
        # Home Manager setup
        home-manager = {
          extraSpecialArgs = {inherit inputs;};
          useGlobalPkgs = true;
          useUserPackages = true;
          users.adampie = {lib, ...}: {
            home = {
              stateVersion = "24.11";
              homeDirectory = lib.mkForce "/Users/adampie";
              username = "adampie";
              packages = with pkgs; [
                dive
                unstable.claude-code
              ];
            };
          };
        };
      }
    ];
  }
