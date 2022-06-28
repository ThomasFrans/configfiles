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

zstyle ':completion:*' menu yes select squeeze-slashes true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle :compinstall filename '/home/thomas/.zshrc'
zstyle ':vcs_info:git:*' formats '%F{red}⎇  %b%f'

PROMPT='(%F{yellow}%n%f@%F{yellow}%M%f: %F{blue}%~%f)%F{green}%#%f '
RPROMPT='${vcs_info_msg_0_}'

HISTFILE=~/.cache/zsh/history
HISTSIZE=5000
SAVEHIST=5000
bindkey -v
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

alias config='git --git-dir=/home/thomas/.cfg/ --work-tree=/home/thomas'
alias ls='exa -la --group-directories-first'
alias sudo='doas'
alias vim='nvim'

export PATH=${PATH}:${HOME}/.local/bin
# GPG_TTY always needs to be equal to the value of the command `tty`
# for some reason. Otherwise some GPG related programs might not work.
export GPG_TTY=$(tty)

