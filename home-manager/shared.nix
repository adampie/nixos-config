{
  pkgs,
  lib,
  ...
}: {
  home = {
    stateVersion = "24.11";
    username = "adampie";
    homeDirectory = lib.mkForce "/Users/adampie";
    packages = with pkgs; [
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
      unstable.claude-code
      unstable.nerd-fonts.jetbrains-mono
      watch
      wget
      yq
    ];

    activation.ensureKnownHosts = lib.hm.dag.entryAfter ["writeBoundary"] ''
      KNOWN_HOSTS="$HOME/.ssh/known_hosts"
      mkdir -p "$(dirname "$KNOWN_HOSTS")"
      touch "$KNOWN_HOSTS"
      add_host() {
        host="$1"
        key="$2"
        if ! grep -qF "$host $key" "$KNOWN_HOSTS"; then
          echo "$host $key" >> "$KNOWN_HOSTS"
        fi
      }
      add_host "github.com" "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg="
      add_host "github.com" "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl"
      add_host "github.com" "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk="
      add_host "gitlab.com" "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFSMqzJeV9rUzU4kWitGjeR4PWSa29SPqJ1fVkhtj3Hw9xjLVXVYrU9QlYWrOLXBpQ6KWjbjTDTdDkoohFzgbEY="
      add_host "gitlab.com" "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf"
      add_host "gitlab.com" "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsj2bNKTBSpIYDEGk9KxsGh3mySTRgMtXL583qmBpzeQ+jqCMRgBqB98u3z++J1sKlXHWfM9dyhSevkMwSbhoR8XIq/U0tCNyokEi/ueaBMCvbcTHhO7FcwzY92WK4Yt0aGROY5qX2UKSeOvuP4D6TPqKF1onrSzH9bx9XUf2lEdWT/ia1NEKjunUqu1xOB/StKDHMoX4/OKyIzuS0q/T1zOATthvasJFoPrAjkohTyaDUz2LN5JoH839hViyEG82yB+MjcFV5MU3N1l1QL3cVUCh93xSaua1N85qivl+siMkPGbO5xR/En4iEY6K2XPASUEMaieWVNTRCtJ4S8H+9"
    '';

    activation.gnupgPermissions = lib.mkIf pkgs.stdenv.isDarwin ''
      mkdir -p "$HOME/.gnupg"
      ${pkgs.gnupg}/bin/gpg --list-keys || true
      chown -R "$USER:$(id -gn)" "$HOME/.gnupg"
      chmod 700 "$HOME/.gnupg"
      chmod 600 "$HOME/.gnupg"/*
    '';

    file.".config/ghostty/config".text = ''
      theme = Dracula+
      shell-integration = zsh
      copy-on-select = clipboard
      window-save-state = always
      font-family = "JetBrainsMono Nerd Font"
    '';

    file.".config/starship.toml".text = ''
      "$schema" = 'https://starship.rs/config-schema.json'

      add_newline = true

      [character]
      success_symbol = '[➜](bold green)'

      [cmd_duration]
      format = '[ $duration]($style)'

      [package]
      disabled = true
    '';

    file.".homebrew/brew.env".text = ''
      export HOMEBREW_NO_ANALYTICS=1
      export HOMEBREW_CASK_OPTS=--require-sha
      export HOMEBREW_NO_AUTO_UPDATE=1
      export HOMEBREW_NO_ENV_HINTS=1
      export HOMEBREW_NO_INSECURE_REDIRECT=1
    '';

    file.".hushlogin".text = "";

    file.".ssh/config".text = ''
      Include ~/.orbstack/ssh/config

      Host *
        IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';

    file."Code/.keep".text = "";
    file."Screenshots/.keep".text = "";
  };

  programs = {
    git = {
      enable = true;
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
      userName = "Adam Pietrzycki";
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    zsh = {
      autosuggestion.enable = true;
      enable = true;
      enableCompletion = true;
      history = {
        save = 1000000;
        size = 1000000;
      };
      historySubstringSearch.enable = true;
      syntaxHighlighting.enable = true;
    };
  };
}
