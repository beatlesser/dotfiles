{ mylib, ... }@args:
let
  inherit (mylib) mapToRoot nixosSystem;
  system = "x86_64-linux";
  host = "juice-laptop";
  custom-modules =
    mapToRoot [
      "secrets.nix"
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
      custom-modules
      ;
  }
)
