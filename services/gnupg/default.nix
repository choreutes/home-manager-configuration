{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;

    extraConfig = ''
      Host opal.choreutes.de
        RemoteForward /run/user/1000/gnupg/S.gpg-agent /run/user/1000/gnupg/S.gpg-agent.extra
        RemoteForward /run/user/1000/gnupg/S.gpg-agent.ssh /run/user/1000/gnupg/S.gpg-agent.ssh
    '';
  };

  services.gpg-agent = {
    enable = true;

    enableExtraSocket = true;

    enableSshSupport = true;
    sshKeys = [ "178D43591E8A412D0AA5098567E5AEF509BB3C0A" ];
  };
}
