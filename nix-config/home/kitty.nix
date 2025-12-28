{
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
    packages = [ cfg.package ];
    xdg.config.files."kitty".source = cfg.configPath;
  };
}
