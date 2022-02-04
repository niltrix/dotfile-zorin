if status is-interactive
    set -g theme_color_scheme nord
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/bj/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

