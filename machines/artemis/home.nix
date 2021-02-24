{ config, pkgs, ... }:

{
  imports = [
    ../../roles/common
    ../../roles/graphical-wayland
    ../../roles/office
    ../../roles/work
  ];

  home.stateVersion = "20.03";
}
