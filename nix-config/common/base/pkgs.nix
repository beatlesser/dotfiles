{ pkgs, system, ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    config.allowBroken = true;
    hostPlatform = "${system}";
  };

  #add some cross-host pkgs and programs here
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    just
  ];
}
