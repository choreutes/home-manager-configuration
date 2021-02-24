{ config, pkgs, ... }:

{
  imports = [
    ../../roles/common
    ../../roles/graphical
    ../../roles/music
    ../../roles/office
    ../../roles/personal
  ];

  home.stateVersion = "20.09";

  home.packages = with pkgs; [
    ark
    gimp
    k3b
    mpv
    okular
  ];

  pam.sessionVariables = {
    LEDGER_HOME = "${config.home.homeDirectory}/Vault/Finanzen";
  };
}
