{
  description = "lgo's NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = github:NixOS/nixos-hardware/master;
    home-manager = {
      url = github:nix-community/home-manager/master;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }:
  let
    pkgs = import nixpkgs {
      config = {
        # Allow unfree packages (sorry stallman)
        allowUnfree = true;
      };
      localSystem = {
        system = "x86_64-linux";
      };
    };
    lib = nixpkgs.lib;
  in {
    homeManagerConfigurations = {
      lgo = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        inherit pkgs;
        username = "lgo";
        homeDirectory = "/home/lgo";
        configuration = {
          imports = [
            ./users/lgo/home.nix
          ];
        };
      };
    };
    nixosConfigurations = {
      ursula = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./flake-default-modules.nix
          ./hardware/ursula.nix
          ./network/ursula.nix
          ./system/ursula.nix
          ./users/default.nix
          ./.secrets/system/ursula.nix
          # ./packages/sway.nix
          # ./programs/greetd.nix
          # nixos-hardware.nixosModules.dell-xps-15-9500-nvidia
          # ./packages/extra.nix
          #./programs/openrgb.nix
          # ./programs/obs-studio.nix
          # ./programs/gaming.nix
          # ./programs/printing-scanning/default.nix
          # ./programs/printing-scanning/hplip.nix
        ];
      };

      peter = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./flake-default-modules.nix
          ./hardware/peter.nix
          ./network/peter.nix
          ./system/peter.nix
          ./users/default.nix
          ./.secrets/system/peter.nix
          # ./packages/sway.nix
          # ./programs/greetd.nix
          # nixos-hardware.nixosModules.dell-xps-15-9500-nvidia
          # ./packages/extra.nix
          #./programs/openrgb.nix
          # ./programs/obs-studio.nix
          # ./programs/gaming.nix
          # ./programs/printing-scanning/default.nix
          # ./programs/printing-scanning/hplip.nix
        ];
      };
      # sophie = lib.nixosSystem {
      #   system = "aarch64-linux";
      #   modules = [
      #     ./flake-default-modules.nix
      #     nixos-hardware.nixosModules.raspberry-pi-4
      #     ./hardware/rpi4.nix
      #     ./system/rpi4.nix
      #     ./network/rpi4.nix
      #   ];
      # };
    };
  };
}
