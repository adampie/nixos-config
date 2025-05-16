{...}: {
  imports = [
    ../../shared/home-manager.nix
  ];

  programs.git = {
    userEmail = "adam@pietrzycki.com";
  };
}
