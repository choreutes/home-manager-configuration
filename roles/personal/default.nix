{ config, pkgs, ... }:

{
  imports = [
    ../../programs/beets
    ../../programs/ledger
  ];

  home.packages = with pkgs; [
    vorbis-tools
  ];
}
