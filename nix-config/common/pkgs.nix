{
  pkgs,
  system,
  myvars,
  mylib,
  ...
}:
let
  inherit (myvars) username;
  inherit (mylib) mapToConfig;
in
{
  nixpkgs = {
    config.allowUnfree = true;
    config.allowBroken = true;
    hostPlatform = "${system}";
  };
  hjem.users.${username} = {
    enable = true;
    xdg.config.files = {
      "niri".source = mapToConfig "niri";
      "fish".source = mapToConfig "fish";
      "nvim".source = mapToConfig "nvim";
      "kitty".source = mapToConfig "kitty";
      "starship.toml".source = mapToConfig "starship.toml";
    };
  };
  programs = {
    nano.enable = false;
    git.enable = true;
    firefox.enable = true;
    fish.enable = true;
    starship.enable = true;
    bat.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    television = {
      enable = true;
      enableFishIntegration = true;
    };
    foot = {
      enable = true;
      enableFishIntegration = true;
    };
    neovim = {
      enable = true;
      viAlias = true;
      defaultEditor = true;
    };
  };
  environment.systemPackages = with pkgs; [
    gcc
    kitty
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
