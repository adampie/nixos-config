{...}: {
  programs.git = {
    enable = true;
    userName = "Adam Pietrzycki";
  };

  #  # Example: Configure Zsh
  #  programs.zsh = {
  #    enable = true;
  #    enableAutosuggestions = true;
  #    enableCompletion = true;
  #
  #    # Add your custom Zsh configuration here
  #    initExtra = ''
  #      # Your custom Zsh configuration
  #    '';
  #  };

  #  # Example: Configure Starship prompt
  #  programs.starship = {
  #    enable = true;
  #    # Add your custom Starship configuration here
  #  };
  #
  #  # Example: Configure Vim/Neovim
  #  programs.vim = {
  #    enable = true;
  #    # Add your custom Vim configuration here
  #  };
  #
  #  # Add more program configurations as needed
}
