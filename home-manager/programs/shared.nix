{...}: {
  programs.git = {
    enable = true;
    extraConfig = {init = {defaultBranch = "main";};};
    userName = "Adam Pietrzycki";
  };

  programs.mise = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
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
}
