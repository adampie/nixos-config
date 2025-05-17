{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./shared.nix
  ];

  home.packages = with pkgs; [
    dive
  ];

  programs = {};
}
