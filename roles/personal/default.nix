{ config, pkgs, ... }:

{
  imports = [
    ../../programs/ledger
  ];

  home.packages = with pkgs; [
    vorbis-tools
  ];
}
