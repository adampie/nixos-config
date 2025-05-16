{
  inputs,
  system,
  ...
}: {
  darwinConfig = inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    modules = [
      ../modules/shared
      ../modules/darwin
      ../modules/profiles/work
      {
        nixpkgs.hostPlatform = system;
        system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
      }
    ];
  };
}
