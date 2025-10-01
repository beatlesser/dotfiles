{pkgs,username, ...}: {
  #wsl setting
  wsl.enable = true;
  wsl.defaultUser = "${username}";

  environment.systemPackages = (
    with pkgs; [
      # System Packages
      curl
      wget
      duf # 查看系统磁盘的空间使用情况 better df
      eza # better ls
      killall # better kill
      openssl # SSL/TLS 安全通信、证书管理和加密。
      jq # 处理 JSON 数据
      unzip
      fzf
      bat # better cat
      fd # better find
      zoxide
      duf # better du
      ripgrep # better grep
      file
      dos2unix
      just
      git

      cliphist # 管理和查看剪贴板历史记录
      wl-clipboard # 命令行工具，操作剪贴板

      fastfetch
      btop
    ]
  );

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
