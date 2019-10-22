" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Syntax
Plug 'w0rp/ale'

" Comentary
Plug 'tpope/vim-commentary'

" Fuzzy finder"
Plug 'ctrlpvim/ctrlp.vim'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Code completion
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --all' }

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Emmet
Plug 'mattn/emmet-vim'

" Git
Plug 'tpope/vim-fugitive'

" Status
Plug 'vim-airline/vim-airline'

" Sorrounding
Plug 'tpope/vim-surround'

" Beloved easymotion
Plug 'easymotion/vim-easymotion'

" Beloved multi cursors
Plug 'terryma/vim-multiple-cursors'

" Beloved code formatting
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Initialize plugin system
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

set nocompatible
set mouse=a
set hidden
syntax enable
set number relativenumber
set encoding=utf-8
set laststatus=2
set splitright splitbelow
autocmd BufNewFile * startinsert

set cmdheight=1

let mapleader =" "
""let g:solarized_termcolors=256
""set t_Co=256
" set background=light
" set termguicolors " Enable true color support.
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" colorscheme solarized
colorscheme jellybeans

" NOTE - only works after installing vim gtk
set clipboard=unnamedplus

" Activates filetype detection and other stuff and autocompletion
filetype indent plugin on
set omnifunc=syntaxcomplete#Complete
set wildmode=longest,list,full

" Disable automatic comenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set backupdir=~/.vim/tmp/.backup//
set directory=~/.vim/tmp/.swp//
set undodir=~/.vim/tmp/.undo//

" Indent with 2 spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

set colorcolumn=80
set wrap
set fo+=t
set fo-=l
set tw=0
"set tw=80

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" % takes you to matching pairs
set matchpairs=(:),{:},[:],<:>,?:\:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Toggle status line
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <M-h> :call ToggleHiddenAll()<CR>


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
" Editor keybindings
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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

"---------------------------------------------------------------
" Snippets
"---------------------------------------------------------------

"*.html
autocmd FileType html nnoremap ,h1 <h1></h1><Enter><Enter><++><Esc>2kf<i
autocmd FileType html nnoremap ,html <Esc>:-1read $HOME/.vim/snippets/html.html<CR>

"*.sh
autocmd FileType sh nnoremap ,sh :-1read $HOME/.vim/snippets/shebang.sh<CR>o
