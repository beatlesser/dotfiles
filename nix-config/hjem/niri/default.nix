{ exlib, ... }:
{
  rum.desktops.niri = {
    enable = true;
    binds = import ./binds.nix;
  };
}
