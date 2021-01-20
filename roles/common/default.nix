{ config, pkgs, ... }:

{
  home = {
    username = "choreutes";
    homeDirectory = "/home/choreutes";

    packages = with pkgs; [
      ranger
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  pam.sessionVariables = {
    EDITOR = "nvim";
    GNUPGHOME = "${config.xdg.configHome}/gnupg";
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;

      userName = "Tobias Schmalz";
      userEmail = "github@choreutes.de";

      ignores = [
        "*.aux"
        "*.swp"
      ];
    };

    htop = {
      enable = true;

      hideUserlandThreads = true;
      highlightBaseName = true;
      showProgramPath = false;
      treeView = true;
    };

    neovim = {
      enable = true;

      extraConfig = builtins.readFile ../../dotfiles/neovim/init.vim;

      plugins = with pkgs.vimPlugins; [
        awesome-vim-colorschemes
        vim-airline
        vim-airline-themes
        vim-colorschemes
        vim-nix
      ];
    };

    zsh = {
      enable = true;

      dotDir = ".config/zsh";

      history = {
        path = "${config.xdg.dataHome}/zsh/zsh_history";
      };

      initExtra = ''
        prompt_context(){}
      '';

      oh-my-zsh = {
        enable = true;

        theme = "agnoster";
      };

      shellAliases = {
        "manual" = "papis --lib manuals";
        "paper" = "papis --lib papers";
        "svn" = "svn --config-dir ${config.xdg.configHome}/subversion";
        "tree" = "tree -C";
      };
    };
  };

  xdg.enable = true;
}
