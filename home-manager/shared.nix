{
  pkgs,
  lib,
  ...
}: {
  home = {
    stateVersion = "24.11";
    homeDirectory = lib.mkForce "/Users/adampie";
    username = "adampie";

    packages = with pkgs; [
      starship
      alejandra
      git
      curl
      jq
      yq
      wget

      unstable.claude-code
      unstable.nerd-fonts.jetbrains-mono
    ];

    file.".hushlogin".text = "";
    file.".ssh/config" = {
      text = ''
        Include ~/.orbstack/ssh/config

        Host *
          IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
      '';
    };
    file.".homebrew/brew.env".text = ''
      export HOMEBREW_NO_INSECURE_REDIRECT=1
      export HOMEBREW_NO_ANALYTICS=1
      export HOMEBREW_CASK_OPTS=--require-sha
      export HOMEBREW_NO_AUTO_UPDATE=1
      export HOMEBREW_NO_ENV_HINTS=1
    '';
    file.".config/ghostty/config".text = ''
      theme = Dracula+
      shell-integration = zsh
      copy-on-select = clipboard
      window-save-state = always
      font = "JetBrainsMono Nerd Font"
      scrollback-lines = 10000
      url-launch = "open"
    '';
    file.".config/starship.toml".text = ''
      "$schema" = 'https://starship.rs/config-schema.json'

      add_newline = true

      [character]
      success_symbol = '[➜](bold green)'

      [package]
      disabled = true

      [cmd_duration]
      format = '[ $duration]($style)'
    '';
  };

  programs = {
    zsh = {
      enable = true;
      history = {
        size = 1000000;
        save = 1000000;
        path = "~/.zsh_history";
      };
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      historySubstringSearch.enable = true;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    git = {
      enable = true;
      userName = "Adam Pietrzycki";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };
  };
}
