{ config, pkgs, lib, ... }:

let
     pkgs = import (builtins.fetchGit {
         # Descriptive name to make the store path easier to identify                
         name = "my-old-revision";                                                 
         url = "https://github.com/NixOS/nixpkgs/";                       
         ref = "refs/heads/nixpkgs-unstable";                     
         rev = "c82b46413401efa740a0b994f52e9903a4f6dcd5";                                           
     }) {};                                                                           

     myPkg = pkgs.remarshal;
in

{
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment = {
    systemPackages = with pkgs; [
      #### CLI ####
      bandwhich
      bat
      bat-extras.batdiff
      bat-extras.batman
      bat-extras.batgrep
      bat-extras.batwatch
      bat-extras.prettybat
      bottom
      delta
      dust
      exa
      fd
      fish
      git
      git-lfs 
      git-crypt
      gnupg
      hyperfine
      mkpasswd
      nano
      # nushell
      pciutils
      procs
      remarshal
      ripgrep-all
      # rmesg
      sd
      starship
      tealdeer
      tokei
      wget
      zellij
      zoxide

      ####Compression tools ####
      #zstd zpaq

      #### Fetch programs ####
      #freshfetch neofetch

      #### File browsers ####
      #cinnamon.nemo

      #### Filesystem stuff ####
      #gparted dosfstools mtools ntfs3g btrfs-progs jmtpfs

      #### Fun ####
      #asciiquarium cmatrix nyancat cbonsai toilet figlet cowsay lolcat cava

      #### Languages ####
      # sdfsf

      #### Other ####
      #deja-dup transmission-gtk

      #### Prompts ####
      # starship
      # zoxide

      #### System monitors ####
      #bpytop

      #### Terminal ####
      #alacritty

      #### Video and image ####
      #gthumb mpv ffmpeg

      #### Vulkan ####
      # vulkan-loader vulkan-tools
      
      #### Wayland, Xorg ####
      #wl-clipboard polkit polkit_gnome

      #### Web browsers ####
      #firefox-wayland
    ];
  };
}
