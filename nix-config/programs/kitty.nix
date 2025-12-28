{
  myvars,
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib)
    mkOption
    mkEnableOption
    mkPackageOption
    mkIf
    ;
  inherit (myvars) username;
  cfg = config.terminal.kitty;
in
{
  options.terminal.kitty = {
    enable = mkEnableOption "kitty";
    package = mkPackageOption pkgs "kitty" { };
    configPath = mkOption {
      type = lib.types.path;
      description = "kitty config file path";
    };
  };

  config = mkIf cfg.enable {
    hjem.users.${username} = {
      packages = [ cfg.package ];
      xdg.config.files."kitty".source = cfg.configPath;
    };
  };
}
