{
  lib,
  myLib,
  inputs,
  system,
  stable,
  ...
}: let
  inherit (import ./vars.nix) username;
in {
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = false; # You have set either `nixpkgs.config` or `nixpkgs.overlays` while using `home-manager.useGlobalPkgs`. This will soon not be possible.
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit
        inputs
        myLib
        system
        stable
        ;
    };
    users.${username} = {
      programs.home-manager.enable = true;
      imports = [
        ../../home/${username}
      ];
      home = {
        username = "${username}";
        homeDirectory = lib.mkForce "/home/${username}";
        stateVersion = "25.05";
      };
    };
  };
}
