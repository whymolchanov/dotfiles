scriptencoding utf-8
set encoding=utf-8

set nocompatible
filetype on
filetype indent on
filetype plugin on
syntax on
 set foldmethod=syntax

set noswapfile

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'pangloss/vim-javascript'

Plugin 'duganchen/vim-soy'

Plugin 'scrooloose/nerdcommenter'

Plugin 'heavenshell/vim-jsdoc'

Plugin 'nanotech/jellybeans.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'mattn/emmet-vim'

Plugin 'airblade/vim-gitgutter'

Plugin 'scrooloose/syntastic'

Plugin 'tpope/vim-surround'

Plugin 'mattesgroeger/vim-bookmarks'

Plugin 'bling/vim-airline'

Plugin 'raimondi/delimitmate'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'suan/vim-instant-markdown'

Plugin 'mxw/vim-jsx'

Plugin 'mileszs/ack.vim'

Plugin 'rizzatti/dash.vim'

Plugin 'flazz/vim-colorschemes'

Plugin 'sareyko/neat.vim'

Plugin 'sirver/ultisnips'

Plugin 'honza/vim-snippets'

Plugin 'leafgarland/typescript-vim'

Plugin 'AutoComplPop'

call vundle#end()

set ignorecase

" completing menu
set completeopt=longest,menuone
" END completin menu

" typescript related configs
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
" END typescript related configs

" fuzzy search out of the box
set wildmenu
"END fuzzy search out of the box

" syntastic plugin config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']
" END syntastic plugin config

" ultisnips configuration (a tool for snippets)
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>""
" END of  ultisnips configuration

" adding highlight to current line
set cursorline
autocmd InsertEnter,InsertLeave * set cul!
" END adding highlight to current line

:command! CopyBuffer let @+ = expand('%:p')

"ctrlp config
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
unlet g:ctrlp_user_command
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" ctrlp config END

let g:javascript_plugin_jsdoc = 1

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" save buffer even if vim closed
:exec 'set viminfo=%,' . &viminfo
" END save buffer even if vim closed

set relativenumber
set clipboard=unnamed
set hlsearch

set laststatus=2

map <C-n> :NERDTreeToggle<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
" ctrl-movement END

" Comfortable work with VIM in cyrilic keyboard
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
" END Comfortable work with VIM in cyrilic keyboard

set pastetoggle=<F2>

" store sessions
map <F3> :mksession! ~/vim_session <cr> " Quick write session with F3
map <F4> :source ~/vim_session <cr>     " And load session with F4
" END store session hotkey

nmap <C-\> :NERDTreeFind<CR>

set t_Co=256  " make use of 256 terminal colors 
" color jellybeans
colorscheme molokai

syntax enable

" check diff between saved file and changed
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

com! DiffSaved call s:DiffWithSaved()
" END check diff between saved file and changed

" vertical split with fixheight for splitted window
function OpenSplitWindow(lineQuantity)
    exe a:lineQuantity . 'sp'
    set winfixheight
endfunction
command! -nargs=1 Sp call OpenSplitWindow(<args>)

" if user enter <K> or number and <K> (example. 5<K>)
" vim open split window above current window, in new split window there will be
" current line plus n-1 lines under this line
" I use this functionality to lay aside some code, that I want to see before my eyes
map K :<C-U>Sp(v:count)<CR> zt <C-w><Down>

" END vertical split with fixheight for splitted window

set incsearch
set showmatch

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 100 characters is
set textwidth=80
" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

set number

set splitright

" search in Ack on <,s>
nnoremap ,s :Ack! "\b<C-R><C-W>\b"<CR>
