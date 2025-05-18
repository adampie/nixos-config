{pkgs, ...}: {
  home.packages = with pkgs; [
    dive
    just
    kubectl
    kubernetes-helm
  ];
}
