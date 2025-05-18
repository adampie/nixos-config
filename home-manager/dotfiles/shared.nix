{...}: {
  home.file.".config/ghostty/config".text = ''
    theme = Dracula+
    shell-integration = zsh
    copy-on-select = clipboard
    window-save-state = always
    font-family = "JetBrainsMono Nerd Font"
    working-directory = home
  '';

  home.file.".config/starship.toml".text = ''
    "$schema" = 'https://starship.rs/config-schema.json'

    add_newline = true

    [character]
    success_symbol = '[➜](bold green)'

    [cmd_duration]
    format = '[ $duration]($style)'

    [package]
    disabled = true
  '';

  home.file.".homebrew/brew.env".text = ''
    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_CASK_OPTS=--require-sha
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_NO_ENV_HINTS=1
    export HOMEBREW_NO_INSECURE_REDIRECT=1
  '';

  home.file.".hushlogin".text = "";

  home.file.".ssh/config".text = ''
    Include ~/.orbstack/ssh/config

    Host *
      IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
  '';

  home.file."Code/.keep".text = "";
  home.file."Screenshots/.keep".text = "";

  home.sessionVariables = {
    NO_TELEMETRY = "1";
    DO_NOT_TRACK = "1";
  };
}
