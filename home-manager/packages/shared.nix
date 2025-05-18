{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
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
    unstable.codex
    unstable.claude-code
    unstable.nerd-fonts.jetbrains-mono
    watch
    wget
    yq
  ];
}
