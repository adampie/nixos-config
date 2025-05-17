{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./shared.nix
  ];

  home.packages = with pkgs; [
    neofetch
  ];

  programs = {};
}
