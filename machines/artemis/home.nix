{ config, pkgs, ... }:

{
  imports = [
    ../../roles/common
    ../../roles/graphical-kde
    ../../roles/office
    ../../roles/personal
    ../../roles/work

    ../../features/productivity
  ];

  home = {
    sessionVariables = {
      LEDGER_HOME = "${config.home.homeDirectory}/Finanzen";
    };

    stateVersion = "23.05";
  };

}
