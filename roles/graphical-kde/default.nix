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
    wacomtablet
  ];
}
