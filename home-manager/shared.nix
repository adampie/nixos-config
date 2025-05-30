{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./dotfiles/shared.nix
    ./packages/shared.nix
    ./programs/shared.nix
  ];

  home.stateVersion = "24.11";
  home.username = "adampie";
  home.homeDirectory = lib.mkForce "/Users/adampie";

  home.activation.gnupgPermissions = lib.mkIf pkgs.stdenv.isDarwin ''
    mkdir -p "$HOME/.gnupg"
    ${pkgs.gnupg}/bin/gpg --list-keys || true
    chown -R "$USER:$(id -gn)" "$HOME/.gnupg"
    chmod 700 "$HOME/.gnupg"
    chmod 600 "$HOME/.gnupg"/*
  '';
}
