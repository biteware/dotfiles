set nocompatible
    filetype plugin on
syntax on

call plug#begin(stdpath('data') . '/plugged')
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'preservim/nerdtree'
call plug#end()

luafile ~/.config/nvim/lua/compe-config.lua
luafile ~/.config/nvim/lua/bash-ls.lua
luafile ~/.config/nvim/lua/gopls-ls.lua

colorscheme nord

set hidden
set encoding=utf-8
set belloff=all
set number
set hlsearch
set incsearch
set ignorecase
set showmatch
set t_Co=256
set ruler
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set pumheight=10
set autoindent
set laststatus=0
set cursorline
set clipboard=unnamedplus
set iskeyword+=-
set background=dark


" LSP Keybinds
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <M-f> <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <M-h> <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <M-p> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <M-n> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

autocmd BufWritePre *.go lua goimports(1000)
autocmd BufWritePre *go lua vim.lsp.buf.formatting()

" NERDTree Keybinds
nnoremap <C-n> :NERDTreeToggle<CR>
