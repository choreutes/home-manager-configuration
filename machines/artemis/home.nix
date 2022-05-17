{ config, pkgs, ... }:

{
  imports = [
    ../../roles/common
    ../../roles/graphical
    ../../roles/office
    ../../roles/personal
    ../../roles/work
  ];

  home = {
    sessionVariables = {
      LEDGER_HOME = "${config.home.homeDirectory}/Finanzen";
    };

    stateVersion = "21.11";
  };

}
