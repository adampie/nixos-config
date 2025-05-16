{...}: {
  homebrew = {
    enable = true;
    taps = [];
    brews = [];
    casks = [
      # Development tools
      "beyond-compare"
      "cursor"
      "datagrip"
      "goland"
      "intellij-idea"
      "proxyman"
      "pycharm"
      "tower"
      "orbstack"

      # System utilities
      "1password"
      "1password-cli"
      "cleanshot"
      "daisydisk"
      "ghostty"
      "little-snitch"
      "micro-snitch"

      # Communication & productivity
      "slack"
      "superwhisper"

      # ML/AI tools
      "lm-studio"
    ];

    masApps = {
      "1Password for Safari" = 1569813296;
      "Flighty" = 1358823008;
      "Kagi for Safari" = 1622835804;
      "Wipr 2" = 1662217862;
    };
  };
}
