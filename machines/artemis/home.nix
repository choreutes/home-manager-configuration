{ config, pkgs, ... }:

{
  imports = [
    ../../roles/common
    ../../roles/graphical-wayland
    ../../roles/work
  ];

  home.stateVersion = "20.03";
}
