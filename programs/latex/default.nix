{ config, pkgs, ... }:

{
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
      collection-pictures

      collection-plaingeneric

      latexmk

      tuda-ci
      urcls;
    };
  };
}
