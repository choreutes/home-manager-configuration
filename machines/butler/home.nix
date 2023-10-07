{ config, pkgs, ... }:

{
  imports = [
    ../../roles/common
    ../../roles/gaming
    ../../roles/graphical-kde
    ../../roles/music
    ../../roles/office
    ../../roles/personal

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

    sessionVariables = {
      LEDGER_HOME = "${config.home.homeDirectory}/Vault/Finanzen";
    };

    stateVersion = "20.09";
  };
}
