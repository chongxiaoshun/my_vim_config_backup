" PLUGINS -------------------------------------------------------------- {{{ 
call plug#begin('~/.vim/plugged') 
    Plug 'preservim/nerdtree' 
    Plug 'dense-analysis/ale'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()
" }}}

" BASIC_CONFIG ---------------------------------------------------------- {{{
" disable compatibility with vi which can cause unexpected issues
set nocompatible

" enable type file detaction. vim will be able to detect the type of the file in use
filetype on

" enable plugins and load plugin for the detected file type
filetype plugin on 

" load an indent file for detected file type
filetype indent on

" turn syntax lighlighting on 
syntax on

" set line number
set number

" highlight cursor line underneath the cursor horizontally and vertically
set cursorline
"set cursorcolumn

" set shift width to 4 spaces
set shiftwidth=4

" set tab width to 4
set tabstop=4

" use space characters instead of tabs
set expandtab

" do not save backup files
set nobackup

" do not let cursor scoll below or above N number of lines when scrolling.
set scrolloff=10

" do not wrap lines
set nowrap

" while searching though a file incrementally highlight matching characters as
" you type
set incsearch

" ignore capital letters while searching
set ignorecase

" orverride the ignorecase option if searching for capital letters
set smartcase

" show partial command you type in the last line of the screen
set showcmd

" show the mode you are on the last line
set showmode

" show matching words during a search
set showmatch

" use highlighting when searching
set hlsearch

" set the commands to save in history default is 20
set history=1000

" enable auto completion menu after pressing tab
set wildmenu

" make wildmenu behave like similar to Bash completion
set wildmode=list:longest

" there are certain file types that we never want to eidt with vim
" wildmenu will ignore files with these extensions
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" when use gruvbox, the airline gruvbox config file is auto loaded
" howere, gruvbox airline depand on air-line vim plugin, so must install it
" since gruvbox use a different fontset from our ubuntu default fontset
" we need to download power-line font patch from: https://github.com/powerline/fonts
" we can git clone all the patched font into /usr/local/share/fonts or subdir
" then sudo fc-chache -fv
" select patched font using gui font selector: here we choose ubuntu mono derivative Powerline
" restart ternimal we will see vim has change, the status bar is going good.
" colorschemes
set background=dark
let g:airline_powerline_fonts = 1
set t_Co=256
let g:gruvbox_contrast_dark="hard"
let g:airline#extensions#tabline#enabled=1
let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_underline=1

" this must be at last
colorscheme gruvbox
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{
" this will enable code folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" if the current file type is html, set indantation to 2 spaces.
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab

" vim undo and redo: undo press u; redo press ctrl+R
" if vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
" undodir:List of directory names for undo files, separated with commas."

if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" when split window with :split or :vsplit, display cursorline and
" cursorcolumn only in active window
augroup cursor_off
    autocmd!
    autocmd Winleave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END








" }}}

" KEY_MAP ---------------------------------------------------------------- {{{
" nnoremap map keys in normal mode
" inoremap map keys in insert mode
" vnoremap map keys in visual mode
inoremap jj <esc>

" Mapleader will allow you set a key unused by Vim as the <leader> key.
" The leader key, in conjunction with another key, will allow you to create new shortcuts.
let mapleader = '\'

" press \\ to jump back to the last cursor position
nnoremap <leader>\ ``

" press \p to print the current file to the default printer from a linux OS
" view available printers: lpstat -v
" set defautl printer: lpoptions -d <printer_name>
" <slient> means do not display output
" nnoremap <slient> <leader>p :%w !lp<CR>
"
" press the space bar to type the : character in command mode.
nnoremap <space> :

" press the letter o will open a new line below the current one.
" exit insert mode after creating a new line above or below the current line
nnoremap o o<esc>
nnoremap O O<esc>

" center the cursor vertically when moving to the next word during a search
nnoremap n nzz
nnoremap N Nzz

" yank from cursor to the end of line -- yank means copy; Copy is called yank
" ( y ), cut is called delete ( d ), and paste is called put ( p ).
nnoremap Y y$

" map the f5 key to run a javascript script inside vim
" here, map f5 to a chain of commands
" :w saves the file
" <CR> carriage return is like pressing the enter key
" !clear runs the external clear screnn command
" !node % executes the current js file with node
nnoremap <f5> :w <CR>:!clear <CR>:!node % <CR>

" you can split the window in vim by typing :split or :vsplit.
" :split and :vsplit split window by two directions.
" navigate the split view easier by pressing ctrl+j, ctrl+k, ctrl+h or ctrl+l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" resize split windows using arrow keys by pressing:
" ctrl+up, ctrl+down, ctrl+left, ctrl+right
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTREE specific mappings
" map the f3 key to toggle NERDTree open and close
nnoremap <F3> :NERDTreeToggle<CR>


" }}}



