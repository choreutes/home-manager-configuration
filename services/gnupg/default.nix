{ config, pkgs, ... }:

{
  programs.gpg = {
    enable = true;

    settings = {
      charset = "utf-8";

      keyid-format = "0xlong";

      cert-digest-algo = "SHA512";
      personal-digest-preferences = "SHA512";
      default-preference-list = "SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed";
    };
  };

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
