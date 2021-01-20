{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];

  xdg.configFile = {
    "kitty/kitty.conf".source = ./kitty.conf;
    "kitty/colorschemes/papercolor-dark.conf".source = ./colorschemes/papercolor-dark.conf;
    "kitty/colorschemes/papercolor-light.conf".source = ./colorschemes/papercolor-light.conf;
  };
}
