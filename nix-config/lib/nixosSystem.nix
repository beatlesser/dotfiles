{
  inputs,
  lib,
  system,
  host,
  host-modules,
  hjem-module ? { },
  exvars,
  exlib,
  ...
}:
let
  inherit (exvars) username;
  inherit (exlib) relativeToRoot;
  inherit (inputs)
    nixpkgs-stable
    disko
    sops-nix
    nur
    nix-index-database
    nix-flatpak
    lanzaboote
    hjem
    hjem-rum
    ;
  sharedArgs = {
    pkgs-stable = import nixpkgs-stable {
      config.allowUnfree = true;
      inherit system;
    };
    inherit
      system
      host
      exvars
      exlib
      ;
  };
  specialArgs = inputs // sharedArgs;
  base-modules = [
    (relativeToRoot "common")
    nur.modules.nixos.default
    nix-flatpak.nixosModules.nix-flatpak
    nix-index-database.nixosModules.nix-index
    disko.nixosModules.default
    sops-nix.nixosModules.default
    lanzaboote.nixosModules.lanzaboote
    hjem.nixosModules.default
  ];
  hjemModuleWrapper = {
    hjem = {
      extraModules = [
        (relativeToRoot "modules/hjem")
        hjem-rum.hjemModules.default
      ];
      specialArgs = specialArgs;
      users.${username} = hjem-module;
      clobberByDefault = true;
    };
  };
in
lib.nixosSystem {
  inherit system specialArgs;
  modules = base-modules ++ host-modules ++ lib.optional (hjem-module != { }) hjemModuleWrapper;
}
