# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  lib,
  config,
  pkgs,
  ...
}@inputs: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
  ];

  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };
    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # FIXME: Add the rest of your current configuration

  # TODO: Set your hostname
  networking.hostName = "wsl";

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    # FIXME: Replace with your username
    cyer = {
      # TODO: You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      isNormalUser = true;
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
	"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQSH8HuVvIIALDFr9sQ4zS+9K8/ZiQ7UZErKm2n+UPjR0OtxlczEJWS8ktdU1xbQcZNyhozQzFuvu9cl08JSsn5VhYNrsn9wsFs62d0DPZMSvhI9xnwqXmWbr0yLDhrVPPMAVssaH9YN0nOvwnpV+P80z5VX97Umks9X+SZCTsChCMG31BvMOPy6QyisvQKMfnQWJ4ZLf85L5XPS2MZ1/Nxv+ArjMYXK25e6QG2+3gDwhrPrCSj34eN2a68bXZuLPNNEgfPSa/kbVTuM+OB1S7Jc3I+Csb6FuSr5NTauupj00y3JxmIlTaJn4suRdUO5s950zS7Z0JB6gzFOdfz/FRMCWo5bIM2GBAYc30PZX6BIo8oxdG8IJ8BY6iX0xg0j8y+a7SWyon6GjqL+PwmktngGJA0GJ91W1GSTnU7a5SntjZyZW+JxY0tG9XhLFH8g1jga3xG7PQjVdEERLEADoNtAjw6hdGlXrTctRPPkV8+D1pcGiIKFVzBfsCc9+0aiE= 2429209973@qq.com"
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = ["wheel"];
    };
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      PasswordAuthentication = false;
    };
  };
  #wsl settings
  wsl.enable = true;
  wsl.defaultUser = "cyer";

  environment.systemPackages = with pkgs; [
  	wslu
	wsl-open
  ];
  programs.fish.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  time.timeZone = "Asia/Shanghai";


  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.05";
}
