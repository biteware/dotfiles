set nocompatible
    filetype plugin on
syntax on

let g:mapleader = "\<Space>"

call plug#begin(stdpath('data') . '/plugged')
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'preservim/nerdtree'
    Plug 'arcticicestudio/nord-vim'
    Plug 'itchyny/lightline.vim'
    Plug 'airblade/vim-gitgutter'
call plug#end()

luafile ~/.config/nvim/lua/compe-config.lua
luafile ~/.config/nvim/lua/gopls-ls.lua

set hidden
set encoding=utf-8
set belloff=all
set number
set hlsearch
set incsearch
set ignorecase
set showmatch
set ruler
set tabstop=4
set shiftwidth=4
set textwidth=80
set colorcolumn=+1
set smarttab
set expandtab
set smartindent
set pumheight=10
set autoindent
set cursorline
set clipboard=unnamedplus
set iskeyword+=-
set relativenumber
set noshowmode

if !has('gui_running')
    set t_Co=256
endif

set termguicolors
colorscheme nord

" quiclist keybinds
nnoremap <silent> <M-]> :cnext<CR>
nnoremap <silent> <M-[> :cprevious<CR>
nnoremap <silent> <M-#> :cclose<CR>

" LSP Keybinds
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <M-f> <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <M-h> <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> <M-p> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
"nnoremap <silent> <M-n> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

autocmd BufWritePre *.go lua goimports(1000)
autocmd BufWritePre *go lua vim.lsp.buf.formatting()

" NERDTree Keybinds
nnoremap <C-n> :NERDTreeToggle<CR>

" However, in Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn+=51

let g:gitgutter_enable = 1
