{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    papis
  ];

  programs.zsh.shellAliases = {
    "manual" = "papis --lib manuals";
    "paper" = "papis --lib papers";
  };

  xdg.configFile = {
    "papis/config".source = ./config;
  };
}
