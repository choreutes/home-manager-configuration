{ config, pkgs, ... }:

{
  imports = [
    ../../roles/common
    ../../roles/graphical
    ../../roles/personal
  ];

  home.stateVersion = "20.09";

  home.packages = with pkgs; [
    ark
    cantata
    ffmpeg
    flac
    gimp
    kid3
    k3b
    mpv
    okular
  ];

  pam.sessionVariables = {
    LEDGER_HOME = "${config.home.homeDirectory}/Vault/Finanzen";
  };

  programs = {
    # zsh = {
    #   enable = true;
    #   enableAutosuggestions = true;
    #   enableCompletion = true;
    #   defaultKeymap = "viins";
    #   dotDir = ".config/zsh";
    #   history = {
    #     ignoreDups = true;
    #     size = 10000;
    #   };
    # };
  };

  services = {
    mpd = {
      enable = true;
      musicDirectory = "${config.home.homeDirectory}/Musik";
    };
  };
}
