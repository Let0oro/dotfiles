# ──────────────────────────────────────────────────────────────────────────────
# GUARD — Solo ejecutar en sesiones interactivas
# ──────────────────────────────────────────────────────────────────────────────

[[ $- != *i* ]] && return


# ──────────────────────────────────────────────────────────────────────────────
# HISTORIAL
# ──────────────────────────────────────────────────────────────────────────────
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
HISTSIZE=32768
SAVEHIST=32768


# ──────────────────────────────────────────────────────────────────────────────
# AUTOCOMPLETADO
# ──────────────────────────────────────────────────────────────────────────────
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


# ──────────────────────────────────────────────────────────────────────────────
# EXPORTS — Editor, temas, rutas
# ──────────────────────────────────────────────────────────────────────────────
export EDITOR="helix"
export SUDO_EDITOR="$EDITOR"
export BAT_THEME=ansi
export RUSTC_WRAPPER=sccache
export LIBVA_DRIVER_NAME=iHD
export FLYCTL_INSTALL="$HOME/.fly"

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export NDK_HOME=$ANDROID_HOME/ndk/27.0.12077973
export ANDROID_SDK_ROOT=$HOME/Android/Sdk

# Java
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk


# ──────────────────────────────────────────────────────────────────────────────
# PATH
# ──────────────────────────────────────────────────────────────────────────────
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:/home/juanma/.turso"


# ──────────────────────────────────────────────────────────────────────────────
# ENTORNOS — Cargo, mise, starship, zoxide, fzf, zellij
# ──────────────────────────────────────────────────────────────────────────────
. "$HOME/.cargo/env"

if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi

if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

if command -v try &> /dev/null; then
  eval "$(try init ~/Work/tries)"
fi

if command -v fzf &> /dev/null; then
  [[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
  [[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
fi


# ──────────────────────────────────────────────────────────────────────────────
# INTEGRACIONES — Kiro, Zellij
# ──────────────────────────────────────────────────────────────────────────────
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# Elimina esta línea si prefieres lanzar zellij manualmente con el alias `devh`
# if command -v zellij &> /dev/null; then
#   eval "$(zellij setup --generate-auto-start zsh)"
# fi


# ──────────────────────────────────────────────────────────────────────────────
# FILESYSTEM — eza, fzf preview, zoxide wrapper
# ──────────────────────────────────────────────────────────────────────────────
if command -v eza &> /dev/null; then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='ls -a'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='lt -a'
fi

alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

if command -v zoxide &> /dev/null; then
  alias cd="zd"
  zd() {
    if [ $# -eq 0 ]; then
      builtin cd ~ && return
    elif [ -d "$1" ]; then
      builtin cd "$1"
    else
      z "$@" && printf "\U000F17A9 " && pwd || echo "Error: Directory not found"
    fi
  }
fi

open() {
  xdg-open "$@" >/dev/null 2>&1 &
}


# ──────────────────────────────────────────────────────────────────────────────
# ALIASES — Navegación, herramientas, git
# ──────────────────────────────────────────────────────────────────────────────

# Directorios
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# General
alias zed="zeditor"
alias py="python3"
alias pym="python3 -m"
alias pyme="python3 -m venv env"
alias gc="gcc -O0 -g -Wall -o"
alias fm="yazi"
alias f="fzf"
alias lf="ls -la | fzf"
alias ll="ls -la"
alias cr="opencode run"
alias c='opencode'
alias d='docker'
alias r='rails'

# Zellij
alias devh="zellij --layout ~/.config/zellij/layouts/code.kdl"
alias hxp="~/.local/bin/zj-hx-pick"
alias zpipe="zellij pipe -p"
alias zpipep="zellij pipe -p filepicker"

# Multimedia / sistema
alias screenrec="wl-screenrec --low-power=off -f ~/Videos/ScreenCasts/salida.mp4"
alias antigravity_upload="curl -sSL https://raw.githubusercontent.com/BOTOOM/google-antigravity-bin-arch/main/install_antigravity | bash"
alias start_n8n_empleo="docker rm -f n8n && docker run -d --name n8n --restart unless-stopped --dns 8.8.8.8 --dns 8.8.4.4 -v n8n_data:/home/node/.n8n -p 5678:5678 n8nio/n8n && vivaldi http://localhost:5678/home/workflows https://www.notion.so/CP-Juan-Manuel-Montero-Benavides-305ca4d7607b8062bbb9e71a1244d10f?source=copy_link"

# Git
alias g='git'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'


# ──────────────────────────────────────────────────────────────────────────────
# FUNCIONES — Editores, compresión, disco, multimedia
# ──────────────────────────────────────────────────────────────────────────────
n() { if [ "$#" -eq 0 ]; then nvim .; else nvim "$@"; fi; }

# Compresión
compress() { tar -czf "${1%/}.tar.gz" "${1%/}"; }
alias decompress="tar -xzf"

# Escribir ISO en SD
iso2sd() {
  if [ $# -ne 2 ]; then
    echo "Usage: iso2sd <input_file> <output_device>"
    echo "Example: iso2sd ~/Downloads/ubuntu-25.04-desktop-amd64.iso /dev/sda"
    echo -e "\nAvailable SD cards:"
    lsblk -d -o NAME | grep -E '^sd[a-z]' | awk '{print "/dev/"$1}'
  else
    sudo dd bs=4M status=progress oflag=sync if="$1" of="$2"
    sudo eject $2
  fi
}

# Formatear disco completo como exFAT
format-drive() {
  if [ $# -ne 2 ]; then
    echo "Usage: format-drive <device> <name>"
    echo "Example: format-drive /dev/sda 'My Stuff'"
    echo -e "\nAvailable drives:"
    lsblk -d -o NAME -n | awk '{print "/dev/"$1}'
  else
    echo "WARNING: This will completely erase all data on $1 and label it '$2'."
    read -rp "Are you sure you want to continue? (y/N): " confirm

    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      sudo wipefs -a "$1"
      sudo dd if=/dev/zero of="$1" bs=1M count=100 status=progress
      sudo parted -s "$1" mklabel gpt
      sudo parted -s "$1" mkpart primary 1MiB 100%

      partition="$([[ $1 == *"nvme"* ]] && echo "${1}p1" || echo "${1}1")"
      sudo partprobe "$1" || true
      sudo udevadm settle || true

      sudo mkfs.exfat -n "$2" "$partition"
      echo "Drive $1 formatted as exFAT and labeled '$2'."
    fi
  fi
}

# Vídeo
transcode-video-1080p() {
  ffmpeg -i $1 -vf scale=1920:1080 -c:v libx264 -preset fast -crf 23 -c:a copy ${1%.*}-1080p.mp4
}

transcode-video-4K() {
  ffmpeg -i $1 -c:v libx265 -preset slow -crf 24 -c:a aac -b:a 192k ${1%.*}-optimized.mp4
}

# Imágenes
img2jpg() {
  img="$1"; shift
  magick "$img" $@ -quality 95 -strip ${img%.*}-optimized.jpg
}

img2jpg-small() {
  img="$1"; shift
  magick "$img" $@ -resize 1080x\> -quality 95 -strip ${img%.*}-optimized.jpg
}

img2png() {
  img="$1"; shift
  magick "$img" $@ -strip \
    -define png:compression-filter=5 \
    -define png:compression-level=9 \
    -define png:compression-strategy=1 \
    -define png:exclude-chunk=all \
    "${img%.*}-optimized.png"
}

# ──────────────────────────────────────────────────────────────────────────────
# ZELLIJ AUTOSTART
# ──────────────────────────────────────────────────────────────────────────────
if [[ -z "$ZELLIJ" ]] && command -v zellij &> /dev/null; then
  # SESSION="zsess"
  # Si la sesión existe Y hay alguien conectado, crea una nueva sin nombre
  # if zellij list-sessions 2>/dev/null | grep -q "^${SESSION}.*ATTACHED"; then
    exec zellij
  # else
    # exec zellij attach -c "$SESSION"
  # fi
fi
