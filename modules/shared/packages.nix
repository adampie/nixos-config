{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    cosign
    curl
    ghorg
    git
    gnupg
    ripgrep
    starship
    tldr
    vim
    watch

    unstable.mise
  ];
}
