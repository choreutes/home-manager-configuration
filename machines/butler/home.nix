{ config, pkgs, ... }:

{
  imports = [
    ../../roles/common
    ../../roles/gaming
    ../../roles/graphical
    ../../roles/music
    ../../roles/office
    ../../roles/personal
  ];

  home = {
    packages = with pkgs; [
      ark
      gimp
      k3b
      mpv
      okular
    ];

    sessionVariables = {
      LEDGER_HOME = "${config.home.homeDirectory}/Vault/Finanzen";
    };

    stateVersion = "20.09";
  };
}
