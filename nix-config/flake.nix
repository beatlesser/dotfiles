{
  description = "NixOS Config For Beatlesser";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # NixOS-WSL
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

    #flake-parts: better flake config
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    #nix-output-monitor
    nix-output-monitor = {
      url = "github:maralorn/nix-output-monitor/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    nixos-wsl,
    flake-parts,
    ...
  } @ inputs: let
    #add sytems which you want to support
    myLib = import ./lib {inherit (nixpkgs) lib;};
    systems = [
      "x86_64-linux"
    ];
    #add your host info here
    hosts = {
      wsl = {
        system = "x86_64-linux";
        username = "cyer";
      };
    };
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      inherit systems;
      perSystem = {
        system,
        pkgs,
        lib,
        ...
      }: {
      };
      flake = {
        nixosConfigurations = let
          mkPkgs = system: {
            stable = import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
            unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
        in
          builtins.mapAttrs (
            host: cfg:
              nixpkgs.lib.nixosSystem {
                inherit (cfg) system;
                specialArgs =
                  {
                    inherit inputs;
                    inherit host;
                    inherit (nixpkgs) lib;
                    inherit myLib;
                    inherit (cfg) username system;
                  }
                  // mkPkgs cfg.system;
                modules = [
                  ./hosts/${host}
                  ./overlays
                ];
              }
          )
          hosts;
      };
    };
}
