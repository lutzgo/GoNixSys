{ config, pkgs, lib, ... }:

{

  ### Environment ###
  environment = {
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
    };
        # shellAliases = {
    #   cp = "cp -i";
    #   diff = "diff --color=auto";
    #   dmesg = "dmesg --color=always";
    #   egrep = "egrep --color=auto";
    #   fgrep = "fgrep --color=auto";
    #   grep = "grep --color=auto";
    #   mv = "mv -i";
    #   ping = "ping -c3";
    #   ps = "ps -ef";
    #   # sudo = "sudo -i";
    #   vdir = "vdir --color=auto";
    #   ll = "ls -al";
    #   l="ls -lFh";
    #   la = "ls -a";
    #   lr = "ls -tRFh";
    #   grep = "grep --color=auto";
    #   dud = "du -d 1 -h";
    #   duf = "du -sh *";
    #   base2 = "basenc --base2msbf";
    #   meip = "curl ifconfig.me";
    #   speed = "librespeed-cli";
    #   rtop = "radeontop";
    #   neo = "neofetch";
    #   frsh = "freshfetch";
    #   coinflip = "echo $((RANDOM % 2))";
    #   hp-setup = "nix run nixpkgs.hplipWithPlugin -c sudo hp-setup";
    #   rainbow = "cat /dev/random | base64 -w 0 | lolcat";
    #   buytime = "dd if=/dev/urandom of=homework.pdf bs=1K count=4";
    #   create-trash = "sudo mkdir -p .Trash-$UID/{expunged,files,info} && sudo chown -R $USER .Trash-$UID && sudo chmod -R 0700 .Trash-$UID";
    #   random-noise-video = "ffmpeg -f rawvideo -framerate 60 -pixel_format yuv422p -video_size 1920x1080 -t 10 -i /dev/urandom output.mkv";
    # };
  };

  nix = {
    # Garbage collection
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 4d --max-freed $((64 * 1024**3))";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    # Make ready for nix flakes
    package = pkgs.nixFlakes;
    auto-optimise-store = true;
    readOnlyStore = false;
    settings.sandbox = true;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  programs = {
    ssh = {
      startAgent = false;
    };
    gnupg.agent = {
      enable = true;
      # pinentryFlavor = "gtk2";
      enableSSHSupport = true;
    };
  };

  services = {
    fstrim.enable = true;
    openssh = {
      enable = true;
    };
    # gvfs = {
    #   enable = true;
    #};
  };

  virtualisation.docker.enable = true;
}
