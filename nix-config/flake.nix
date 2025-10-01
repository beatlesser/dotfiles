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
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    nixos-wsl,
    flake-parts,
    ...
  } @ inputs: let
    myLib = import ./lib {inherit (nixpkgs) lib;};
    #add sytems which you want to support
    systems = [
      "x86_64-linux"
    ];
    #add your host info here
    hosts = {
      wsl = "x86_64-linux";
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
        packages = import ./pkgs {inherit pkgs system myLib;};
        formatter = pkgs.legacyPackages.${system}.alejandra;
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
            host: system:
              nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs =
                  {
                    inherit inputs;
                    inherit host;
                    inherit (nixpkgs) lib;
                    inherit myLib;
                    inherit system;
                  }
                  // mkPkgs system;
                modules = [
                  #add your hosts module here
                  ./hosts/${host}
                  #add your overlays pkgs here
                  ./overlays
                ];
              }
          )
          hosts;
      };
    };
}
