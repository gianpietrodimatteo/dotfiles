"---------------------------------------------------------------
" Configuration
"---------------------------------------------------------------

" Type :so % to refresh .vimrc after making changes

" Basics
" Set <leader> to spacebar
let mapleader =" "
" Enable the mouse
set mouse=a
" use only the normal ctrl c ctrl v clipboard (+) ( linux has also the selection (*) clipboard)
" NOTE - only works after installing vim gtk
" check for +clipboard in vim --version | grep clipboard to see if you're good to go
set clipboard=unnamedplus
" For being able to 'hide' current working file and go to another
set hidden
syntax on " Syntax Higlighting
" Show line numbers on the left. Make them the relative numbers to your
" current line
set number relativenumber
" Activates filetype detection
filetype plugin on
" I like utf-8
set encoding=utf-8
" Enable autocompletion:
set wildmode=longest,list,full
" Disable automatic comenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Save backup(original) files, swap files and in separate directories
" // means that the path to the edited file will be saved in the files
" set backupdir=~/temp/.backup//
set directory=~/temp/.swp//
" set undodir=~/temp/.undo//
" Or fuck it. It's unsafe to do that (you might lose progress in a crash) but swap files are annoying:
" set noswapfile
set nobackup
set nowritebackup
set noundofile

" ==== disable swap file warning -- NOT TESTED
set shortmess+=A

" set cursorline " highlight current line
"  set ruler " show cursor position all time

" Indent with 2 spaces -- this is breaking the indentation on html (and it's not working either)
set expandtab " If 'expandtab' is set, pressing the <TAB> key will always insert 'softtabstop' amount of space characters.
set shiftwidth=2 " affects what happens when you press >>, << or ==. It also affects how automatic indentation works.
set softtabstop=2 " affects what happens when you press the <TAB> or <BS> keys. Its default value is the same as the value of 'tabstop', but when using indentation without hard tabs or mixed indentation, you want to set it to the same value as 'shiftwidth'.

" Tab returns to normal mode
" The vnoremap causes Tab to cancel any selection (gV is required to prevent automatic reselection).
" The onoremap causes Tab to cancel any operator-pending command (for example, y).
" The cnoremap causes Tab to cancel any command that was entered.
" The first inoremap causes Tab to exit insert mode, and the `^ restores the cursor position so exiting insert does not move the cursor left.
" The second inoremap, assuming the default leader key, allows you to press alt tab for the tab key - broken
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
" cnoremap <Tab> <C-C><Esc>
inoremap <Tab> <Esc>`^
" inoremap <M-Tab> <Tab>

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" F7 corrects indentation
map <F7> gg=G<C-o><C-o>

" " Does not work right now beacuse the terminal has a special command for ctrl s (ctrl q unfrezes)
" " Map Ctrl + S to save in any mode
" noremap <silent> <M-S>          :update<CR>
" vnoremap <silent> <C-S>         <C-C>:update<CR>
" inoremap <silent> <C-S>         <C-O>:update<CR>
" " Also map leader + s
" map <leader>s <C-S>
" " Second try -- nope.
" nmap <c-s> :w<CR>
" imap <c-s> <Esc>:w<CR>a

" Map ctrl z to undo and ctrl y to redo
" For insert mode, you still need to run a normal mode command.
" You can include <Esc> in mappings to leave insert mode, but in this case you can also use <C-O>
" to run a single normal mode command while remaining in insert mode
" Was working now it's broken...
inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R>

" Key maps to emulate the system clipboard shortcuts would be
" Capital P to instert before current character
inoremap <C-v> <ESC>"+Pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
"set splitbelow splitright
set splitright splitbelow

" Save and exit
nnoremap <leader>q :wq<CR>
" Save
nnoremap <leader>s :w<CR>
"inoremap <C-Q> :wq<CR>
"vnoremap <C-Q> :wq<CR>

"  now that we have ctrl s we lost ctrl v

"---------------------------------------------------------------
" Shortcuts
"---------------------------------------------------------------
" Navigating with guides
" inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l


"---------------------------------------------------------------
" Snippets
"---------------------------------------------------------------

"*.html
"autocmd FileType html inoremap ;<html> <html>
autocmd FileType html inoremap h1 <h1></h1><Enter><Enter><++><Esc>2kf<i

