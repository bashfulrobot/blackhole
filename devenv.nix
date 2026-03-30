{ pkgs, ... }:

{
  packages = with pkgs; [
    opentofu
    kubectl
    kubernetes-helm
    google-cloud-sdk
    just
    _1password-cli
  ];
}
