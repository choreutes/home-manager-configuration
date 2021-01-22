{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraConfig = builtins.readFile ./init.vim;

    plugins = with pkgs.vimPlugins; [
      awesome-vim-colorschemes
      vim-airline
      vim-airline-themes
      vim-colorschemes
      vim-ledger
      vim-nix
    ];
  };
}
