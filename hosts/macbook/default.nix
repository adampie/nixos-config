{
  inputs,
  system,
  ...
}: let
  shared = import ../shared.nix {inherit inputs system;};
in
  inputs.nix-darwin.lib.darwinSystem (shared.darwinSystemConfig
    // {
      modules = [
        ../../darwin/personal.nix
        inputs.home-manager.darwinModules.home-manager
        {
          home-manager =
            shared.homeManagerConfig
            // {
              users.adampie = { pkgs, lib, ... }: import ../../home-manager/personal.nix { inherit pkgs lib; };
            };
        }
      ];
    })
