{
  pkgs,
  inputs,
  ...
}: let
  inherit (import ./vars.nix) username;
in {
  nixpkgs = {
    config.allowUnfree = true;
  };
  # Cachix, Optimization settings and garbage collection automation
  nix = {
    package = pkgs.lix;
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    channel.enable = true;
    extraOptions = ''
      warn-dirty = false
    '';
    settings = {
      auto-optimise-store = true;
      system-features = [
        "gccarch-x86-64-v3" # for chaotic-nyx pkgsx86_64-v3
      ];
      experimental-features = [
        "nix-command" # 启用 nix build, nix run, nix flake 等新命令
        "flakes"
        # "ca-derivations" # 启用内容寻址 derivation（Content Addressed Derivations）! lix 不再支持 ca-derivations 这个实验性特性
      ];
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [
        "root"
        "${username}"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
