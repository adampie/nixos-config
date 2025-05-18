{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    awscli
    cosign
    curl
    ghorg
    git
    gnupg
    jq
    mise
    ripgrep
    starship
    tldr
    watch
    wget
    yq

    unstable.codex
    unstable.claude-code
    unstable.nerd-fonts.jetbrains-mono
  ];
}
