{
  pkgs,
  lib,
  config,
  myvars,
  noctalia,
  ...
}:
let
  inherit (lib)
    mkEnableOption
    mkOption
    mkPackageOption
    mkIf
    ;
  inherit (myvars) username;
  cfg = config.desktop.niri;
in
{
  options.desktop.niri = {
    enable = mkEnableOption "niri";
    configPath = mkOption {
      type = lib.types.path;
      default = ./.;
      description = "niri config file path";
    };
    package = mkPackageOption pkgs "niri" { };
  };

  config = mkIf cfg.enable {
    programs.niri = {
      enable = true;
      package = cfg.package;
    };
    hjem.users.${username} = {
      packages = [ noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default ];
      xdg.config.files."niri".source = cfg.configPath;
    };
  };
}
