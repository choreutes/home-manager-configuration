{ config, pkgs, ... }:

{
  imports = [
    ../../programs/kitty
  ];

  home.packages = with pkgs; [
    cmst
    lxqt.lximage-qt
    lxqt.pavucontrol-qt
    lxqt.pcmanfm-qt
    mpv
    qpdfview
    thunderbird
    vivaldi
  ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    firefox = {
      enable = true;

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
      ];
    };

    qutebrowser = {
      enable = true;

      settings = {
        colors.tabs = {
          selected = {
            even = {
              bg = "#eff0f1";
              fg = "#232627";
            };
            odd = {
              bg = "#eff0f1";
              fg = "#232627";
            };
          };
        };

        content.default_encoding = "utf-8";

        downloads.position = "bottom";

        scrolling = {
          smooth = true;
        };

        tabs.show = "multiple";
      };
    };
  };

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  pam.sessionVariables = {
    BROWSER = "qutebrowser";
    TERMINAL = "kitty";
  };

  services.syncthing.enable = true;

  xdg.dataFile."icons/default/index.theme".text = ''
    [Icon Theme]
    Inherits = breeze_cursors
  '';
}
