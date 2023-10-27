{ config, pkgs, ... }:

{
  imports = [
    ../../features/common
  ];

  home = {
    stateVersion = "23.05";
  };

}
