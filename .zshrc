pacman-Ql() {
    pacman -Ql $1 | cut -d' ' -f 2 | rg -e '/usr/bin/.' | sed -e 's/\/usr\/bin\///'
}

pacman-Qe() {
    pacman -Qe | column -t
}

open() {
    xdg-open $1 2> /dev/null
}

setopt PROMPT_SUBST

autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':completion:*' select squeeze-slashes true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle :compinstall filename '/home/thomas/.zshrc'
zstyle ':vcs_info:git:*' formats '%F{red}⎇  %b%f'

PROMPT='%F{yellow}%n@%M%f:%F{blue}%~%f%F{green}%#%f '
RPROMPT='${vcs_info_msg_0_}'
TERMINAL_EDITOR=nvim
export EDITOR=$TERMINAL_EDITOR
# GPG_TTY always needs to be equal to the value of the command `tty`
# for some reason. Otherwise some GPG related programs might not work.
export GPG_TTY=$(tty)
export HISTFILE=~/.cache/zsh/history
export HISTSIZE=10000
export SAVEHIST=10000

# Enable Vi mode, which starts in insert mode.
bindkey -v
# ctrl+P
bindkey "^P" up-line-or-search
# ctrl+N
bindkey "^N" down-line-or-search
# Backspace (which should be configured to send ASCII DEL (0x7F) by the
# terminal)
bindkey '\x7f' backward-delete-char
# shift+TAB
bindkey "^[[Z" reverse-menu-complete

alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='exa -laH --group-directories-first'
alias vim="$TERMINAL_EDITOR"
alias vi="$TERMINAL_EDITOR"
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias df='df -h'
alias cat='bat -pp'
alias nano='micro'
alias diff='colordiff -y'
alias du='dust'
alias hexdump='hexdump -C'
alias hd='hexdump'
alias l='ls'
alias find='fd --unrestricted'
alias compress='ouch compress'
alias decompress='ouch decompress'
# Print the actual path, no symlinks.
alias pwd='pwd -P'
alias 🦀='cargo'
alias ping='ping -c 2'
alias arp-scan='arp-scan -x'
alias grep='rg'

