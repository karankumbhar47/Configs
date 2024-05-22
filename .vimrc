""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"                                                                          "
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗                    "
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝                    "
"               ██║   ██║██║██╔████╔██║██████╔╝██║                         "
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║                         "
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗                    "
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝                    "
"                                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""        


set relativenumber          " add relative numbers to each line on the left-hand side.
set number                  " add numbers to each line on the left-hand side.
"set cursorline             " highlight cursor line underneath the cursor horizontally.
"set cursorcolumn           " highlight cursor line underneath the cursor vertically.
set nocompatible            " disable compatibility with vi which can cause unexpected issues.
set nowrap                  " do not wrap lines. allow long lines to extend as far as the line goes.
set shiftwidth=4            " set shift width to 4 spaces.
set tabstop=4               " set tab width to 4 columns.
set history=1000            " set the commands to save in history default number is 20.
set nobackup                " do not save backup files.
set incsearch               " while searching though a file incrementally highlight matching characters as you type.
set ignorecase              " ignore capital letters during search.
set hlsearch                " use highlighting when doing a search.
set showmatch               " show matching words during a search.
"set showmode               " show the mode you are on the last line.
set showcmd                 " show partial command you type in the last line of the screen.
set scrolloff=10            " do not let cursor scroll below or above n number of lines when scrolling.
set wildmenu                " enable auto completion menu after pressing tab.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
                            " there are certain files that we would never want to edit with vim.
                            " wildmenu will ignore files with these extensions.
set wildmode=list:longest   " make wildmenu behave like similar to bash completion.




filetype on                 " enable type file detection. vim will be able to try to detect the type of file in use.
syntax on                   " enable syntax
filetype plugin on          " enable plugins and load plugin for the detected file type.
filetype indent on          " load an indent file for the detected file type.





" plugins ---------------------------------------------------------------- {{{

" plugin code goes here.
call plug#begin()
  
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'vim-scripts/replacewithregister'
Plug 'junegunn/vim-slash'
"plug 'preservim/nerdcommenter'
"plug 'shougo/context_filetype.vim'
"plug 'pangloss/vim-javascript'
"plug 'evanleck/vim-svelte'
"plug 'leafgarland/typescript-vim'
"plug 'neoclide/coc.nvim', {'branch': 'release'}
"plug 'codechips/coc-svelte', {'do': 'npm install'}
"plug 'ryanoasis/vim-devicons'
"plug 'vim-airline/vim-airline'
"plug 'vim-airline/vim-airline-themes'
"plug 'tpope/vim-fugitive'
"plug 'tpope/vim-obsession'
"plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
"plug 'sudar/vim-arduino-syntax'
"plug 'edkolev/tmuxline.vim'
"plug 'mattn/emmet-vim'
"plug 'sheerun/vim-polyglot'
"plug 'dhruvasagar/vim-table-mode'
"plug 'triglav/vim-visual-increment'
"plug 'vim-scripts/drawit'
"plug 'dart-lang/dart-vim-plugin'
"plug 'natebosch/vim-lsc'
"plug 'natebosch/vim-lsc-dart'
Plug 'vimwiki/vimwiki'
"plug 'lilydjwg/colorizer'
"plug 'lervag/vimtex'
"plug 'nvim-lua/plenary.nvim'
"plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
"plug 'airblade/vim-gitgutter'
"plug 'sjl/gundo.vim'
"plug 'junegunn/fzf.vim', { 'do' : { -> fzf#install() } }

call plug#end()

" }}}


" mappings --------------------------------------------------------------- {{{

" mappings code goes here.

" nerdtree
nnoremap <leader>n :nerdtreefocus<cr>
nnoremap <c-n> :nerdtreetoggle<cr>
nnoremap <c-f> :nerdtreefind<cr>
" mirror the nerdtree before showing it. this makes it the same on all tabs.

" }}}


" vimscript -------------------------------------------------------------- {{{

" this will enable code folding.
" use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd filetype vim setlocal foldmethod=marker
augroup end

" more vimscripts code goes here.

" }}}


" status line ------------------------------------------------------------ {{{

" status bar code goes here.

" }}}
