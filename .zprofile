# Run for every invocation of zsh, interactive or not!

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    export MOZ_ENABLE_WAYLAND=1
fi

export PATH=$PATH:$HOME/.local/bin/:$HOME/.cargo/bin/:$HOME/.mxe/usr/bin/
export ZDOTDIR="$HOME/.config/zsh/"
