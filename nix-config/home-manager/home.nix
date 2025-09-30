# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];
  # TODO: Set your username
  home = {
    username = "cyer";
    homeDirectory = "/home/cyer";
  };

  # Add stuff for your user as you see fit:
  programs = {
  	home-manager = {
		enable = true;
	};

  	git = {
		enable = true;
		userName = "cyer";
		userEmail = "2429209973@qq.com";
	};

	neovim = {
		enable = true;
        packages = pkgs.neovim-unwarapped;
	};

	starship = {
		enable = true;
	};

	fish = {
		enable = true;
	};
  };
  home.packages = with pkgs; [
	fastfetch

	unzip
	zip
	p7zip

	ripgrep
	lsd
	fzf

    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    gcc
    gnumake
    pkg-config
  ];
  xdg.configFile."nvim" = {
  	source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/nvim";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.05";
}
