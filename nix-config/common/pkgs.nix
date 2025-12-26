{ pkgs, system, ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    config.allowBroken = true;
    hostPlatform = "${system}";
  };
  programs. = {
    nano.enable = false;
    git.enable = true;
    firefox.enable = true;
    fish.enable = true;
    bat.enable = true;
    zoxide = {
      enable = true;
      enableFishIntergration = true;
    };
    television = {
      enable = true;
      enableFishIntergration = true;
    };
    foot = {
      enable = true;
      enableFishIntergration = true;
    };
    neovim = {
       enable = true;
       viAlias = true;
       defaultEditor = true;
    };
  };
  environment.systemPackages = with pkgs; [
    fastfetch
    just
    tealdeer
    jujutsu
    cliphist
    wl-clipboard-rs
    btop
    fd
    ripgrep
    lsd
  ];
}
