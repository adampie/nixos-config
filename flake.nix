{
  description = "NixOS config by adampie";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    nixpkgs-unstable,
  }: let
    system = "aarch64-darwin";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    unstable-pkgs = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    configuration = {pkgs, ...}: {
      nixpkgs.config.allowUnfree = true;
      nixpkgs.overlays = [
        (final: prev: {
          unstable = unstable-pkgs;
        })
      ];

      environment.systemPackages = with pkgs; [
        alejandra
        cosign
        curl
        dive
        ghorg
        git
        gnupg
        neofetch
        ripgrep
        starship
        tldr
        vim
        watch

        unstable.claude-code
        unstable.mise
      ];

      homebrew = {
        enable = true;
        taps = [];
        brews = [];
        casks = [
          "1password"
          "1password-cli"
          "beyond-compare"
          "cleanshot"
          "cursor"
          "daisydisk"
          "datagrip"
          "ghostty"
          "goland"
          "intellij-idea"
          "little-snitch"
          "lm-studio"
          "micro-snitch"
          "orbstack"
          "proxyman"
          "pycharm"
          "slack"
          "superwhisper"
          "tower"
        ];

        masApps = {
          "1Password for Safari" = 1569813296;
          "Flighty" = 1358823008;
          "Kagi for Safari" = 1622835804;
          "Wipr 2" = 1662217862;
        };
      };

      nix.settings.experimental-features = "nix-command flakes";
      programs.zsh.enable = true;
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 5;
      nixpkgs.hostPlatform = system;

      fonts.packages = [];

      # Security
      security.pam.enableSudoTouchIdAuth = true;
      system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

      # Dock
      system.defaults.dock.autohide = true;
      system.defaults.dock.autohide-time-modifier = 0.4;
      system.defaults.dock.show-recents = false;
      system.defaults.dock.tilesize = 30;

      # Finder
      system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
      system.defaults.NSGlobalDomain.AppleShowAllFiles = true;
      system.defaults.finder.FXDefaultSearchScope = "SCcf";
      system.defaults.finder.FXRemoveOldTrashItems = true;
      system.defaults.NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;

      # Mission Control
      system.defaults.WindowManager.EnableStandardClickToShowDesktop = false;
      system.defaults.dock.mru-spaces = false;

      # Trackpad
      system.defaults.trackpad.Clicking = true;
      system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;
      system.defaults.NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;

      # Windows
      system.defaults.WindowManager.EnableTiledWindowMargins = false;
    };
  in {
    darwinConfigurations."Adams-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [configuration];
    };
  };
}
