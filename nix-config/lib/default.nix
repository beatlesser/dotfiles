{ lib, ... }:
let
  func = import ./func.nix { inherit lib; };
  nixosSystem = import ./nixosSystem.nix;
in
{
  inherit (func)
    mapToRoot
    mapToConfig
    relativeToRoot
    importAllFrom
    ;
  inherit nixosSystem;
}
