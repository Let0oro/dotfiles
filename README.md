# Arch Linux Dotfiles

Personal configuration files for Arch Linux with Hyprland, Zsh, and Waybar/Eww.

## Hardware

- **CPU:** Intel Comet Lake
- **GPU:** NVIDIA GTX 1650 Mobile (Optimus)
- **Display:** Hyprland (Wayland)

## Directory Structure

```
dotfiles/
├── install.sh              # Interactive installer script
├── packages.md             # Package documentation
├── README.md               # This file
├── .bashrc                 # Bash configuration
├── .zshrc                  # Zsh configuration
├── .gitignore              # Git ignore rules
│
├── bin/                    # Tool binaries and symlinks
│   ├── kimi -> ...         # Kimi AI CLI
│   ├── uv                  # Python package manager
│   ├── uvx                 # uv exec
│   └── vosk-transcriber -> # Speech-to-text
│
├── scripts/                # Custom utility scripts
│   ├── cod                 # VSCode launcher
│   ├── downloads_organizer.sh  # Auto-organize downloads
│   ├── hx                  # Helix launcher (user)
│   ├── shx                 # Helix launcher (sudo)
│   ├── ypick / ypick_hx    # Yazi file picker -> Helix
│   ├── zj-*                # Zellij file operation scripts
│   ├── toggle_touchpad.sh  # Touchpad toggle
│   ├── start-mcp           # MCP server launcher
│   └── env / env.fish      # Environment variables
│
├── systemd/                # Systemd user services
│   └── user/
│       ├── downloads_organizer.service
│       ├── audio-transcript.service
│       ├── audio-transcript.path
│       ├── elephant.service
│       ├── keysmasher_start.service
│       └── todo_dashboard.service
│
├── hypr/                   # Hyprland configuration
│   ├── hyprland.conf       # Main config
│   ├── bindings.conf       # Keybindings
│   ├── monitors.conf       # Monitor setup
│   ├── input.conf          # Keyboard/mouse
│   ├── looknfeel.conf      # Visual settings
│   ├── autostart.conf      # Startup apps
│   ├── envs.conf           # Environment vars
│   ├── hypridle.conf       # Idle behavior
│   ├── hyprlock.conf       # Lock screen
│   ├── hyprsunset.conf     # Night light
│   ├── xdph.conf           # Portal config
│   └── shaders/            # 138 GLSL shaders
│
├── waybar/                 # Waybar status bar
│   ├── config.jsonc        # Configuration
│   ├── style.css           # Styling
│   ├── colors.css          # Color scheme
│   └── scripts/            # Bar scripts
│
└── .config/                # Application configs
    ├── alacritty/          # Alacritty terminal
    ├── ghostty/            # Ghostty terminal
    ├── kitty/              # Kitty terminal
    ├── foot/               # Foot terminal
    ├── helix/              # Helix editor
    ├── zellij/             # Zellij multiplexer
    ├── yazi/               # Yazi file manager
    ├── btop/               # System monitor
    ├── mako/               # Notifications
    ├── swayosd/            # OSD notifications
    ├── rofi/               # Application launcher
    ├── eww/                # Widget system
    ├── fastfetch/          # System info
    ├── git/                # Git config
    ├── starship.toml       # Shell prompt
    ├── mimeapps.list       # MIME associations
    └── ...
```

## Installation

### Quick Install

```bash
git clone https://github.com/Let0oro/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

### Manual Install

1. Install yay (AUR helper):
```bash
cd ~ && git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm
```

2. Install packages:
```bash
# See packages.md for full list
sudo pacman -S hyprland zsh zellij waybar ...
yay -S hyprpicker hypridle hyprlock ...
```

3. Copy configurations:
```bash
cp -r hypr/ ~/.config/hypr/
cp -r waybar/ ~/.config/waybar/
# ... etc
```

## Package Categories

The installer supports these package groups:

| Category | Description |
|----------|-------------|
| `greetd` | Display manager |
| `hyprland` | Hyprland & Wayland core |
| `nvidia` | NVIDIA drivers |
| `intel` | Intel GPU drivers |
| `audio` | PipeWire audio |
| `screenshots` | Screenshot tools |
| `wallpaper` | Wallpaper managers |
| `bars` | Status bars & launchers |
| `notifications` | Notification daemons |
| `terminals` | Terminal emulators |
| `shell` | Zsh + plugins |
| `multiplexer` | Terminal multiplexers |
| `fonts` | System fonts |
| `dev` | Development tools |
| `langs` | Programming languages |
| `editors` | Text editors |
| `browsers` | Web browsers |
| `media` | Media players |
| `filemanagers` | TUI file managers |
| `virt` | Virtualization |
| `docker` | Docker |
| `tools` | CLI tools |
| `input` | Input methods |
| `theming` | Theming tools |

## Key Features

- **Dual bar system:** Switch between Waybar and Eww with `Super+B`
- **NVIDIA Optimus:** Intel iGPU renders Wayland, NVIDIA available via `prime-run`
- **Custom keybindings:** Extensive web app shortcuts
- **Zellij integration:** File operations via `zj-*` scripts
- **GLSL shaders:** 138 post-processing effects for Hyprland

## Shell Configuration

### Zsh Features
- Starship prompt
- Zoxide (smart cd)
- Eza (modern ls)
- Fuzzy finder (fzf)
- Auto-suggestions
- Syntax highlighting

### Key Aliases
```bash
ll='ls -la'
fm='yazi'
f='fzf'
cr='opencode run'
devh='zellij --layout code.kdl'
```

## Systemd Services

| Service | Purpose |
|---------|---------|
| `downloads_organizer` | Auto-organize ~/Downloads |
| `audio-transcript` | Transcribe audio files |
| `elephant` | App launcher daemon |
| `keysmasher_start` | Typing practice at login |
| `todo_dashboard` | TODO dashboard |

## Custom Scripts

| Script | Description |
|--------|-------------|
| `cod` | VSCode launcher |
| `downloads_organizer.sh` | File organizer |
| `hx/shx` | Helix launchers |
| `ypick` | Yazi file picker |
| `zj-*` | Zellij file operations |
| `toggle_touchpad.sh` | Touchpad toggle |

## License

MIT License - See [LICENSE](LICENSE) for details.

## Author

Juanma (Let0oro)
