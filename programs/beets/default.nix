{ config, pkgs, ... }:

{
  programs.beets.enable = true;

  xdg.configFile."beets/config.yaml".source = ./config.yaml;
}
