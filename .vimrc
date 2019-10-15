" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
" Type :PlugInstall or :PlugClean for adding/removing plugins

" Features so far:
" File Explorer
" Easy Commenting
" Completion/suggestions
" Sytax Evaluation
" Formatter
" Fuzzy search
" Easymotion
" More complete status bar

" Features to add
" git integration
" snippets bank

"-- PLUGINS (Using junegunn/vim-plug) --
call plug#begin()
" Plug 'ternjs/tern_for_vim', { 'do':'npm install'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'valloric/youcompleteme'
" Plug 'mattn/emmet-vim'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'vim-airline/vim-airline'
call plug#end()


" ----------------------------------------------------------------------------
" Master Mappings
" ----------------------------------------------------------------------------
" Map escape sequences to their alt combinations
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
" Timeout to know if it was Esc j or Alt j
set timeout ttimeoutlen=50

" ----------------------------------------------------------------------------
" Basics
" ----------------------------------------------------------------------------
" Type :so % (:source %) to refresh .vimrc after making changes

" Color scheme
:colo jellybeans

" Set <leader> to spacebar
let mapleader =" "

" Enable the mouse
set mouse=a

" Use the same clipboard as your desktop (+ clipboard)
" NOTE - only works after installing vim gtk
" check for +clipboard in vim --version | grep clipboard to see if you're good to go
set clipboard=unnamedplus

" For changing displayed buffers without having to save the file
set hidden

" Syntax Higlighting
syntax on

" Show line numbers on the left. Make them the relative numbers to your
" current line
set number relativenumber

" Activates filetype detection and other stuff and autocompletion
filetype indent plugin on
set omnifunc=syntaxcomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
set wildmode=longest,list,full

" I like utf-8
set encoding=utf-8

" Always have the status bar displayed below
set laststatus=2
" Disable automatic comenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Save backup(original) files, swap files and in separate directories
" // means that the path to the edited file will be saved in the file name
set backupdir=~/temp/.backup//
set directory=~/temp/.swp//
set undodir=~/temp/.undo//
" Possible but unsafe alternatives
" set noswapfile
" set nobackup
" set nowritebackup
" set noundofile

" Disable swap file warning
set shortmess+=A

" set cursorline " highlight current line
" set ruler " show cursor position all time

" Indent with 2 spaces
" If 'expandtab' is set, pressing the <TAB> key will always insert 'softtabstop' amount of space characters.
set expandtab
" affects what happens when you press >>, << or ==. It also affects how automatic indentation works.
set shiftwidth=2
" affects what happens when you press the <TAB> or <BS> keys. Its default value is the same as the value of 'tabstop', but when using indentation without hard tabs or mixed indentation, you want to set it to the same value as 'shiftwidth'.
set softtabstop=2

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitright splitbelow

" Start in insertmode when creating new file
autocmd BufNewFile * startinsert

" Always wrap long lines, 79 characters
" default format options: ql view with set fo?
"set wrap linebreak nolist
set wrap
set fo+=t
set fo-=l
"set tws=0
set tw=79

" ----------------------------------------------------------------------------
" Basic keybindings
" ----------------------------------------------------------------------------
" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" F7 corrects indentation
map <F7> gg=G<C-o><C-o>

" Emulate classic save and quit
" Must configure terminal to accept Ctrl+s Ctrl+q
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
noremap <silent> <C-Q>          :q<CR>
vnoremap <silent> <C-Q>         <C-C>:q<CR>
inoremap <silent> <C-Q>         <C-O>:q<CR>

" Emulate classic undo redo commands
inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R>

" Emulate the system clipboard and modern editor shortcuts
inoremap <C-V> <ESC>"+Pa
nnoremap <C-V> <ESC>"+Pa
vnoremap <C-V> <ESC>"+Pa
inoremap <C-C> <ESC>"+Y
nnoremap <C-C> <ESC>"+Y
vnoremap <C-C> "+y
vnoremap <C-D> "+d

" Quit and Save using leader
nnoremap <leader>q :q<CR>
nnoremap <leader>s :update<CR>
" n was taken and I wanted a key far away from write
nnoremap <leader>m :q!<CR>

" Spell-check e for english, p for portuguese
map <leader>e :setlocal spell! spelllang=en_us<CR>
map <leader>i :setlocal spell! spelllang=pt<CR>

" Navigating with guides
" inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Also, remapping cxco to ctrl+space
" imap <C-Space> <C-X><C-O>

" Make enter, end and backspace work like insert on normal mode
nnoremap <Enter> i<Enter><Esc>
nnoremap <BS>    i<BS><Esc>
nnoremap <Del>   i<Del><Esc>

" Quick macros
nnoremap <Space> @q

" ----------------------------------------------------------------------------
" Editor settings
" ----------------------------------------------------------------------------
" Simplest autoclosing tags
iabbrev </ </<C-X><C-O>

" Simple appending of closing characters
inoremap {      {}<Left>
inoremap (      ()<Left>
inoremap '      ''<left>
inoremap "      ""<left>

" Skipping the closing character
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" Finally for the quotes
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

" Alt moves lines
nmap <m-j> ddjP
" imap <m-j> <Esc>ddjPi
nmap <m-k> ddkP
" imap <m-k> <Esc>ddkPi
vmap <m-j> ddjP
vmap <m-k> ddkP

" Alt duplication
nmap <m-d> YP
vmap <m-d> YP
imap <m-d> <Esc>YPi

" Easy escaping characters
inoremap <m-l> <Right>
" Easy deletion of unwanted completions
inoremap <m-x> <Del>
" New Line
inoremap <m-m> <Esc>o
nnoremap <m-m> o<Esc>

" Quick split window
nnoremap <C-Bslash> :vsplit<Enter>

" Quick source current configuration file
nmap <leader>o :so %<Enter>

" Open another file
nmap <leader>j :e

" ----------------------------------------------------------------------------
" Plugin settings
" ----------------------------------------------------------------------------
" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['htmlhint']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_go_checkers = ['go']

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_buffers = 0

let g:airline#extensions#tabline#formatter = 'default'

"---------------------------------------------------------------
" Custom Snippets
"---------------------------------------------------------------

"*.html
"autocmd FileType html inoremap ;<html> <html>
autocmd FileType html inoremap h1 <h1></h1><Enter><Enter><++><Esc>2kf<i

