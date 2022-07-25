set scrolloff=8
set mouse=a
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab
set termguicolors
set completeopt-=preview
set hidden
set guicursor=
set nohlsearch
set noerrorbells
set nowrap
set incsearch
set signcolumn=yes
set colorcolumn=100

" Remaps
let mapleader=" "
nnoremap <leader>pv :NvimTreeToggle<CR>
nnoremap <leader>pm :NvimTreeCollapse<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader><Space> :bn<CR>
nnoremap <leader>m :bp<CR>
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap qq :bd<CR>

" VSCode-Like <TAB> completion from coc-completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Vundle Stuff
set nocompatible
filetype off
syntax off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
call vundle#end()

" Vim-Plug Plugins
call plug#begin()
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'hoob3rt/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'lewis6991/spellsitter.nvim'
    Plug 'goolord/alpha-nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'f-person/git-blame.nvim'
    Plug 'windwp/nvim-autopairs'
    Plug 'Pocco81/AutoSave.nvim'
call plug#end()

" Lua Cofig for plugins
lua << END
    -- Lualine
    require('lualine').setup {
        options = {
            theme="material",
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' }
        }
    }

    -- Nvim-tree
    require("nvim-tree").setup()

    -- TreeSitter
    require('nvim-treesitter.configs').setup {
      highlight = { enable = true },
      indent = { enable = true }
    }

    -- Spellsitter
    require('spellsitter').setup()

    -- Nvim-colorizer
    require 'colorizer'.setup {
        '*'; -- Highlight all files, but customize some others.
        css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
    }

    -- Nvim-startup-theme
    require 'alpha'.setup(require'alpha.themes.startify'.config)

    -- Indent-line-marks
    require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
    }

    -- Nvim-autopairs
    require("nvim-autopairs").setup {}

    -- AutoSave
    require("autosave").setup({
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135

    })
END

" After Plugins
filetype on
syntax on

" Colors
colorscheme onehalfdark
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE

" AutoCMDs
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " Trim trailing whitespace every time file is saved
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TRIM_WHITESPACE
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
