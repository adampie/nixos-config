{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./shared.nix
    ./files/work.nix
    ./packages/work.nix
    ./programs/work.nix
  ];
}
