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
in {
  inherit pkgs;

  # Home Manager common setup
  homeManagerConfig = {
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  # Common darwin system configuration
  darwinSystemConfig = {
    inherit system;
    specialArgs = {inherit inputs pkgs;};
  };
}
