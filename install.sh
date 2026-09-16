#!/usr/bin/env bash
# ============================================================
# Arch Linux Interactive Installer
# Hardware: Intel Comet Lake + GTX 1650 Mobile (Optimus)
# Stack: Hyprland + Zsh + Zellij + Waybar/Eww
# ============================================================

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Helpers
info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[OK]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    error "Do not run this script as root!"
    exit 1
fi

# Check if Arch Linux
if ! grep -qi "arch" /etc/os-release 2>/dev/null; then
    error "This script is for Arch Linux only!"
    exit 1
fi

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║           Arch Linux Interactive Installer              ║"
echo "║      Hyprland + Zsh + Zellij + Waybar/Eww              ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# ============================================================
# Package categories
# ============================================================

declare -A PACKAGES

# Base system
PACKAGES[base]="base base-devel linux linux-firmware intel-ucode grub efibootmgr networkmanager nftables"

# Display manager
PACKAGES[greetd]="greetd greetd-tuigreet"

# Hyprland & Wayland
PACKAGES[hyprland]="hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk qt5-wayland qt6-wayland"
PACKAGES[hyprland-extras]="hyprpicker hypridle hyprlock hyprland-monitor-reconfigure"

# NVIDIA
PACKAGES[nvidia]="nvidia-dkms nvidia-utils lib32-nvidia-utils linux-headers"

# Intel GPU
PACKAGES[intel]="intel-media-driver libva-intel-driver mesa vulkan-intel vulkan-icd-loader lib32-vulkan-intel egl-wayland"

# Audio
PACKAGES[audio]="pipewire pipewire-pulse wireplumber pavucontrol"

# Screenshot/Recording
PACKAGES[screenshots]="grim slurp wl-clipboard wl-screenrec swappy"

# Wallpaper
PACKAGES[wallpaper]="swaybg swww pywal16 wallust"

# Bars & Launchers
PACKAGES[bars]="waybar rofi-wayland wofi"
PACKAGES[notifications]="dunst libnotify mako swayosd"

# Terminal emulators
PACKAGES[terminals]="foot kitty ghostty alacritty"

# Shell
PACKAGES[shell]="zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting starship atuin"

# Terminal multiplexer
PACKAGES[multiplexer]="zellij tmux"

# Fonts
PACKAGES[fonts]="noto-fonts noto-fonts-emoji ttf-cascadia-code ttf-firacode ttf-jetbrains-mono ttf-monaspace ttf-roboto ttf-noto-size"

# Development tools
PACKAGES[dev]="git lazygit github-cli fzf fd ripgrep bat ncdu btop curl wget unzip p7zip openssh man-db man-pages"

# Programming languages
PACKAGES[langs]="rustup nodejs npm python python-pip go"

# Editors
PACKAGES[editors]="neovim helix vscode"

# Browsers
PACKAGES[browsers]="vivaldi vivaldi-ffmpeg-codecs firefox chromium qutebrowser w3m lynx"

# Media
PACKAGES[media]="mpd rmpc mpc mpv imv celluloid"

# File managers
PACKAGES[filemanagers]="yazi ranger nnn lf lazygit"

# Virtualization
PACKAGES[virt]="qemu-full libvirt virt-manager virt-viewer dnsmasq"

# Docker
PACKAGES[docker]="docker docker-compose"

# Misc tools
PACKAGES[tools]="bat eza zoxide delta glow glow jq yq tmux htop bottom dust duf hyperfine tokei"

# Input methods
PACKAGES[input]="fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt"

# Theming
PACKAGES[theming]="lxappearance kvantum qt5ct qt6ct papirus-icon-theme"

# ============================================================
# Selection menu
# ============================================================

select_packages() {
    local selected=()
    
    echo -e "\n${CYAN}Select packages to install:${NC}\n"
    
    # Core packages (always install)
    echo -e "${GREEN}[CORE]${NC} (automatically selected):"
    echo "  - base, base-devel, linux, linux-firmware"
    echo "  - intel-ucode, grub, efibootmgr"
    echo "  - networkmanager, nftables"
    echo ""
    
    # Optional categories
    echo -e "${YELLOW}[OPTIONAL]${NC} Select categories to install:\n"
    
    local categories=(
        "greetd:Display Manager (greetd + tuigreet)"
        "hyprland:Hyprland & Wayland core"
        "hyprland-extras:Hyprland extras (hyprpicker, hypridle, hyprlock)"
        "nvidia:NVIDIA drivers (GTX 1650)"
        "intel:Intel GPU drivers"
        "audio:PipeWire audio stack"
        "screenshots:Screenshot & recording tools"
        "wallpaper:Wallpaper & theming tools"
        "bars:Status bars & launchers"
        "notifications:Notification daemons"
        "terminals:Terminal emulators"
        "shell:Zsh + plugins + starship"
        "multiplexer:Terminal multiplexers"
        "fonts:System fonts"
        "dev:Development tools (git, fzf, ripgrep, etc.)"
        "langs:Programming languages (Rust, Node, Python, Go)"
        "editors:Text editors (Helix, Neovim, VSCode)"
        "browsers:Web browsers"
        "media:Music & video players"
        "filemanagers:TUI file managers"
        "virt:Virtualization (QEMU, libvirt)"
        "docker:Docker & Docker Compose"
        "tools:Misc CLI tools (bat, eza, zoxide, etc.)"
        "input:Input methods (Fcitx5)"
        "theming:Theming tools (Kvantum, Papirus)"
    )
    
    for cat in "${categories[@]}"; do
        local name="${cat%%:*}"
        local desc="${cat#*:}"
        echo -ne "${YELLOW}[?]${NC} Install ${desc}? (y/N) "
        read -r answer
        if [[ "$answer" =~ ^[Yy]$ ]]; then
            selected+=("$name")
            echo -e "  ${GREEN}✓${NC} $desc"
        else
            echo -e "  ${RED}✗${NC} $desc"
        fi
    done
    
    echo "${selected[@]}"
}

# ============================================================
# Installation functions
# ============================================================

install_yay() {
    if command -v yay &>/dev/null; then
        info "yay already installed"
        return
    fi
    
    info "Installing yay (AUR helper)..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ~
    rm -rf /tmp/yay
    success "yay installed"
}

install_pacman_packages() {
    local packages=()
    
    # Always install base packages
    packages+=(${PACKAGES[base]})
    
    # Add selected categories
    for cat in "$@"; do
        if [[ -n "${PACKAGES[$cat]+x}" ]]; then
            packages+=(${PACKAGES[$cat]})
        fi
    done
    
    if [[ ${#packages[@]} -eq 0 ]]; then
        warn "No packages to install"
        return
    fi
    
    info "Installing ${#packages[@]} packages from pacman..."
    sudo pacman -S --needed --noconfirm "${packages[@]}"
    success "Pacman packages installed"
}

install_aur_packages() {
    local packages=()
    
    # AUR packages based on selections
    for cat in "$@"; do
        case $cat in
            greetd) packages+=(greetd-tuigreet) ;;
            hyprland-extras) packages+=(hyprpicker hypridle hyprlock) ;;
            wallpaper) packages+=(pywal16 wallust) ;;
            shell) packages+=(atuin zoxide) ;;
            tools) packages+=(delta glow eza zoxide) ;;
            browsers) packages+=(vivaldi vivaldi-ffmpeg-codecs) ;;
            media) packages+=(rmpc) ;;
            editors) packages+=(neovim helix) ;;
            fonts) packages+=(ttf-monaspace) ;;
        esac
    done
    
    # Remove duplicates
    packages=($(echo "${packages[@]}" | tr ' ' '\n' | sort -u))
    
    if [[ ${#packages[@]} -eq 0 ]]; then
        warn "No AUR packages to install"
        return
    fi
    
    info "Installing ${#packages[@]} packages from AUR..."
    yay -S --needed --noconfirm "${packages[@]}"
    success "AUR packages installed"
}

configure_nvidia() {
    info "Configuring NVIDIA for Hyprland..."
    
    # Modules in initramfs
    sudo sed -i 's/^MODULES=(/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm /' \
        /etc/mkinitcpio.conf
    sudo mkinitcpio -P
    
    # DRM modeset
    echo 'options nvidia-drm modeset=1 fbdev=1' | sudo tee /etc/modprobe.d/nvidia.conf
    
    success "NVIDIA configured"
}

configure_system() {
    info "Configuring system..."
    
    # Enable services
    sudo systemctl enable greetd
    sudo systemctl enable libvirtd
    sudo usermod -aG libvirt "$USER"
    
    # Zsh as default shell
    chsh -s "$(which zsh)"
    
    # Rust
    rustup default stable
    
    # CoW disabled for VMs
    sudo mkdir -p /var/lib/libvirt/images
    sudo chattr +C /var/lib/libvirt/images
    
    success "System configured"
}

install_configs() {
    info "Installing configurations..."
    
    # Create directories
    mkdir -p ~/.config/{hypr,waybar,eww,rofi,kitty,ghostty,alacritty,foot,helix,zellij,yazi,btop,mako,swayosd}
    mkdir -p ~/.config/systemd/user
    mkdir -p ~/.local/bin
    
    # Copy configs
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    
    # Hyprland
    cp -r "$SCRIPT_DIR/hypr/"* ~/.config/hypr/
    
    # Waybar
    cp -r "$SCRIPT_DIR/waybar/"* ~/.config/waybar/
    
    # Other configs
    [[ -f "$SCRIPT_DIR/.config/kitty/kitty.conf" ]] && cp "$SCRIPT_DIR/.config/kitty/kitty.conf" ~/.config/kitty/
    [[ -f "$SCRIPT_DIR/.config/ghostty/config" ]] && cp "$SCRIPT_DIR/.config/ghostty/config" ~/.config/ghostty/
    [[ -f "$SCRIPT_DIR/.config/alacritty/alacritty.toml" ]] && cp "$SCRIPT_DIR/.config/alacritty/alacritty.toml" ~/.config/alacritty/
    [[ -f "$SCRIPT_DIR/.config/foot/foot.ini" ]] && cp "$SCRIPT_DIR/.config/foot/foot.ini" ~/.config/foot/
    [[ -f "$SCRIPT_DIR/.config/helix/config.toml" ]] && cp "$SCRIPT_DIR/.config/helix/"* ~/.config/helix/
    [[ -f "$SCRIPT_DIR/.config/zellij/config.kdl" ]] && cp -r "$SCRIPT_DIR/.config/zellij/"* ~/.config/zellij/
    [[ -f "$SCRIPT_DIR/.config/yazi/yazi.toml" ]] && cp "$SCRIPT_DIR/.config/yazi/"* ~/.config/yazi/
    [[ -f "$SCRIPT_DIR/.config/btop/btop.conf" ]] && cp "$SCRIPT_DIR/.config/btop/"* ~/.config/btop/
    [[ -f "$SCRIPT_DIR/.config/mako/config" ]] && cp "$SCRIPT_DIR/.config/mako/config" ~/.config/mako/
    [[ -f "$SCRIPT_DIR/.config/swayosd/config.toml" ]] && cp "$SCRIPT_DIR/.config/swayosd/"* ~/.config/swayosd/
    
    # Shell configs
    [[ -f "$SCRIPT_DIR/.zshrc" ]] && cp "$SCRIPT_DIR/.zshrc" ~/
    [[ -f "$SCRIPT_DIR/.bashrc" ]] && cp "$SCRIPT_DIR/.bashrc" ~/
    
    # Scripts
    cp "$SCRIPT_DIR/scripts/"* ~/.local/bin/
    chmod +x ~/.local/bin/*
    
    # Systemd services
    cp "$SCRIPT_DIR/systemd/user/"* ~/.config/systemd/user/
    systemctl --user daemon-reload
    
    success "Configurations installed"
}

# ============================================================
# Main
# ============================================================

main() {
    echo -e "\n${CYAN}Step 1: Select packages${NC}"
    read -r -a selected <<< "$(select_packages)"
    
    echo -e "\n${CYAN}Step 2: Install yay${NC}"
    install_yay
    
    echo -e "\n${CYAN}Step 3: Install pacman packages${NC}"
    install_pacman_packages "${selected[@]}"
    
    echo -e "\n${CYAN}Step 4: Install AUR packages${NC}"
    install_aur_packages "${selected[@]}"
    
    if [[ " ${selected[*]} " =~ " nvidia " ]]; then
        echo -e "\n${CYAN}Step 5: Configure NVIDIA${NC}"
        configure_nvidia
    fi
    
    echo -e "\n${CYAN}Step 6: Configure system${NC}"
    configure_system
    
    echo -e "\n${CYAN}Step 7: Install configurations${NC}"
    install_configs
    
    echo -e "\n${GREEN}"
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                   Installation complete!                ║"
    echo "║                                                        ║"
    echo "║  Please reboot your system for changes to take effect. ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

main "$@"
