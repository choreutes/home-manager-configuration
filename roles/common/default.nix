{ config, pkgs, ... }:

{
  imports = [
    ../../programs/khal
    ../../programs/neovim
    ../../programs/vdirsyncer
  ];

  home = {
    username = "choreutes";
    homeDirectory = "/home/choreutes";

    packages = with pkgs; [
      khard
      mtpfs
      parallel
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

      settings = {
        account_guest_in_cpu_meter = false;
        color_scheme = 0;
        cpu_count_from_zero = false;
        delay = 15;
        detailed_cpu_time = false;
        enable_mouse = true;
        fields = [ 0 48 17 18 38 39 40 2 46 47 49 1 ];
        header_margin = true;

        hide_threads = false;
        hide_kernel_threads = true;
        hide_userland_threads = true;

        highlight_base_name = true;
        highlight_megabytes = true;
        highlight_threads = true;

        left_meters = [ "AllCPUs2" "Memory" "Swap" ];
        left_meter_modes = [ 1 1 1 ];
        right_meters = [ "Tasks" "Uptime" "Systemd" ];
        right_meter_modes = [ 2 2 2 ];

        shadow_other_users = false;

        show_cpu_frequency = false;
        show_cpu_usage = false;

        show_program_path = false;
        show_thread_names = false;

        tree_view = true;
        update_process_names = false;

        vim_mode = true;
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
        "tree" = "tree -C";
      };
    };
  };

  xdg.enable = true;
}
