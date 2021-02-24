{ config, pkgs, ... }:

{
  imports = [
    ../graphical
  ];

  pam.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  programs.firefox.package = pkgs.firefox-wayland;

  xdg = {
    configFile = {
      "sway/config".source = ../../dotfiles/sway/config;
      "waybar/config".source = ../../dotfiles/waybar/config;
      "waybar/style.css".source = ../../dotfiles/waybar/style.css;
    };
  };
}
