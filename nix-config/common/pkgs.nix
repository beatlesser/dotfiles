{
  pkgs,
  pkgs-stable,
  system,
  myvars,
  mylib,
  ...
}:
let
  inherit (myvars) username email;
in
{
  nixpkgs = {
    config.allowUnfree = true;
    config.allowBroken = true;
    hostPlatform = "${system}";
  };
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
    git = {
      enable = true;
      config = {
        user = {
          name = "${username}";
          email = "${email}";
        };
        alias = {
          br = "branch";
          sw = "switch";
          rs = "reset";
          rt = "restore";
          st = "status";
          df = "diff";
          ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
          ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";
          cm = "commit -m";
          ca = "commit -am";
          caa = "commit --amend -a --no-edit";
        };
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    television = {
      enable = true;
      enableFishIntegration = true;
      package = pkgs-stable.television;
    };
  };
  environment.systemPackages = with pkgs; [
    gcc
    fastfetch
    just
    jujutsu
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
