{
  host,
  myvars,
  pkgs,
  config,
  ...
}:
{
  wsl = {
    enable = true;
    defaultUser = "${myvars.username}";
    useWindowsDriver = true;
  };

  networking.hostName = "${host}";

  programs = {
    ssh.startAgent = true;

    nix-ld = {
      enable = true;
      libraries = config.hardware.graphics.extraPackages;
      package = pkgs.nix-ld-rs;
    };

    dconf.enable = true;
  };
#disable system doc, we use tldr instead
  documentation = {
    man.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  system.stateVersion = "25.11";
}
