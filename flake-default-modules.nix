{ config, pkgs, lib, ... }:

{
  imports = [
    ./default.nix
    ./fonts.nix
    ./network/default.nix
    ./packages/default.nix
    ./packages/sway.nix
    ./programs/default.nix
    ./programs/fish.nix
    ./programs/nano.nix
    # ./programs/nushell.nix
    ./programs/security.nix
    ./programs/sway.nix
  ];
}
