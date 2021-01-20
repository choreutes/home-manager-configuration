{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    openconnect
    papis
    pdftk
    qpdf
    subversion
  ];

  pam.sessionVariables = {
    SUBVERSION_HOME = "${config.xdg.configHome}/subversion";
  };

  programs.texlive = {
    enable = true;

    extraPackages = tpkgs: {
      inherit (tpkgs)

      collection-basic

      collection-bibtexextra

      collection-fontsextra
      collection-fontsrecommended
      collection-fontutils

      collection-langenglish
      collection-langgerman

      collection-latex
      collection-latexextra
      collection-latexrecommended
      collection-luatex

      collection-mathscience
      collection-pictures;
    };
  };

  xdg.configFile = {
    "papis/config".source = ../../dotfiles/papis/config;
  };
}
