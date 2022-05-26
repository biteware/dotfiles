# Dotfiles

## Installation
In order to install the dotfiles you will need to symlink the files to their relevant locations. Below is a list of the symlinks required for installation.


## Go Setup
Update the version to the version of Go that you need.
```bash
$ wget https://go.dev/dl/go1.17.5.linux-amd64.tar.gz
$ sudo tar -C /usr/local/ -xzf go1.17.5.linux-amd64.tar.gz
```
Update your `$PATH` in your `~/.bash_profile`.
```bash
$ $GOROOT=/usr/local/go
$ PATH=$PATH:$GOROOT/bin/
```

#### Install gopls Server
Provides autocomplete, linting and a bunch of other cool bits.
```bash
$ go install golang.org/x/tools/gopls@latest
```
#### Delve
Delve is the primary debugger used in the Go ecosystem enabling step throughs
and all manner of cool bits. The command line is a bit harder to get use to but
gives you more flexibility and options.
```bash
$ git clone https://github.com/go-delve/delve
$ cd delve
$ go install github.com/go-delve/delve/cmd/dlv
```

## Neovim Setup
Install Neovim from source.
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage nvim
sudo mv nvim.appimage /usr/local/bin/
```
if the appimage fails to run
```bash
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Optional: exposing nvim globally
mv squashfs-root / && ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim
```

Symlink the `init.vim` file for configuration and the lua files.
```
$ ln -s $HOME/workspace/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
$ ln -s $HOME/workspace/dotfiles/nvim/lua/compe-config.lua ~/.config/nvim/lua/compe-config.lua
$ ln -s $HOME/workspace/dotfiles/nvim/lua/gopls-ls.lua ~/.config/nvim/lua/gopls-ls.lua
```

Install `vim-plug`
```bash
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Run `vim-plug` to install vim plugins.
```bash
$ nvim

# While inside nvim...
:PlugInstall
```

## Terminator Setup
Tmux can often be a pain with colorschemes in vim and rather than wrestle with
that for an afternoon an easier solution is to use a different terminal that
supports split windows in a similar fashion such as terminator.

```bash
$ yum install terminator
```

Default shells are boring so lets add a theme to make it look pretty. After
these steps are complete open terminator and `terminator > preferences >
plugins` you should see themes which you can enable and choose one you like.

```bash
$ yum install python-pip
$ mkdir -p $HOME/.config/terminator/plugins
$ wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
```

## Misc Setup
Symlink your `.bashrc` and `.tmuxconf`
```bash
$ ln -s $HOME/workspace/dotfiles/bash/bashrc ~/.bashrc
```

