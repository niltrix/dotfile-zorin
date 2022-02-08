if status is-interactive
  # Commands to run in interactive sessions can go here
  set -g theme_color_scheme nord
  set -g direnv_fish_mode eval_on_arrow
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/bj/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# golang config
if test -e /usr/local/go/bin
  fish_add_path /usr/local/go/bin
end

# rust config
if test -e $HOME/.cargo/bin
  fish_add_path $HOME/.cargo/bin
end

# direnv config
if not functions -q __direnv_export_eval; and command -sq direnv
  direnv hook fish | source
  direnv export fish | source
end
