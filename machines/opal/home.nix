{ config, pkgs, ... }:

{
  imports = [
    ../../roles/common
  ];

  home = {
    stateVersion = "23.05";
  };

}
