{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    calibre
    youtube-dl
  ];

  imports = [
    ../../programs/ledger
  ];
}
