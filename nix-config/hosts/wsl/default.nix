{
  mylib,
  inputs,
  ...
}@args:
let
  inherit (mylib) mapToRoot nixosSystem;

  host = "wsl";
  system = "x86_64-linux";

  base-modules =
    mapToRoot [
      "common/base/nix.nix"
      "common/base/pkgs.nix"
      "common/nixos/usr.nix"
      "common/nixos/i18n.nix"
    ]
    ++ [
      ./config.nix
      inputs.nixos-wsl.nixosModules.wsl
    ];

  home-modules =
    mapToRoot [
      "home"
    ]
    ++ [
      ./home.nix
    ];

in
nixosSystem (
  args
  // {
    inherit
      host
      system
      base-modules
      home-modules
      ;
  }
)
