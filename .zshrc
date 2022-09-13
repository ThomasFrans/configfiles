pacman-Ql() {
    pacman -Ql $1 | rg -e "[^/]$"
}

pacman-Qe() {
    pacman -Qe | column -t
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
HISTFILE=~/.cache/zsh/history
HISTSIZE=5000
SAVEHIST=5000
export EDITOR=nvim

bindkey -v
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey "^[[Z" reverse-menu-complete

alias config='git --git-dir=/home/thomas/.cfg/ --work-tree=/home/thomas'
alias ls='exa -laH --group-directories-first'
alias sudo='doas'
alias vim='nvim'
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

export PATH=${PATH}:${HOME}/.local/bin
# GPG_TTY always needs to be equal to the value of the command `tty`
# for some reason. Otherwise some GPG related programs might not work.
export GPG_TTY=$(tty)
export HISTFILE=~/.cache/zsh/history
export HISTSIZE=10000
export SAVEHIST=10000

