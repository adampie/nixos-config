{
  inputs,
  system,
  profile,
  ...
}: let
  shared = import ./shared.nix {inherit inputs system;};
in
  inputs.nix-darwin.lib.darwinSystem (shared.darwinSystemConfig
    // {
      modules = [
        ../darwin/${profile}.nix
        inputs.home-manager.darwinModules.home-manager
        {
          home-manager =
            shared.homeManagerConfig
            // {
              users.adampie = import ../home-manager/${profile}.nix;
            };
        }
      ];
    })
