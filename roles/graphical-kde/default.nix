{ config, pkgs, ... }:

{
  imports = [
    ../graphical
  ];

  home.packages = with pkgs; [
    kaddressbook
    kcalc
    kdeconnect
    kontact
    korganizer
    kmail
    plasma-nm
    syncthingtray
    wacomtablet
  ];
}
