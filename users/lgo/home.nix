{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lgo";
  home.homeDirectory = "/home/lgo";

  imports = [
    ./../default/home.nix
    # ./../../.secrets/users/lgo/zsh/default.nix
  ];

  programs = {
    # bat.enable = true;
    git = {
      userName = "lugott";
      userEmail = "lutz0go@gmail.com";
      signing = {
        key = "8EDA50FC62A05F18";
      };
    };
  };

  home = {
    language.base = "en_EN.UTF-8";
    keyboard.layout = "de";
  };

  home = {
    packages = with pkgs; [
      # Wine
      # wine-staging lutris-unwrapped
      # Wine both 32- and 64 bit support
      # wineWowPackages.staging
      #mindustry-wayland
      # Web browsers
      brave
      # Creative apps
      #blender 
      gimp
      #godot godot-export-templates
      inkscape
      #audacity #avidemux
      # Development
      #cobalt zola
      # Other
      #exodus gnome.gnome-boxes
      # Password managers
      #gnome-passwordsafe
      # Email
      # thunderbird-bin
      # Voicechat, Social media, Messaging
      #discord mumble teamspeak_client element-desktop signal-desktop
    ];
  };
}
