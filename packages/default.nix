{ config, pkgs, lib, ... }:

{
  # nixpkgs.config = {
  #   allowUnfree = true;
  # };

  environment = {
    systemPackages = with pkgs; [
      # Languages
      zsh
      # CLI
      wget git git-crypt git-lfs gnupg age
      ## Compression tools
      #zstd zpaq
      ## Prompts
      starship
      zoxide
      ## Fetch programs
      #freshfetch neofetch
      ## System monitors
      #bpytop
      ## Fun
      #asciiquarium cmatrix nyancat cbonsai toilet figlet cowsay lolcat cava
      # Video and image
      #gthumb mpv ffmpeg
      # Wayland, Xorg
      #wl-clipboard polkit polkit_gnome
      # Other
      #alacritty deja-dup transmission-gtk
      # File browsers
      #cinnamon.nemo
      # Web browsers
      #firefox-wayland
      # Vulkan
      vulkan-loader vulkan-tools
      # Filesystem stuff
      #gparted dosfstools mtools ntfs3g btrfs-progs jmtpfs
    ];
  };
}
