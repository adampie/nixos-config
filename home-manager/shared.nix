{
  pkgs,
  lib,
  ...
}: {
  home = {
    stateVersion = "24.11";
    homeDirectory = lib.mkForce "/Users/adampie";
    username = "adampie";

    packages = with pkgs; [
      alejandra
      unstable.claude-code
    ];
  };

  programs = {
    zsh.enable = true;
    git.enable = true;
  };
}
