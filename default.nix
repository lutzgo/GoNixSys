{ config, pkgs, lib, ... }:

{
  # Set your time zone.
  time.timeZone = "Europe/Berlin";
  console = {
    earlySetup = true;
    font = "Lat2-Terminus16";
    # Set your keyboard layout
    keyMap = "de";
    colors = [
      "2E3440"
      "3B4252"
      "434C5E"
      "4C566A"
      "D8DEE9"
      "E5E9F0"
      "ECEFF4"
      "8FBCBB"
      "88C0D0"
      "81A1C1"
      "5E81AC"
      "BF616A"
      "D08770"
      "EBCB8B"
      "A3BE8C"
      "B48EAD"
    ];
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "de_DE.UTF-8/UTF-8"
    ];
  };

  environment.systemPackages = with pkgs.hunspellDicts; [
    en_US
    de_DE
  ];

  environment = {
    variables = {
      CLICOLOR = "TRUE";
      TERM = "xterm-256color";
      MOZ_ENABLE_WAYLAND = "1";
    };
    shellAliases = {
      cp = "cp -i";
      diff = "diff --color=auto";
      dmesg = "dmesg --color=always";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";
      grep = "grep --color=auto";
      mv = "mv -i";
      ping = "ping -c3";
      ps = "ps -ef";
      # sudo = "sudo -i";
      vdir = "vdir --color=auto";
      ll = "ls -al";
      l="ls -lFh";
      la = "ls -a";
      lr = "ls -tRFh";
      grep = "grep --color=auto";
      dud = "du -d 1 -h";
      duf = "du -sh *";
      base2 = "basenc --base2msbf";
      meip = "curl ifconfig.me";
      speed = "librespeed-cli";
      rtop = "radeontop";
      neo = "neofetch";
      frsh = "freshfetch";
      coinflip = "echo $((RANDOM % 2))";
      hp-setup = "nix run nixpkgs.hplipWithPlugin -c sudo hp-setup";
      rainbow = "cat /dev/random | base64 -w 0 | lolcat";
      buytime = "dd if=/dev/urandom of=homework.pdf bs=1K count=4";
      create-trash = "sudo mkdir -p .Trash-$UID/{expunged,files,info} && sudo chown -R $USER .Trash-$UID && sudo chmod -R 0700 .Trash-$UID";
      random-noise-video = "ffmpeg -f rawvideo -framerate 60 -pixel_format yuv422p -video_size 1920x1080 -t 10 -i /dev/urandom output.mkv";
    };
    pathsToLink = [ "/libexec" ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users = {
  #   lgo = {
  #     description = "Lutz Go";
  #     home = "/home/lgo";
  #     extraGroups = [
  #       "audio"
  #       "docker"
  #       "lp"
  #       "networkmanager"
  #       "users"
  #       "video"
  #       "wheel"
  #     ];
  #     isNormalUser = true;
  #     mutableUsers = false;
  #     shell = pkgs.zsh;
  #     uid = 1000;
  #   };
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}