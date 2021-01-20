{ config, pkgs, ... }:

{
  imports = [
    ../../desktop/look-and-feel.nix
    ../../roles/common
    ../../roles/graphical-wayland
    ../../roles/work
  ];

  home.stateVersion = "20.03";
}
