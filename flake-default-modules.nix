{ config, pkgs, lib, ... }:

{
  imports = [
    ./default.nix
    ./fonts.nix
    ./network/default.nix
    ./packages/default.nix
    ./programs/default.nix
    ./programs/nano.nix
    ./programs/security.nix
  ];
}
