{ config, pkgs, ... }:

{
  imports = [
    ../../roles/gaming
    ../../roles/graphical-kde
    ../../roles/music
    ../../roles/office
    ../../roles/personal

    ../../features/common
    ../../features/productivity
  ];

  home = {
    packages = with pkgs; [
      ark
      gimp
      k3b
      mpv
      okular
    ];

    programs.yt-dlp.enable = true;

    sessionVariables = {
      LEDGER_HOME = "${config.home.homeDirectory}/Vault/Finanzen";
    };

    stateVersion = "20.09";
  };
}
