pacman-Ql() {
    pacman -Ql $1 | cut -d' ' -f 2 | rg -e '/usr/bin/.' | sed -e 's/\/usr\/bin\///'
}

pacman-Qe() {
    pacman -Qe | column -t
}

decompress() {
    base_name=$(echo $1 | sed -e 's/\..*$//')
    ouch decompress -o $base_name $1
}

setopt PROMPT_SUBST

autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':completion:*' select squeeze-slashes true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle :compinstall filename '/home/thomas/.zshrc'
zstyle ':vcs_info:git:*' formats '%F{red}⎇  %b%f'

PROMPT='%F{yellow}%n@%M%f:%F{blue}%~%f%F{green} %#%f '
RPROMPT='${vcs_info_msg_0_}'
TERMINAL_EDITOR=nvim
export EDITOR=$TERMINAL_EDITOR
export PATH=${PATH}:${HOME}/.local/bin
# GPG_TTY always needs to be equal to the value of the command `tty`
# for some reason. Otherwise some GPG related programs might not work.
export GPG_TTY=$(tty)
export HISTFILE=~/.cache/zsh/history
export HISTSIZE=10000
export SAVEHIST=10000

bindkey -v
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey "^[[Z" reverse-menu-complete

alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='exa -laH --group-directories-first'
alias sudo='doas'
alias vim="$TERMINAL_EDITOR"
alias vi="$TERMINAL_EDITOR"
alias open='xdg-open'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias df='df -h'
alias cat='bat -pp'
alias nano='micro'
alias diff='colordiff -y'
alias du='du -sh'
alias hexdump='hexdump -C'
alias hd='hexdump'
alias l='ls'
alias find='fd'
alias rm='trash'
alias compress='ouch compress'
alias 🦀='cargo'

