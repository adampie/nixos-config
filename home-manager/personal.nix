{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./shared.nix
    ./dotfiles/personal.nix
    ./packages/personal.nix
    ./programs/personal.nix
  ];
}
