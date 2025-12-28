{
  pkgs,
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
    fish = {
      enable = true;
      interactiveShellInit = "set fish_greeting";
      shellAliases = {
        cls = "clear";
        la = "lsd -ha";
        ls = "lsd -hla";
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
      enableFishIntegration = true;
    };
    television = {
      enable = true;
      enableFishIntegration = true;
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
