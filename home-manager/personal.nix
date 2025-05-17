{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./shared.nix
  ];

  home.packages = with pkgs; [
    neofetch
  ];

  programs = {
    git = {
      extraConfig = {
        gpg = {
          format = "ssh";
        };
        "gpg.ssh" = {
          program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        };
        commit = {
          gpgsign = true;
        };
      };
      userEmail = "adam@pietrzycki.com";
      signing = {
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBpWz+23cfr/f+6dYL/19Ce1uTKiQ3Vy3yJy4avkENSc";
        signByDefault = true;
        gpgPath = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
      includes = [
        {
          condition = "gitdir:~/Code/fricory/";
          contents = {
            user = {
              email = "adam@fricory.com";
            };
          };
        }
      ];
    };
  };
}
