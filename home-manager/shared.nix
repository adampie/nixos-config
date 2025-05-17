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
