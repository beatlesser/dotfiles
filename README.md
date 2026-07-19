# Dotfiles

个人 Linux 桌面环境配置文件，主要面向 Wayland（Hyprland + Noctalia），整体采用 Catppuccin Mocha 配色。

## 软件栈

| 用途 | 软件 |
| --- | --- |
| 窗口管理器 | [Hyprland](https://hyprland.org/)（Lua 配置） |
| 桌面 Shell | [Noctalia](https://github.com/noctalia-dev/noctalia) |
| 终端 | [foot](https://codeberg.org/dnkl/foot)、[Ghostty](https://ghostty.org/) |
| 编辑器 | [Neovim](https://neovim.io/)（[lazy.nvim](https://github.com/folke/lazy.nvim) 管理插件） |
| 文件管理器 | [Yazi](https://yazi-rs.github.io/) |
| 系统监控 | [btop](https://github.com/aristocratos/btop) |
| Shell | Bash |
| 输入法 | fcitx5 |
| 空闲 / 锁屏 / 壁纸 | hypridle、hyprlock、hyprpaper |
| 字体 | JetBrainsMono Nerd Font |
| 光标 | Bibata-Modern-Classic |

常用命令行工具：`eza`、`zoxide`、`fzf`、`mise`、`lazygit`。

## 目录结构

```text
.
├── .bashrc                         # Bash 配置（提示符、别名、工具初始化）
├── .gitconfig                      # Git 配置（delta、别名）
├── .gitignore
├── .config
│   ├── btop
│   │   ├── btop.conf               # btop 配置
│   │   └── themes                  # btop 主题
│   │       ├── caelestia.theme
│   │       └── catppuccin_*.theme
│   ├── fontconfig
│   │   └── fonts.conf              # 字体配置
│   ├── foot
│   │   └── foot.ini                # foot 终端配置
│   ├── ghostty
│   │   └── config                  # Ghostty 终端配置
│   ├── hypr
│   │   ├── .luarc.json             # Lua LSP 配置
│   │   ├── hyprland.lua            # Hyprland 入口
│   │   ├── appearance.lua          # 外观（圆角、模糊、动画、边框）
│   │   ├── autostart.lua           # 开机自启动
│   │   ├── binds.lua               # 快捷键
│   │   ├── devices.lua             # 输入设备与显示器
│   │   ├── env.lua                 # 环境变量（输入法、语言、光标）
│   │   ├── misc.lua                # 杂项
│   │   ├── rules.lua               # 窗口 / 图层规则
│   │   ├── hypridle.conf           # 空闲管理
│   │   ├── hyprlock.conf           # 锁屏
│   │   ├── hyprpaper.conf          # 壁纸
│   │   └── scheme
│   │       └── current.conf        # 当前配色
│   ├── nvim
│   │   ├── init.lua                # Neovim 入口
│   │   ├── lazy-lock.json          # 插件版本锁定文件
│   │   ├── lsp                     # LSP server 配置
│   │   └── lua
│   │       ├── config              # Neovim 基础配置
│   │       └── plugins             # 插件配置
│   └── yazi
│       ├── yazi.toml               # Yazi 主配置
│       ├── keymap.toml             # 快捷键
│       ├── theme.toml              # 主题
│       ├── package.toml            # 插件依赖
│       └── Catppuccin-Mocha.tmTheme # 语法高亮主题
└── README.md
```

## 快捷键

> 应用快捷键使用 `Mod = ALT`，媒体与截图使用 `SUPER`。

### 启动与窗口

| 快捷键 | 功能 |
| --- | --- |
| `ALT + Space` | 打开启动器 |
| `ALT + Return` | 打开 foot 终端 |
| `ALT + c` | 打开剪贴板 |
| `ALT + q` | 关闭窗口 |
| `ALT + v` | 切换浮动窗口 |
| `ALT + r` | 调整列宽（scrolling 布局） |
| `ALT + f` | 全屏（最大化） |
| `ALT + Ctrl + f` | 全屏 |

### 焦点与窗口移动

| 快捷键 | 功能 |
| --- | --- |
| `ALT + h/j/k/l` | 切换焦点 |
| `ALT + Ctrl + h/j/k/l` | 移动窗口 |
| `ALT + Shift + h/j/k/l` | 交换窗口 |
| `ALT + 1…0` | 切换到对应工作区 |
| `ALT + Ctrl + 1…0` | 移动窗口到对应工作区 |
| `ALT + u` / `ALT + i` | 下一个 / 上一个工作区 |
| `ALT + Ctrl + u` / `ALT + Ctrl + i` | 移动窗口到下一个 / 上一个工作区 |
| `ALT + 左键拖动` | 移动窗口 |
| `ALT + 右键拖动` | 调整窗口大小 |

### 系统

| 快捷键 | 功能 |
| --- | --- |
| `SUPER + l` | 会话菜单 |
| `SUPER + p` | 区域截图 |
| `SUPER + Ctrl + p` | 全屏截图 |
| 音量 / 亮度功能键 | 音量、亮度调节 |

## Shell 别名

| 别名 | 命令 |
| --- | --- |
| `ls` / `la` / `lt` / `l` | `eza`（带图标，分别为普通 / 全部 / 树形 / 长格式） |
| `yz` | `yazi` |
| `lg` | `lazygit` |
| `vi` | `nvim` |

## 部署

将仓库克隆到本地后，把配置链接或复制到 `$HOME`：

```bash
git clone <repo-url> ~/dotfiles

# 示例：链接单个配置
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.config/hypr ~/.config/hypr
```
