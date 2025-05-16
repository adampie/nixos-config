{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Packages
    dive

    # Unstable packages
    unstable.claude-code
  ];
}
