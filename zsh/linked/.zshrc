for file in ~/.config/henrjk/*/sourced/*\.zsh; do
  source $file
done

eval "$(direnv hook zsh)"