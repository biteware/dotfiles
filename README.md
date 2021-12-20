# Dotfiles
A collection of my local environment setup files, created to make my life easier when setting up environments on new machines.

## Installation
###Install Go
Visit the following page and grab the latest version with wget - https://go.dev/dl/
```bash
wget https://go.dev/dl/go1.17.5.linux-amd64.tar.gz
sudo tar -C /usr/local/ -xzf go1.17.5.linux-amd64.tar.gz
```

Update the Path Variable
```bash
$GOROOT=/usr/local/go
PATH=$PATH:$GOROOT/bin/
```

### Neovim and the LSP Server
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage nvim
sudo mv nvim.appimage /usr/local/bin/
```

If the appimage fails to run
```bash
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Optional: exposing nvim globally
mv squashfs-root / && ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim
```

### Symlinking and Plugin Installs
**.bashrc file**  
```bash
ln -s $HOME/workspace/dotfiles/bash/bashrc ~/.bashrc
```

**Neovim**  
Begin by symlinking the `init.vim` file and the relevant lua files.
```bash
ln -s $HOME/workspace/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s $HOME/workspace/dotfiles/nvim/lua/bash-ls.lua ~/.config/nvim/lua/bash-ls.lua
ln -s $HOME/workspace/dotfiles/nvim/lua/compe-config.lua ~/.config/nvim/lua/compe-config.lua
ln -s $HOME/workspace/dotfiles/nvim/lua/gopls-ls.lua ~/.config/nvim/lua/gopls-ls.lua
ln -s $HOME/workspace/dotfiles/nvim/lua/rust-ls.lua ~/.config/nvim/lua/rust-ls.lua
```

Install vim-plug
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
  
Install the Plugins via vim-plug  
```bash
:PlugInstall
```

## Language Servers
### gopls
```bash
```

### rust-analyzer
```bash
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
```

## Autobackup
Sets the backup to run every day at 18:00. 
```bash
crontab -e
0 18 * * * $HOME/workspace/dotfiles/backup.sh
sudo service cron start
```

## Delve
You may have to move this into your `usr/local/go/bin` directory manually depending on system setup.
```
go install github.com/go-delve/delve/cmd/dlv@latest
```
