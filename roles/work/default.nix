{ config, pkgs, ... }:

{
  imports = [
    ../../programs/latex
    ../../programs/papis
  ];

  home.packages = with pkgs; [
    openconnect
    pdftk
    qpdf
    subversion
  ];

  pam.sessionVariables = {
    SUBVERSION_HOME = "${config.xdg.configHome}/subversion";
  };

  programs.zsh.shellAliases = {
    "svn" = "svn --config-dir ${config.xdg.configHome}/subversion";
  };
}
