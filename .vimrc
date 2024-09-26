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
set viminfo+=n~/.config/history/.viminfo



filetype on                 " enable type file detection. vim will be able to try to detect the type of file in use.
syntax on                   " enable syntax
filetype plugin on          " enable plugins and load plugin for the detected file type.
filetype indent on          " load an indent file for the detected file type.




" plugins ---------------------------------------------------------------- {{{

" plugin code goes here.
call plug#begin()

" primeagen game
Plug 'ThePrimeagen/vim-be-good'

" comments shortcut
Plug 'tpope/vim-commentary'

" fuzzy finder or naviagation
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

" require for telescope
Plug 'nvim-lua/plenary.nvim' 

" faster navigation
Plug 'ThePrimeagen/harpoon'

" remove higlighting after search 
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-easy-align'
 

"Plug 'vim-scripts/replacewithregister'
"Plug 'preservim/nerdtree'
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
"Plug 'tpope/vim-surround'
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
"Plug 'vimwiki/vimwiki'
"plug 'lilydjwg/colorizer'
"plug 'lervag/vimtex'
"plug 'nvim-lua/plenary.nvim'
"plug 'airblade/vim-gitgutter'
"plug 'sjl/gundo.vim'
"plug 'junegunn/fzf.vim', { 'do' : { -> fzf#install() } }

call plug#end()

" }}}


" mappings --------------------------------------------------------------- {{{

" mappings code goes here.

" specify leader key
let mapleader = " "

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" horpoon (quick navigation) 
nnoremap <leader>a <cmd>:lua require("harpoon.mark").add_file()<cr>
nnoremap <C-h> <cmd>:lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <a-1> <cmd>:lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <a-2> <cmd>:lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <a-3> <cmd>:lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <a-4> <cmd>:lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <a-5> <cmd>:lua require("harpoon.ui").nav_file(5)<cr>
nnoremap <a-6> <cmd>:lua require("harpoon.ui").nav_file(6)<cr>
nnoremap <a-7> <cmd>:lua require("harpoon.ui").nav_file(7)<cr>


" nerdtree
nnoremap <leader>n :nerdtreefocus<cr>
nnoremap <c-n> :nerdtreetoggle<cr>
nnoremap <c-f> :nerdtreefind<cr>
" mirror the nerdtree before showing it. this makes it the same on all tabs.


" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
" nnoremap <leader>p "+p
nnoremap <leader>P "+P
"vnoremap <leader>p "+p
vnoremap <leader>P "+P

" general mapping
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
xnoremap <leader>p "_dP

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
