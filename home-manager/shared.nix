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
    '';
  };

  programs = {
    zsh.enable = true;

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
