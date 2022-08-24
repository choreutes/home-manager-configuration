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

      collection-plaingeneric

      collection-mathscience
      collection-pictures

      tuda-ci;
      urcls
    };
  };
}
