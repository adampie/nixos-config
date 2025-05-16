{
  inputs,
  system,
  ...
}: {
  darwinConfig = inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ../modules/shared
      ../modules/darwin
      ../modules/profiles/personal
      {
        nixpkgs = {
          hostPlatform = system;
          config = {
            allowUnfree = true;
          };
          overlays = [
            (final: prev: {
              unstable = import inputs.nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
              };
            })
          ];
        };
        system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
      }
    ];
  };
}
