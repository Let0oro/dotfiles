# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# Basic defaults
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'

# Add your own exports, aliases, and functions here.
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
alias screenrec="wl-screenrec --low-power=off -f ~/Videos/ScreenCasts/salida.mp4"
alias antigravity_upload="curl -sSL https://raw.githubusercontent.com/BOTOOM/google-antigravity-bin-arch/main/install_antigravity | bash"
alias start_n8n_empleo="docker rm -f n8n && docker run -d --name n8n --restart unless-stopped --dns 8.8.8.8 --dns 8.8.4.4 -v n8n_data:/home/node/.n8n -p 5678:5678 n8nio/n8n && vivaldi http://localhost:5678/home/workflows https://www.notion.so/CP-Juan-Manuel-Montero-Benavides-305ca4d7607b8062bbb9e71a1244d10f?source=copy_link"
alias devh="zellij --layout ~/.config/zellij/layouts/code.kdl"
alias hxp="~/.local/bin/zj-hx-pick"
alias zpipe="zellij pipe -p"
alias zpipep="zellij pipe -p filepicker"

. "$HOME/.cargo/env"
. "$HOME/.local/share/../bin/env"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path bash)"

export EDITOR="helix"

eval "$(zellij setup --generate-auto-start bash)"

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export NDK_HOME=$ANDROID_HOME/ndk/27.0.12077973
export ANDROID_SDK_ROOT=$HOME/Android/Sdk

# PATH — cargo de rustup primero para que tenga prioridad sobre /usr/bin/cargo
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:/home/juanma/.turso"

export RUSTC_WRAPPER=sccache
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export LIBVA_DRIVER_NAME=iHD
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH="$JAVA_HOME/bin:$PATH"

