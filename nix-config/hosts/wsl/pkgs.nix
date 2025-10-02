{stable, ...}: {
  programs = {
    bash.enable = true;
    fish.enable = true;
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  environment.systemPackages = (
    with stable; [
      # System Packages
      curl
      wget
      duf # 查看系统磁盘的空间使用情况 better df
      lsd # better ls
      killall # better kill
      openssl # SSL/TLS 安全通信、证书管理和加密。
      jq # 处理 JSON 数据
      unzip
      fzf
      bat # better cat
      fd # better find
      duf # better du
      ripgrep # better grep
      file
      dos2unix
      just
      gcc
      git

      cliphist # 管理和查看剪贴板历史记录
      wl-clipboard # 命令行工具，操作剪贴板

      fastfetch
      btop
    ]
  );
}
