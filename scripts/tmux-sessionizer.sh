#!/usr/bin/env bash

selected=$(
    (
        find ~/dev -maxdepth 1 -mindepth 1 -type d
        if [[ -f ~/dev/dev-env/scripts/saved-folders ]]; then
            cat ~/dev/dev-env/scripts/saved-folders
        fi
    ) | fzf
)
if [[ -z "$selected" ]]; then
    exit 0
fi
selected_name=$(basename $selected | tr ".,: " "____")

switch_to() {
    if [[ -z "$TMUX" ]]; then
        tmux attach-session -t $selected_name
    else
        tmux switch-client -t $selected_name
    fi
}

if tmux has-session -t="$selected_name"; then
    switch_to
else
    tmux new-session -ds $selected_name -c $selected
    switch_to
fi
