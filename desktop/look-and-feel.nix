{config, pkgs, ...}:

{
  xdg.dataFile."icons/default/index.theme".text = ''
    [Icon Theme]
    Inherits = breeze_cursors
  '';
}

