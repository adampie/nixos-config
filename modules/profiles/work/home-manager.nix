{
  config,
  pkgs,
  inputs,
  ...
}: {
  home-manager = {
    users.adampie = {
      home.stateVersion = "24.11";
      home.homeDirectory = "/Users/adampie";
      home.username = "adampie";
    };
  };

  users.users.adampie = {
    home = "/Users/adampie";
    name = "adampie";
  };
}
