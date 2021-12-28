# Overview

Minimal terminal configuration. Installs basic packages, ZSH with direnv and tmux.

Beyond the config provide by msauter the main changes are:

- Assumes you want to use direnv for managing environments
- Install only the most essential tools in the `install` script.
- Other tools can be installed with other scripts starting with
  `install-<someting>`. 

Status: experimental (see caveats below)

## Caveats

This is experimental as I have not used direnv a lot in practice.

### direnv

direnv hooks into the shell.
Like other tools the install instructions advise to install the direnv hook last.
This could be a true problem. Only time will tell whether this config will work
well with other tools.

To monitor environment changes direnv does not source the `.envrc` scripts.
This could break some tools which would require changes beyond the environment which would need be undone later. 
Also it typically mean that `.envrc` scripts need to be adjusted.
Note that in the context of these scripts the functions in the 
[direnv standard lib](https://github.com/direnv/direnv#the-stdlib) that makes this easier.

### direnv and tmux

There appear to be problems when using tmux with direnv.
However since I have not used tmux in quite some time I did not yet
find the time to see whether this is a serious issue.

See https://github.com/direnv/direnv/issues/106

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

By default git is configured via environment variable `GIT_CONFIG_GLOBAL` to read its config from `~/.config/henrjk/git/.gitconfig-global`.
This can be used to configure different user info, for example:

```config
[include]
  ; open source related user
  path = ~/.gituser

[includeIf "gitdir:~/code/work/"]
    path = ~/code/work/.gituser

[includeIf "gitdir:~/Documents/"]
    path = ~/code/work/.gituser

[include]
  path = ~/.gitconfig
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

# Installing additional tool versions

The following scripts have only been smoke tested -- at best.s

## Installing go

Some tooling requires a go version to be installed. 
This includes the standard approach of working with multiple go versions side by side
which is relying on the go command.

So to install such specific version you will need to have go version in the path.
If needed use `./install-go-global` to install such version.
As go versions have a good track record about backwards compatibility it is 
assumed that this version is not very critical and for security patches should be
kept up to date.s

To install a specific go version use `./install-go-go <version>`.
This installs `go<version>` which should be available in the path.
To get the matching direnv `.envrc` snippet use  `./envrc-go-go <version>`.

## Installing python versions

To minimize startup time for opening a shell no Python environment
is established by default.

To install versions of python use `./install-pyenv` which installs
pyenv and two recent minor versions of python.

To install another version of python use
`pyenv install -l` to lists available versions and
`pyenv install <version>` to install said version.

To get the matching direnv `.envrc` snippet use `./envrc-pyenv`. 
This also has a tip on how to manage the python version for 
a certain dir.  

## Installing node versions

nvm can be installed with `./install-nvm`.

This script also adds `zsh/sourced/nvm.zsh` which is sourced by `~/.zshrc`.
This is expected to be fast enough to not need to delay loading it.

To install a specific node version use nvm for example:
- `nvm ls-remote --lts`
- `nvm install -b 16` where `-b` is for binary install.

To get the matching direnv `.envrc` snippet to select that version
use `./envrc-nvm <version>`. 
