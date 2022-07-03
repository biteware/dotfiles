set nocompatible
    filetype plugin on
syntax on

let g:mapleader = "\<Space>"

set hidden
set encoding=utf-8
set belloff=all
set number
set relativenumber
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
set number
set noshowmode
set termguicolors
set noswapfile

"telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" quiclist keybinds
nnoremap <silent> <M-]> :cnext<CR>
nnoremap <silent> <M-[> :cprevious<CR>
nnoremap <silent> <M-#> :cclose<CR>

" LSP Keybinds
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <M-f> <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <M-h> <cmd>lua vim.lsp.buf.hover()<CR>

" other Keybinds
nnoremap <leader>fv :Explore<CR>
nnoremap <leader>x :silent !chmod +x %<CR>

autocmd BufWritePre *.go lua goimports(1000)
autocmd BufWritePre *go lua vim.lsp.buf.formatting()

let g:gitgutter_enable = 1

call plug#begin(stdpath('data') . '/plugged')
    Plug 'neovim/nvim-lspconfig'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    
    " For vsnip users.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    " colorschemes
    Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox

set completeopt=menu,menuone,noselect

" Setup global configuration. More on configuration below.
lua << EOF
local cmp = require "cmp"
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  mapping = {
     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
     ['<C-f>'] = cmp.mapping.scroll_docs(4),
     ['<C-e>'] = cmp.mapping.abort(),
     ['<CR>'] = cmp.mapping.confirm({ select = true }),
     ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
     ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}
EOF

luafile ~/.config/nvim/lua/gopls.lua
luafile ~/.config/nvim/lua/clang.lua
