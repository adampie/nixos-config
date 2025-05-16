{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Packages
    neofetch

    # Unstable packages
    unstable.claude-code
  ];
}
