{ config, pkgs, lib, ... }:

{
  # nixpkgs.config = {
  #   allowUnfree = true;
  # };

  environment = {
    systemPackages = with pkgs; [
      #### CLI ####
      age
      git
      git-lfs 
      git-crypt
      gnupg
      mkpasswd
      pciutils
      wget
      zsh

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
