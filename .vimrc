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
set timeoutlen=3000                        " enable time out
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
set mouse-=a

set list
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

" The bang version will try to download the prebuilt binary if cargo does not exist.
Plugin 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'

" Fuzzy file browser
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Autocomplete
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Indent
Plugin 'tpope/vim-sleuth'

Plugin 'wikitopian/hardmode'

" open file at line
Plugin 'kopischke/vim-fetch'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

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

"
Plugin 'ryanoasis/vim-devicons'

" Show number of search result
Plugin 'osyo-manga/vim-anzu'


" stop - all plugins above
call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""" HardMode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

let g:HardMode_echo = 0


"""""""""""""""""""""""""""""""""""""""""""" EasyMotion
" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1


"""""""""""""""""""""""""""""""""""""""""""" Custom key mapping
"" Tab navigation like Firefox.
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l>   :tabnext<CR>

" move tab
noremap <S-Right> :tabmove +1<CR>
noremap <S-Left>  :tabmove -1<CR>

" activate visual mode in normal mode
nmap <S-Up> V
nmap <S-Down> V

vmap <S-Up> k
vmap <S-Down> j

noremap <Up> :echo "Use k instead"<CR>
noremap <Down> :echo "Use j instead"<CR>
noremap <Left> :echo "Use h instead"<CR>
noremap <Right> :echo "Use l instead"<CR>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

nmap h <nop>
nmap l <nop>

nmap <C-j> <C-e>
nmap <C-k> <C-y>

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

" disable match bracket highlight
let g:loaded_matchparen=1


""""""""""""""""""""""""""""""""""""""""""" LightLine
let g:lightline = {
      \     'colorscheme': 'wombat',
      \     'active': {
      \             'left': [ ['fileicon'], ['cocstatus'], ['absolutepath'] ],
      \             'right': [ ['lineinfo'], ['noet'], ['gitbranch'] ],
      \     },
      \     'inactive': {
      \              'left': [ [], ['filetype'], ['absolutepath'] ],
      \              'right': []
      \     },
      \     'component': { 'lineinfo': ' %2p%% %3l:%-2v' },
      \     'component_function':{
      \             'gitbranch': 'fugitive#head',
      \             'cocstatus': 'coc#status',
      \             'fileicon': 'MyFiletype',
      \     },
      \     'component_expand': {
      \             'noet': 'LightlineNoexpandtab',
      \     },
      \     'component_type': {
      \     },
      \ }

function! LightlineNoexpandtab()
  return &expandtab?'SP '.&shiftwidth:'TB '.&shiftwidth
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : '') : ''
endfunction

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()


"""""""""""""""""""""""""""""""""""""""""""" Coc

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" User definition key mapping
nmap <F11>      <Plug>(coc-references)
nmap <F12>      <Plug>(coc-definition)

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

let g:ctrlsf_ackprg = 'rg'

nmap     ? <Plug>CtrlSFPrompt
vmap     ? <Plug>CtrlSFVwordPath

"" Toggle CtrlSF panel
map <C-a> <Esc>:CtrlSFToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""" trailing whitespace
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
