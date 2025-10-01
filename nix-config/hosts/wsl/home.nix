{
  lib,
      myLib,
  inputs,
  system,
  username,
  stable,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = false; # You have set either `nixpkgs.config` or `nixpkgs.overlays` while using `home-manager.useGlobalPkgs`. This will soon not be possible.
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit
        inputs
        myLib
        username
        system
        stable
        ;
    };
    users.${username} = {
      imports = [
        ../../home/${username}
      ];
      home = {
        username = "${username}";
        homeDirectory = lib.mkForce "/home/${username}";
        stateVersion = "25.05";
        enableNixpkgsReleaseCheck = false;
      };
      programs.home-manager.enable = true;
    };
  };
}
