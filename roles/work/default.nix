{ config, pkgs, ... }:

{
  imports = [
    ../../programs/papis
  ];

  home = {
    packages = with pkgs; [
      openconnect
      pdftk
      qpdf
      subversion
      teams
      zoom-us
    ];

    sessionVariables = {
      SUBVERSION_HOME = "${config.xdg.configHome}/subversion";
    };
  };

  programs.zsh.shellAliases = {
    "svn" = "svn --config-dir ${config.xdg.configHome}/subversion";
  };
}
