export PS1="➤ "

export POWERLINE_NO_SHELL_PROMPT="TRUE"
. "$HOME/.config/powerline/bindings/bash/powerline.sh"

. /usr/local/etc/bash_completion.d/git-completion.bash
. /usr/local/etc/bash_completion.d/git-prompt.sh
. /usr/local/etc/bash_completion.d/go-completion.bash
. /usr/local/etc/bash_completion.d/hg-completion.bash
. /usr/local/etc/bash_completion.d/tmux

if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls 2>/dev/null | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        exec tmux new-session >/dev/null 2>&1
    else
        exec tmux attach-session -t "$ID" >/dev/null 2>&1 # if available attach to it
    fi
fi
