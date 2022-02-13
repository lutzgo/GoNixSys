{ config, pkgs, lib, ... }:

{

  nixpkgs.overlays = [
    (self: super: {
      wl-clipboard-x11 = super.stdenv.mkDerivation rec {
      pname = "wl-clipboard-x11";
      version = "5";

      src = super.fetchFromGitHub {
        owner = "brunelli";
        repo = "wl-clipboard-x11";
        rev = "v${version}";
        sha256 = "1y7jv7rps0sdzmm859wn2l8q4pg2x35smcrm7mbfxn5vrga0bslb";
      };
  
      dontBuild = true;
      dontConfigure = true;
      propagatedBuildInputs = [ super.wl-clipboard ];
      makeFlags = [ "PREFIX=$(out)" ];
    };
  
    xsel = self.wl-clipboard-x11;
    xclip = self.wl-clipboard-x11;
  })
];

  programs = {

    light.enable = true;

    sway = {
      enable = true;
      # wrapperFeatures.gtk = true; # so that gtk works properly
      # extraPackages = with pkgs; [
      #   brightnessctl
      #   fuzzel
      #   grim
      #   kanshi
      #   mako
      #   slurp
      #   swaylock
      #   # swayidle
      #   waybar
      #   wl-clipboard
      #   wofi
      #   # wofi-emoji
      # ];
    };

    # fish = {
    #   loginShellInit = ''
    #     if test (id --user $USER) -ge 1000 && test (tty) = "/dev/tty1"
    #     exec startsway
    #     end
    #   '';
    # };

  };

  # services = {
  #   greetd = {
  #     enable = true;
  #     settings = {
  #       default_session = {
  #         command = "${pkgs.greetd.greetd}/bin/agreety --cmd sway";
  #       };
  #     };
  #   };
  # };

}