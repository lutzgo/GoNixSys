{ config, pkgs, lib, ... }:

{
  fonts.fonts = with pkgs; [
    fira-code
    inter
    roboto
    noto-fonts-emoji
    font-awesome
  ];

  fonts = {
    enableDefaultFonts = true;
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      antialias = true;
      defaultFonts = {
        serif = [ "Roboto Slab" ];
        sansSerif = [ "Inter" ];
        monospace = [ "Fira Code" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}