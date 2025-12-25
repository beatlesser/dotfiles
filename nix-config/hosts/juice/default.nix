{ mylib, ... }@args:
let
  inherit (mylib) mapToRoot nixosSystem;
  system = "x86_64-linux";
  host = "juice-laptop";
  base-modules =
    mapToRoot [
      "secrets"
      "common"
    ]
    ++ [
      ./config.nix
      ./boot.nix
      ./disk.nix
      ./optimization.nix
    ];
in
nixosSystem (
  args
  // {
    inherit
      system
      host
      base-modules
      ;
  }
)
