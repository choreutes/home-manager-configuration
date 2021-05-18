{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    youtube-dl
  ];

  imports = [
    ../../programs/ledger
  ];
}
