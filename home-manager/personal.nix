{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./shared.nix
    ./files/personal.nix
    ./packages/personal.nix
    ./programs/personal.nix
  ];
}
