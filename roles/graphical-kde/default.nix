{ config, pkgs, ... }:

{
  imports = [
    ../graphical
  ];

  home.packages = with pkgs; [
    ark
    kaddressbook
    kcalc
    kdeconnect
    kontact
    korganizer
    kmail
    plasma-nm
    wacomtablet
  ];
}
