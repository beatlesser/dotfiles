{
  description = "NixOS Config For Beatlesser";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    #NUR
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # NixOS-WSL
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #sops-nix for encypt
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #flake-parts: better flake config
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    nur,
    nixos-wsl,
    flake-parts,
    ...
  } @ inputs: let
    #import my lib for helper function
    myLib = import ./lib {inherit (nixpkgs) lib;};
    # make diffrent pkgs instance for you want
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
    #add your host info here
    hosts = {
      wsl = "x86_64-linux";
    };
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      #add your systems here
      systems = ["x86_64-linux"];
      perSystem = {
        system,
        pkgs,
        lib,
        ...
      }: {
        devShells = import ./dev-env {
          inherit (mkPkgs system) stable unstable;
          inherit lib;
        };
        packages = import ./pkgs {inherit pkgs system myLib;};
        formatter = pkgs.legacyPackages.${system}.alejandra;
      };
      flake = {
        nixosConfigurations =
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
                  {
                    nixpkgs.overlays = [
                      nur.overlays.default
                    ];
                  }
                ];
              }
          )
          hosts;
      };
    };
}
