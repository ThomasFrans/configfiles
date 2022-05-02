#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/.local/bin
export EDITOR=vim
export BROWSER=firefox

command_not_found_handle() {
    echo "Invalid"
}
