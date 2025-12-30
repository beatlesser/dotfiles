{
  exlib,
  inputs,
  ...
}@args:
let
  inherit (exlib) nixosSystem;
  system = "x86_64-linux";
  host = "juice-laptop";
  host-modules = [
    ./config.nix
    ./boot.nix
    ./disk.nix
    ./optimization.nix
  ];
  hjem-module = ./hjem.nix;
in
nixosSystem (
  args
  // {
    inherit
      system
      host
      host-modules
      hjem-module
      ;
  }
)
