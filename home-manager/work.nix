{pkgs, ...}: {
  home = {
    stateVersion = "24.11";
    homeDirectory = builtins.toPath "/Users/adampie";
    username = "adampie";
    packages = with pkgs; [
      dive
      pkgs.unstable.claude-code
    ];
  };
}
