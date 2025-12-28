{
  pkgs,
  system,
  lib,
  ...
}:
{
  programs = {
    nano.enable = false;
    firefox.enable = true;
    bat.enable = true;
    foot = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      theme = "catppuccin-mocha";
      settings = {
        main = {
          font = "MapleMono NF CN:size=13";
        };
        cursor = {
          style = "beam";
        };
      };
    };
    fish = {
      enable = true;
      interactiveShellInit = "set fish_greeting";
      shellAliases = {
        cls = "clear";
        la = "lsd -ha";
        ll = "lsd -hla";
        zz = "z -";
      };
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    television = {
      enable = true;
      #enableFishIntegration = true;
    };
  };
  environment.systemPackages = with pkgs; [
    gcc
    fastfetch
    just
    tealdeer
    btop
    fd
    ripgrep
    lsd
    cliphist
    wl-clipboard-rs
    nix-search-tv
  ];
}
