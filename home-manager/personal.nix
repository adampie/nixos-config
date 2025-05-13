{pkgs, ...}: {
  home = {
    stateVersion = "24.11";
    homeDirectory = builtins.toPath "/Users/adampie";
    username = "adampie";
    packages = with pkgs; [
      neofetch
      pkgs.unstable.claude-code
    ];
  };
}
