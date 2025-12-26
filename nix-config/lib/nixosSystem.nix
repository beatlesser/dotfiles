{
  inputs,
  lib,
  system,
  host,
  custom-modules ? [ ],
  myvars,
  mylib,
  ...
}:
let
  inherit (myvars) username;
  inherit (inputs)
    home-manager
    disko
    sops-nix
    nur
    nix-index-database
    nix-flatpak
    lanzaboote
    hjem
    ;
  baseArgs = {
    inherit
      system
      host
      myvars
      mylib
      ;
  };
  specialArgs = inputs // baseArgs;
  shared-modules = [
    nur.modules.nixos.default
    nix-flatpak.nixosModules.nix-flatpak
    nix-index-database.nixosModules.nix-index
    disko.nixosModules.default
    sops-nix.nixosModules.default
    lanzaboote.nixosModules.lanzaboote
    hjem.nixosModules.default
  ];
in
lib.nixosSystem {
  inherit system specialArgs;
  modules = shared-modules ++ custom-modules;
}
