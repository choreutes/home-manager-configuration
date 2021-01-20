{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    papis
  ];

  xdg.configFile = {
    "papis/config".source = ./config;
  };
}
