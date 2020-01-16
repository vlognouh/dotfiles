"----------------------------------------------------------------------------"
" General Settings                                                           "
"----------------------------------------------------------------------------"
filetype plugin indent on               " Filetype func on

set autoread                            " Auto reload file after external command
set binary                              " Enable binary support
set nocompatible                        " no vi compat
set hidden                              " Switch tab without needing save current file
set nofoldenable                        " disable folding
set guifont=Hack                        " Set font
set encoding=utf-8                      " Encoding type
set number                              " Enable line number
"set relativenumber
set laststatus=2                        " always show the bottom status bar
set showtabline=2
set noshowmode                          " dont show -- INSERT --
set pastetoggle=<F2>                    " Toggle paste mode with F2
set showcmd                             " Show current command
set showmatch                           " show matching bracket/parenthesis/etc
set title                               " change terminal title
"set ttyfast                             " fast terminal

" completion box
set wildmenu                            " open box for autocomplete command/filename
set wildmode=longest,full
set completeopt-=preview                " make completion menu behave like an ide

" indent
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

" key sequence timeout
set timeoutlen=0                        " enable time out
set ttimeoutlen=0                       " decrease esc delay

" search
set incsearch                           " incremental search
"set hlsearch                            " highlight matches
set ignorecase                          " case-insensitive search...
set smartcase                           " ...unless search contains uppercase letter

" temp files
set nobackup                            " no backup file
set noswapfile                          " no swap file

" full color support
set termguicolors

" hightline current line
set cursorline
set mouse=a

set list
set listchars=tab:▸·
"set list
"set listchars=tab:--,trail:.,eol:¬,extends:>,precedes:<
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·

"----------------------------------------------------------------------------"
" vundle plugin                                                              "
"----------------------------------------------------------------------------"
" initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"" start- all plugins below
Plugin 'VundleVim/Vundle.vim'

" StatusLine
Plugin 'itchyny/lightline.vim'

" Colorscheme
Plugin 'tomasr/molokai'

" Productivities
Plugin 'airblade/vim-rooter'
Plugin 'Raimondi/delimitMate'

" Fuzzy file browser
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Autocomplete
"Plugin 'davidhalter/jedi-vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'MaskRay/ccls'


" Bash command
Plugin 'tpope/vim-eunuch'

" Indent
Plugin 'tpope/vim-sleuth'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"if has('nvim') || has('patch-8.0.902')
"  Plugin 'mhinz/vim-signify'
"else
"  Plugin 'mhinz/vim-signify', { 'branch': 'legacy' }
"endif

" Syntax Highlighter
Plugin 'compnerd/arm64asm-vim'          " ARM64
Plugin 'alisdair/vim-armasm'            " ARM
Plugin 'justinmk/vim-syntax-extra'      " Improve syntax highlight

" Enhanced search
Plugin 'dyng/ctrlsf.vim'
Plugin 'haya14busa/incsearch.vim'

" Enhanced netrw
Plugin 'tpope/vim-vinegar'

" Trailing space
Plugin 'ntpeters/vim-better-whitespace'

" stuff
Plugin 'mbbill/fencview'
Plugin 's3rvac/autofenc'
Plugin 'ryanoasis/vim-devicons'

" Show number of search result
Plugin 'osyo-manga/vim-anzu'


" stop - all plugins above
call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""" Custom key mapping
"" Tab navigation like Firefox.
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <Tab>   :tabnext<CR>
nnoremap <C-w>   :tabclose<CR>

" move tab
noremap <S-Right> :tabmove +1<CR>
noremap <S-Left>  :tabmove -1<CR>

" activate visual mode in normal mode
nmap <S-Up> V
nmap <S-Down> V

vmap <S-Up> k
vmap <S-Down> j


""""""""""""""""""""""""""""""""""""""""""" Cursor Type
" Auto turn off cursol line in edit mode
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul

let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
  au!
  autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

"Ps = 0  -> blinking block.
"Ps = 1  -> blinking block (default).
"Ps = 2  -> steady block.
"Ps = 3  -> blinking underline.
"Ps = 4  -> steady underline.
"Ps = 5  -> blinking bar (xterm).
"Ps = 6  -> steady bar (xterm).


""""""""""""""""""""""""""""""""""""""""""" LightLine
let g:lightline = {
      \     'colorscheme': 'wombat',
      \     'active': {
      \             'left': [ [ 'mode', 'paste' ], [ 'gitbranch' ], [ 'absolutepath' ] ],
      \             'right': [ [ 'percent' ], [ 'lineinfo' ], ['noet' , 'fileencoding' , 'filetype'] ],
      \     },
      \     'component_function':{
      \             'gitbranch': 'fugitive#head',
      \     },
      \     'component_expand': {
      \             'noet': 'LightlineNoexpandtab',
      \     },
      \     'component_type': {
      \     },
      \ }


function! LightlineNoexpandtab()
  return &expandtab?' SP '.&shiftwidth:' TB '.&shiftwidth
endfunction


"""""""""""""""""""""""""""""""""""""""""""" Coc
nmap <F12>       :YcmCompleter GoToDefinition<CR>


"""""""""""""""""""""""""""""""""""""""""""" GitGutter Config
set updatetime=100


"""""""""""""""""""""""""""""""""""""""""""" ctrlp with ripgrep
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --glob ""'
  let g:ctrlp_use_caching = 1
endif


"""""""""""""""""""""""""""""""""""""""""""" FZF vim
let g:fzf_action = {
      \ 'return': 'tab split',
      \ 'ctrl-j': 'split',
      \ 'ctrl-k': 'vsplit' }


"""""""""""""""""""""""""""""""""""""""""""" Molokai
syntax on
colorscheme molokai


""""""""""""""""""""""""""""""""""""""""""" Anzu
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)


"""""""""""""""""""""""""""""""""""""""""""" incsearch
nmap /  <Plug>(incsearch-forward)
"vmap /  <ESC><Plug>(incsearch-forward)
"nmap ?  <Plug>(incsearch-backward)
"nmap g/ <Plug>(incsearch-stay)

func! TestCmd()
  let keys = g:CtrlSFGetVisualSelection()
  call incsearch#call({'pattern':keys})
endf
vmap / :<C-U>call TestCmd()<CR>


"""""""""""""""""""""""""""""""""""""""""""" CtrlSF
let g:ctrlsf_auto_focus = {
      \ "at": "start"
      \ }

let g:ctrlsf_mapping = {
      \ "tab": "<CR>",
      \ }

let g:ctrlsf_position = 'right'

let g:ctrlsf_ackprg = 'ag'

nmap     ? <Plug>CtrlSFPrompt
vmap     ? <Plug>CtrlSFVwordPath

"" Toggle CtrlSF panel
nnoremap <silent> <C-S> :CtrlSFToggle<CR>
inoremap <silent> <C-S> <Esc>:CtrlSFToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""" better whitespace
let g:better_whitespace_enabled=1


"""""""""""""""""""""""""""""""""""""""""""" Custom Statusline
if 0
  set statusline=
  set statusline+=%{'\ '.GetMode().'\ '}
  set statusline+=%{fugitive#head()!=''?'\ >'.fugitive#head().'\ ':''}
  set statusline+=%#Visual#       " colour
  set statusline+=\ %n\           " buffer number
  set statusline+=%{&paste?'\ PASTE\ ':''}
  set statusline+=%{&spell?'\ SPELL\ ':''}
  set statusline+=%#CursorIM#     " colour
  set statusline+=%{&readonly?'\ \ ':''}                        " readonly flag
  set statusline+=%#Cursor#               " colour
  set statusline+=%#CursorLine#     " colour
  set statusline+=\ %t\                   " short file name
  set statusline+=%M                        " modified [+] flag
  set statusline+=%=                          " right align
  set statusline+=%#CursorLine#   " colour
  set statusline+=\ %y\                   " file type
  set statusline+=%(\\ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth.'\ ':''}%)
  set statusline+=%#CursorIM#     " colour
  set statusline+=\ %3l:%-2c\         " line + column
  set statusline+=%#Cursor#       " colour
  set statusline+=\ %3p%%\                " percentage

  let s:mode_map = {
        \     'n': 'NORMAL', 'i': 'INSERT', 'R': 'REPLACE', 'v': 'VISUAL', 'V': 'V-LINE', "\<C-v>": 'V-BLOCK',
        \     'c': 'COMMAND', 's': 'SELECT', 'S': 'S-LINE', "\<C-s>": 'S-BLOCK', 't': 'TERMINAL'
        \   }

  function! GetMode()
    return get(s:mode_map, mode(), '')
  endfunction
endif
