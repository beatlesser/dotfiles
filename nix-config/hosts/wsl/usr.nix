{
  stable,
  ...
}:
let
  inherit (import ./vars.nix) username shell;
in
{
  users = {
    # groups."${username}" = {
    #   name = "${username}";
    #   members = ["${username}"];
    # }; # 创建用户组
    mutableUsers = true;
    users."${username}" = {
      homeMode = "755";
      isNormalUser = true;
      description = "${username}";
      extraGroups = [
        "networkmanager"
        "wheel"
        "scanner"
        "lp"
        "video"
        "input"
        "audio"
      ];
      shell = stable.${shell};
      packages = with stable; [ tree ];
    };
    defaultUserShell = stable.bash;
  };
 }
