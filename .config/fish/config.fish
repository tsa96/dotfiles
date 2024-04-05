if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting
function config
    git --git-dir="$HOME"/.cfg --work-tree="$HOME"/ $argv
end

starship init fish | source
