#!/bin/bash
# ~/.config/tmux/session_list.sh
# A script to display a formatted list of tmux sessions for the status bar.

# Get the name of the current session
current_session=$(tmux display-message -p '#S')

# Get a list of all session names
all_sessions=$(tmux list-sessions -F '#S')

output=""
for session in $all_sessions; do
    if [ "$session" = "$current_session" ]; then
        # Format for the currently active session (Tokyonight Blue)
        output+="#[bg=#7aa2f7,fg=#222436,bold] $session #[default]"
    else
        # Format for inactive sessions
        output+="#[fg=#c0caf5] $session "
    fi
done

# Print the final formatted string
echo "$output"
