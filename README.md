# Dotfiles
A collection of my local environment setup files, created to make my life easier when setting up environments on new machines.

## Installation
Neovim and the LSP Server
```bash
# TODO: Instructions
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
```
  
Install the Plugins via vim-plug  
```bash
:PlugInstall
```

## Autobackup
Sets the backup to run every day at 18:00. 
```bash
crontab -e
0 18 * * * $HOME/workspace/dotfiles/backup.sh
```

