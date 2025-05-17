{
  inputs,
  system,
  ...
}: let
  shared = import ./shared.nix {inherit inputs system;};
in
  inputs.nix-darwin.lib.darwinSystem (shared.darwinSystemConfig
    // {
      modules = [
        # Darwin modules
        ../darwin/personal.nix

        # Home Manager module
        inputs.home-manager.darwinModules.home-manager
        {
          # Home Manager setup
          home-manager =
            shared.homeManagerConfig
            // {
              users.adampie = import ../home-manager/personal.nix;
            };
        }
      ];
    })
