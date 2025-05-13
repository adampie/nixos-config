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
        vim
        ripgrep
        watch
        tldr
        dive
        cosign
        neofetch
        alejandra

        unstable.claude-code
        unstable.jetbrains.idea-ultimate
      ];

      homebrew = {
        enable = true;
        taps = [];
        brews = [];
        casks = [
          "ghostty"
          "1password"
          "1password-cli"
          "tower"
        ];

        masApps = {
          "1Password for Safari" = 1569813296;
          "Kagi for Safari" = 1622835804;
          "Flighty" = 1358823008;
          "Wipr 2" = 1662217862;
        };
      };

      nix.settings.experimental-features = "nix-command flakes";
      programs.zsh.enable = true;
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 5;
      nixpkgs.hostPlatform = system;

      security.pam.enableSudoTouchIdAuth = true;
      system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;
    };
  in {
    darwinConfigurations."Adams-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [configuration];
    };
  };
}
