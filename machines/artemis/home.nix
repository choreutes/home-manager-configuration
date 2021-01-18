{ config, pkgs, ... }:

{
  imports = [
    ../../desktop/look-and-feel.nix
  ];

  home = {
    username = "choreutes";
    homeDirectory = "/home/choreutes";

    packages = with pkgs; [
      cmst
      lxqt.lximage-qt
      lxqt.pavucontrol-qt
      lxqt.pcmanfm-qt
      mpv
      openconnect
      papis
      pdftk
      qpdf
      qpdfview
      ranger
      retroarch
      subversion
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };

    stateVersion = "20.03";
  };

  programs = {
    home-manager.enable = true;

    firefox = {
      enable = true;

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
      ];

      package = pkgs.firefox-wayland;
    };

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

    qutebrowser = {
      enable = true;

      settings = {
        colors.tabs = {
          selected = {
            even = {
              bg = "#eff0f1";
              fg = "#232627";
            };
            odd = {
              bg = "#eff0f1";
              fg = "#232627";
            };
          };
        };

        content.default_encoding = "utf-8";

        downloads.position = "bottom";

        scrolling = {
          smooth = true;
        };

        tabs.show = "multiple";
      };
    };

    texlive = {
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

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  pam.sessionVariables = {
    BROWSER = "qutebrowser";
    EDITOR = "nvim";
    GNUPGHOME = "${config.xdg.configHome}/gnupg";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    SUBVERSION_HOME = "${config.xdg.configHome}/subversion";
    TERMINAL = "kitty";
  };

  xdg = {
    enable = true;

    configFile = {
      "kitty/kitty.conf".source = ../../dotfiles/kitty/kitty.conf;
      "kitty/colorschemes/papercolor-dark.conf".source = ../../dotfiles/kitty/colorschemes/papercolor-dark.conf;
      "kitty/colorschemes/papercolor-light.conf".source = ../../dotfiles/kitty/colorschemes/papercolor-light.conf;
      "papis/config".source = ../../dotfiles/papis/config;
      "sway/config".source = ../../dotfiles/sway/config;
      "waybar/config".source = ../../dotfiles/waybar/config;
      "waybar/style.css".source = ../../dotfiles/waybar/style.css;
    };
  };

}
