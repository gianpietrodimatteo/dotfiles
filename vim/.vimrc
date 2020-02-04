"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
call plug#begin('~/.vim/plugged')
" Syntax
Plug 'w0rp/ale'

" tpope is love. tpope is life.
" Comentary
Plug 'tpope/vim-commentary'
" Extend dot functionality
Plug 'tpope/vim-repeat'
" Extend find and replace functionality
Plug 'tpope/vim-abolish'
" Git
Plug 'tpope/vim-fugitive'
" Sorrounding
Plug 'tpope/vim-surround'

"Improved copypaste
" Separate cut and delete
Plug 'svermeulen/vim-cutlass'
" Yank history
Plug 'svermeulen/vim-yoink'
" Easier find and replace
Plug 'svermeulen/vim-subversive'

" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Code completion
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --all' }

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Emmet
Plug 'mattn/emmet-vim'

" Status
Plug 'vim-airline/vim-airline'

" Autoclosing tags
Plug 'alvan/vim-closetag'

" Beloved easymotion
Plug 'easymotion/vim-easymotion'

" Beloved multi cursors
Plug 'terryma/vim-multiple-cursors'

" Beloved code formatting
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'branch': 'release/1.x'}

" Syntax Highlighting for typescript
Plug 'leafgarland/typescript-vim'

" Smarter pairing
Plug 'jiangmiao/auto-pairs'

" Javascript support
Plug 'pangloss/vim-javascript'

" More typescritp support
Plug 'https://github.com/Shougo/vimproc.vim', {'do' : 'make'}
Plug 'https://github.com/Quramy/tsuquyomi'

" Autosave and session/workspace saving
Plug 'thaerkh/vim-workspace'

" Initialize plugin system
call plug#end()


"------------------------------------------------------------------------------
" Master Mappings
"------------------------------------------------------------------------------
" Map escape sequences to their alt combinations
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
" Timeout to know if it was Esc j or Alt j
set timeout ttimeoutlen=50

function! ConfirmQuit()
  if (&modified==1)
    if (confirm("Close this buffer and discard changes?", "&Yes\n&No", 2)==1)
      :quit!
    endif
  else
    :quit!
  endif
endfu

function! ConfirmQuitAll()
  if (len(filter(getbufinfo(), 'v:val.changed == 1')) > 0)
    if (confirm("Close all buffers and discard changes?", "&Yes\n&No", 2)==1)
      :qa!
    endif
  else
    :qa!
  endif
endfu

" Prompt before force quitting
cnoremap <silent> q!<CR>  :call ConfirmQuit()<CR>
nmap ZQ :call ConfirmQuit()<CR>
cnoremap <silent> qa!<CR>  :call ConfirmQuitAll()<CR>


"------------------------------------------------------------------------------
" Basics
"------------------------------------------------------------------------------
" Type :so % (:source %) to refresh .vimrc after making changes

set nocompatible
set mouse=a
set hidden
syntax enable
set number relativenumber
set encoding=utf-8
set laststatus=2
set splitright splitbelow
" autocmd BufNewFile * startinsert

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
" set clipboard=unnamedplus

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

" Line wraping
set wrap
set fo+=t
set fo-=l
set tw=0

" Toggle line wrapping at 80 characters
let s:wrapping = 0
function! ToggleWrapFunction()
  if s:wrapping == 0
    let s:wrapping = 1
    set tw=80
  else
    let s:wrapping = 0
    set tw=0
  endif
endfunction

command ToggleWrap call ToggleWrapFunction()

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

set backspace=indent,eol,start  " more powerful backspacing

nnoremap <M-h> :call ToggleHiddenAll()<CR>


"------------------------------------------------------------------------------
" Basic keybindings
"------------------------------------------------------------------------------
" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" F7 corrects indentation
map <> gg=G<C-o><C-o>

" easy quit, save, one or all
nnoremap ZW :call ConfirmQuitAll()<CR>
nnoremap ZS :wa<CR>
nnoremap ZA :update<CR>
nnoremap ZX :xa<CR>

" Spell-check e for english, i for portuguese
map <leader>e :setlocal spell! spelllang=en_us<CR>
map <leader>i :setlocal spell! spelllang=pt<CR>

" Navigating with guides
" inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Remapping cxco to ctrl+space
imap <C-Space> <C-X><C-O>

" Make easy enter
nnoremap <leader><Enter> i<Enter><Esc>

" Quick macros
nnoremap <Space>q @q

" Quick clipboard cut, copy and paste
nmap gm "+m
nmap gM "+M
nnoremap gy "+y
nnoremap gY "+Y
nnoremap gp "+p
nnoremap gP "+P

vmap gm "+m
vmap gM "+M
vnoremap gy "+y
vnoremap gY "+Y
vnoremap gp "+p
vnoremap gP "+P

" Select all
nnoremap <C-a> ggVG


"------------------------------------------------------------------------------
" Editor keybindings
"------------------------------------------------------------------------------
" Alt moves lines
nmap <m-j> Vmp
nmap <m-k> VmkP
vmap <m-j> Vmp
vmap <m-k> VmkP

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

" Update this file
nmap <leader>j :e<CR>
" Quick split
nmap <leader>v :vsplit

" Search for selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" execute single line
nnoremap <m-t> 0YPj!!bash<CR>
" execute multiple lines
xnoremap <m-t> yPgv:!bash<CR>

nnoremap <m-f> V=Vgq<CR>

"------------------------------------------------------------------------------
" Plugin settings
"------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#ale#enabled = 1

let g:prettier#config#single_quote = 'true'

let g:ale_open_list = 1
let g:ale_set_quickfix = 1
nmap <silent> <m-i> <Plug>(ale_previous_wrap)
nmap <silent> <m-o> <Plug>(ale_next_wrap)

let g:ale_java_google_java_format_executable =
      \ "$HOME/local/google-java-format/core/target/google-java-format-1.7-SNAPSHOT-all-deps.jar"
let g:ale_java_google_java_format_use_global = 1
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'vue': ['eslint'],
      \   'java': ['javac']
      \}

let g:ale_fixers = {
      \    'javascript': ['eslint'],
      \    'typescript': ['prettier', 'tslint'],
      \    'scss': ['prettier'],
      \    'html': ['prettier'],
      \    'java': ['google_java_format']
      \}

let g:ale_java_eclipselsp_path = '$HOME/local/eclipse.jdt.ls'
let g:ale_java_eclipselsp_workspace_path = '$HOME/eclipse/prompt-workspace'

let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_html_htmlhint_options='--config=$HOME/dotfiles/language/.htmlhintrc'
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow

map <M-i> :ALEToggle<CR>

" Open close explorer
nnoremap <M-e> :NERDTreeToggle<CR>

" Ctrlp igonring files
set wildignore+=*/target/*,*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip
" MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

"----------------- alvan autoclose tags
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified
" files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.xml'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,xml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified
" files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,xml'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>`
" will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<CR>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" cutlass
nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

" yoink
let g:yoinkIncludeDeleteOperations = 1
" Swap the most recent paste around in the yank history:
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
" find a key for the swap foward
nmap <c-ç> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" Permanently cycle through history
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)

" Format current paste ?
nmap <c-=> <plug>(YoinkPostPasteToggleFormat)

" Yanking now does not change the cursor position
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

" subversive
" Example config
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)

nmap <leader>ss <plug>(SubversiveSubstituteWordRange)

" Simple motions that are useful for subversive are:
" ie = inner entire buffer
onoremap ie :exec "normal! ggVG"<cr>

" iv = current viewable text in the buffer
onoremap iv :exec "normal! HVL"<cr>

" Confirm substitution
nmap <leader>cr <plug>(SubversiveSubstituteRangeConfirm)
xmap <leader>cr <plug>(SubversiveSubstituteRangeConfirm)
nmap <leader>crr <plug>(SubversiveSubstituteWordRangeConfirm)

" Abolish integration
" You can substitute SubversiveSubvertRange for SubversiveSubvertRangeNoPrompt
" to use default register without prompting
nmap <leader><leader>s <plug>(SubversiveSubvertRange)
xmap <leader><leader>s <plug>(SubversiveSubvertRange)

nmap <leader><leader>ss <plug>(SubversiveSubvertWordRange)

" Integration with yoink
xmap s <plug>(SubversiveSubstitute)
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)


"------------------------------------------------------------------------------
" Styles
"------------------------------------------------------------------------------
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.sh setlocal textwidth=80
au BufRead,BufNewFile *.bash setlocal textwidth=80


"------------------------------------------------------------------------------
" Snippets
"------------------------------------------------------------------------------
"*.html
autocmd FileType html nnoremap ,h1 <h1></h1><Enter><Enter><Esc>2kf<i
autocmd FileType html nnoremap ,html <Esc>:-1read
      \ $HOME/.vim/snippets/html.html<CR>

"*.sh
autocmd FileType sh nnoremap ,sh :-1read $HOME/.vim/snippets/shebang.sh<CR>o


" Temp
map í í
map â â


