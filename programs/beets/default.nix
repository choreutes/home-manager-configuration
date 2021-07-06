{ config, pkgs, ... }:

{
  programs.beets = {
    enable = true;

    settings = {
      directory = "~/Musik";
      library = "~/.local/share/beets/library.db";

      ui.color = "yes";

      import = {
        move = "yes";
        write = "no";
      };

      paths = {
        default = "$genre/$albumartist/$album%aunique{}/$track - $title";
        "genre:Ballroom" = "Ballroom/$album%aunique{}/$track - $title ($comments)";
        "genre:Soundtrack" = "Soundtracks/$album%aunique{}/$track - $title";
      };
    };
  };

  # xdg.configFile."beets/config.yaml".source = ./config.yaml;
}
