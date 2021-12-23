# Overview

Minimal terminal configuration. Installs basic packages, ZSH and tmux.

# Setup

```sh
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
git clone https://github.com/martinlindhe/base16-iterm2 ~/.config/base16-iterm2
git clone https://github.com/henrjk/config.git ~/.config/henrjk
~/.config/henrjk/install
```

# Customization

Files located at `~/.config/henrjk/custom/sourced` and ending in `.zsh` are
autoloaded by `.zshrc`.

Files located at `~/.config/henrjk/custom/linked` are symlinked to `$HOME` by
the `ìnstall` script.

All files in `~/.config/henrjk/custom/sourced` and
`~/.config/henrjk/custom/linked` are ignored by git.

# Git

Create a `~/.gituser` file for the right user:

```sh
[user]
  name = Your Name
  email = mail@example.com
  signingkey=7C60sD5D6
```

# SSH Agent

On MacOS, create the following `.ssh/config`:

```sh
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
```

# iTerm Setup

In the preferences go to "Profiles > Colors" and under "Color Presets", click
"Import ...". Then navigate to `~/.config/base16-iterm2/itermcolors`. You can
press `Cmd+Shift+.` to show hidden folders. Select
`base16-eighties-256.itermcolors`, and then click on "Color Presets" and choose the
new item `base16-eighties-256`.

To enable copying in tmux, check "Applications in terminal may access
clipboard" in "General > Selections" to automatically copy text selected with
the mouse while respecting panes.
