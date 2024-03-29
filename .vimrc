" File: $MYVIMRC
" Editor: John Hight
" Description: vimrc for All systems
" Last Modified: February 26, 2024
let editver = "20240226"

" Search For MAIN_GENERAL_CODE: To go to GENERAL_CODE
" Normally this if-block is not needed, because `:set nocp` is done
" automatically when .vimrc is found. However, this might be useful
" when you execute `vim -u .vimrc` from the command line.

" IOS:
" Load IOS code function {{{ "
function! IOS_code()
  "" iPad spacific commands
  " "Hello IOS User"
  " Add any system spacific startup vim commands to this file.
  " They will be pulled in a startup
  map <leader>h :echo "Hello IOS World, vimrc Version =" editver<CR>
  "____________________________________________________________________________
  " IOS spacific commands
  map <leader>ps :iplug update<cr>
  map <leader>pu :iplug upgrade<cr>
  " add plugin at cursor
  autocmd FileType vim nnoremap <buffer> <leader>pa fiyg_:<c-r>0<cr>j0
  " iplug add commands; Installed PlugIns
  " iplug add 
  " iplug add https://github.com/Raimondi/delimitMate.git
  " iplug add https://github.com/rust-lang/rust.vim
  " iplug add https://github.com/SirVer/ultisnips.git
  " iplug add https://github.com/adelarsq/vim-matchit.git
  " iplug add https://github.com/chrisbra/unicode.vim.git
  " iplug add https://github.com/christoomey/vim-sort-motion.git
  " iplug add https://github.com/christoomey/vim-titlecase.git
  " iplug add https://github.com/frioux/vim-regedit.git
  " iplug add https://github.com/haya14busa/incsearch.vim.git
  " iplug add https://github.com/honza/vim-snippets.git
  " iplug add https://github.com/jeffkreeftmeijer/vim-numbertoggle.git
  " iplug add https://github.com/junegunn/vim-easy-align.git
  " iplug add https://github.com/kana/vim-textobj-entire.git
  " iplug add https://github.com/kana/vim-textobj-indent.git
  " iplug add https://github.com/kana/vim-textobj-line.git
  " iplug add https://github.com/kana/vim-textobj-user.git
  " iplug add https://github.com/nelstrom/vim-visual-star-search.git
  " iplug add https://github.com/preservim/nerdcommenter.git
  " iplug add https://github.com/preservim/nerdtree.git
  " iplug add https://github.com/preservim/vim-lexical.git
  " iplug add https://github.com/preservim/vim-pencil.git
  " iplug add https://github.com/tpope/vim-abolish.git
  " iplug add https://github.com/tpope/vim-commentary.git
  " iplug add https://github.com/tpope/vim-markdown.git
  " iplug add https://github.com/tpope/vim-repeat.git
  " iplug add https://github.com/tpope/vim-sleuth.git
  " iplug add https://github.com/tpope/vim-speeddating.git
  " iplug add https://github.com/tpope/vim-surround.git
  " iplug add https://github.com/tpope/vim-unimpaired.git
  " iplug add https://github.com/tyru/open-browser.vim.git
  " iplug add https://github.com/vim-airline/vim-airline-themes.git
  " iplug add https://github.com/vim-airline/vim-airline.git
  " iplug add https://github.com/vim-scripts/AutoComplPop.git
  " iplug add https://github.com/vim-scripts/ReplaceWithRegister.git
  " iplug add https://github.com/vim-scripts/ZoomWin.git
  " iplug add https://github.com/xolox/vim-misc.git
  " iplug add https://github.com/xolox/vim-notes.git
  " Colorscheme
  set t_Co=256
  set background=dark
  colorscheme Atelier_HeathDark
  " Set clipboard for IOS
  set clipboard=unnamed
  map <leader>c "+y
  map <leader>v "+gP
  map <leader>x "+x
endfunction
" }}} Load IOS code function "

" PLUGINS:
" Load common PlugIns function {{{ "
function! LOAD_plugins()
  " Try to load minpac.
  packadd minpac
  " minpac is available.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('dracula/vim', {'name': 'dracula'})
  call minpac#add('kana/vim-textobj-user') " Create your own text objects
  call minpac#add('kana/vim-textobj-indent') " Create your own text objects
  call minpac#add('kana/vim-textobj-entire') " Create your own text objects
  call minpac#add('kana/vim-textobj-line') " Create your own text objects
  call minpac#add('vim-jp/syntax-vim-ex')
  call minpac#add('rust-lang/rust.vim')
  call minpac#add('adelarsq/vim-matchit')
  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('tyru/open-browser.vim') " opens url in browser
  call minpac#add('jeffkreeftmeijer/vim-numbertoggle')
  call minpac#add('tpope/vim-surround') " Surrounding ysw)
  call minpac#add('tpope/vim-commentary') " For Commenting gcc & gc
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-speeddating')
  call minpac#add('tpope/vim-sleuth')
  call minpac#add('tpope/vim-markdown')
  if has("linux")
    call minpac#add('tpope/vim-fugitive')
    nnoremap <leader>g :Git 
  endif
  call minpac#add('vim-scripts/ReplaceWithRegister')
  call minpac#add('christoomey/vim-titlecase')
  call minpac#add('christoomey/vim-sort-motion')
  if has("linux")
    call minpac#add('christoomey/vim-tmux-navigator')
    call minpac#add('christoomey/vim-tmux-runner')
    let g:tmux_navigator_no_mappings = 1
    let g:VtrUseVtrMaps = 1
    map <silent> <C-H> :TmuxNavigateLeft<cr>
    map <silent> <C-J> :TmuxNavigateDown<cr>
    map <silent> <C-K> :TmuxNavigateUp<cr>
    map <silent> <C-L> :TmuxNavigateRight<cr>
    map <silent> <C-\> :TmuxNavigatePrevious<cr>
  endif
  call minpac#add('christoomey/vim-quicklink')
  call minpac#add('mattn/webapi-vim')
  call minpac#add('vim-scripts/AutoComplPop')
  " call minpac#add('SirVer/ultisnips')
  " call minpac#add('honza/vim-snippets')
  call minpac#add('prabirshrestha/async.vim')
  call minpac#add('prabirshrestha/vim-lsp')
  call minpac#add('thomasfaingnaert/vim-lsp-snippets')
  call minpac#add('thomasfaingnaert/vim-lsp-ultisnips')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('chriskempson/base16-vim')
  call minpac#add('preservim/nerdtree')
  call minpac#add('raimondi/delimitmate')
  " additional plugins here.
  call minpac#add('scrooloose/syntastic')
  set statusline+=%#warningmsg#
  " set statusline+=%{syntasticstatuslineflag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_python_checkers = ['pylint']
  call minpac#add('kien/ctrlp.vim')
  let g:ctrlp_map = '<c-q>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_dotfiles=1
  let g:ctrlp_working_path_mode = 'ra'
  if has("linux") || has("unix")
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip            " MacOSX/Linux
    let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
  else
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe         " Windows
    let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
  endif
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
  " search the nearest ancestor that contains .git, .hg, .svn
  let g:ctrlp_working_path_mode = 2
  call minpac#add('sickill/vim-pasta') " Pasting in Vim with indentation adjusted to destination context.
  call minpac#add('vim-scripts/ZoomWin') " use <c-w>o to Zoom In or Zoom Out
  call minpac#add('xolox/vim-misc') " required for xolox/vim-notes
  call minpac#add('xolox/vim-notes') " Note taking in vim :Note
  call minpac#add('chrisbra/unicode.vim') " Unicode
  call minpac#add('preservim/vim-pencil') " Working with text
  call minpac#add('preservim/vim-lexical') " Word Check
  call minpac#add('nelstrom/vim-visual-star-search') " Search Visual * & #
  call minpac#add('tpope/vim-abolish') " Abstract Search
  call minpac#add('frioux/vim-regedit') " edit a register

  " Plugin commands
  nnoremap <leader>pu :call minpac#update()<CR>
  nnoremap <leader>pc :call minpac#clean()<CR>
  nnoremap <leader>ps :call minpac#status()<CR>
endfunction  
" }}} Load common PlugIns function "

" LINUX:
" Load Linux code function {{{ "
function! LINUX_code()
  " "Hello Linux User"
  " Add any system spacific startup vim commands to this file.
  " They will be pulled in a startup
  map <leader>h :echo "Hello Linux World, vimrc Version =" editver<CR>
  "____________________________________________________________________________
  " Linux system spacific stuff
  "
  " Set the Thesaurus location
  set thesaurus+=$HOME/.vim/thesaurus/english.txt
  "
  " load PlugIns
  call LOAD_plugins() " load plugins
  packadd! dracula
  colorscheme dracula
  " set location of dictionary
  let g:lexical#dictionary = ['/usr/share/dict/words',]
  " Run Python3 with <F9>
  autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
  " load .vimrc.local if present
  if !empty(glob("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
  endif
endfunction
" }}} Load Linux code function "

" WINDOWS:
" Load Windows code function {{{ "
function! WIN_coce()
  " "Hello Windows User"
  " Add any system spacific startup vim commands to this file.
  " They will be pulled in a startup
  map <leader>h :echo "Hello Windows World, vimrc Version =" editver<CR>
  "____________________________________________________________________________
  " windows spacific commands
  "
  " Set the Thesaurus location
  set thesaurus+=$HOME/vimfiles/thesaurus/english.txt
  "
  " Load PlugIns
  call LOAD_plugins() " load plugins
  " Run Python3 with <F9>
  autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
  " OPEN_FILE_IN_BROWSER:
  " Open the current file in the default browser`
  command! OpenBrowserCurrent execute "OpenBrowser" "file:///" . expand('%:p:gs?\\?/?')
  " Color scheme (terminal)
  highlight Normal guifg=white guibg=black
  packadd! dracula
  colorscheme dracula
  let base16colorspace=256  " Access colors present in 256 colorspace
  set termguicolors

  if has("gui_win32")
    set gfn=SauceCodePro_NF:h12:cANSI:qDRAFT
    set lines=50 columns=150
    set linespace=4
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    highlight Cursor guifg=red guibg=gray
    highlight iCursor guifg=white guibg=steelblue
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait10
  endif

  " Set clipboard for Windows 
  " set clipboard=unnamed
  map <leader>c "+y
  map <leader>v "+gP
  map <leader>x "+x
  if !has('nvim')
    set pythonthreehome=C:\bin\python3
    set pythonthreedll=C:\bin\python3\python39.dll
  endif

  " set location of dictionary
  let g:lexical#dictionary = ['C:\Users\jthig\Dropbox\dict\american-english',]
  " Check to avoid UltiSnips Deprecation Warning imp module is deprecated
  if has('python3')
    silent! python3 1
  endif

  " load _vimrc.local if present
  if !empty(glob("$HOME/_vimrc.local"))
    source $HOME/_vimrc.local
  endif
endfunction
" }}} Load Windows code function "

" FUNCTIONS:
" General functions {{{ "
" TabMessage function to execute a cmd and redirect output to a buffers
" use: :TabMessage cmd
function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
" }}} General functions "

" MAIN_GENERAL_CODE:
" Initial Settings {{{ "
" code that applies to all 
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif
" Turn on syntax highlighting
syntax enable
filetype plugin indent on
set hidden
set foldmethod=marker   " fold based on indent"
" }}} Initial Settings "

" KEYS:
" Key Mapping {{{ "
" COMAND MODE:
" will recall path in command mode eg: :e %%
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" Stop using the arrow Keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" Visual Move
vnoremap <Down> :m '>+1<CR>gv=gv
vnoremap <Up> :m '<-2<CR>gv=gv
" Move up/down editor lines
nnoremap j gj
nnoremap k gk
" Time Stamp:
" Inser time with <F5> in normal and insert mode
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>
" LEADER KEY Mapping:
"
" Pick a leader key
let mapleader = " "
" leader key strokes
map <leader><space> :let @/=''<cr> " clear search
map <leader>ws :set wrap<cr>
map <leader>wx :set nowrap<cr>
map <leader>vr :source $MYVIMRC<cr>
if has("IOS") || has("win32")
  map <leader>ve :tabedit $MYVIMRC<cr>
else
  map <leader>ve :tabedit $HOME/.dotfiles/.vimrc<cr>
endif
map <leader>c :tabc<cr>
map <leader>r :registers<cr>
map <leader>f /<C-R><C-W><cr>
map <leader>ss :set signcolumn=yes<cr> " Show error indicators on left column
map <leader>sx :set signcolumn=no<cr> " Hide error indicators on left column
" Formatting
map <leader>q gqip
map <leader>1 :tab help <C-R><C-W><CR> " mapped to :help
map <leader>z :setlocal spell spelllang=en_us<CR> " Spellcheck
map <leader>sn :set nospell<CR> " Turn Off Spellcheck
map <leader>sy :set spell<CR> " Turn Off Spellcheck
if has("IOS")
  map <leader>7 :UltiSnipsEdit!<CR> "Edit snippets
else
  map <leader>7 :UltiSnipsEdit<CR> "Edit snippets
endif
map <leader>8 :UltiSnipsEdit!<CR> "Edit snippets

" ESC:
" map jk <esc> key when in insert mode
inoremap jk <esc>

" WINDOWS:
" Make working with multiple buffers less of a pain
set splitright
set splitbelow
nnoremap <C-w>v :vnew<cr>
nnoremap <C-w>s :new<cr>
if !has("linux")
  nnoremap <C-k> <C-w>k
  nnoremap <C-h> <C-w>h
  nnoremap <C-l> <C-w>l
  nnoremap <C-j> <C-w>j
  nnoremap <C-\> <C-w>p
endif

" CASE:
" Change a word to upper CASE in insert mode
inoremap <C-U> <esc>gUiwea

" FUNCTION KEYS:
" Map Function Keys <FN> 
" <F1> mapped to :help by default

" }}} Key Mapping "

" PATH:
" Vim Path {{{ "
" Search and find files
set path+=**
set path+=$HOME/**
set wildmenu " Tab through menu
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" }}} Vim Path "

" TAGS:
" MakeTags Command {{{ "
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
" }}} MakeTags Command "

" AUTOCOMPLETE:
" Autocomplete Settings {{{ "
" The good stuff is documented in |ins-completion|
" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" - Use ^n and ^p to go back and forth in the suggestion list
set complete+=kspell
set completeopt=menuone,longest
" }}} Autocomplete Settings "

" SETTINGS:
" General Vim Settings {{{ "
" Security
set modelines=0

" LINE NUMBERING: Show line numbers
set number
set relativenumber

" Blink cursor on error instead of beeping (grr)
set visualbell

" ENCODING:
set encoding=utf-8

" Whitespace
set nowrap
" set textwidth=80
" set colorcolumn=+5
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
set signcolumn=no " Hide error indicators on left column
set formatoptions=tcqrn1
set tabstop=2
autocmd FileType python setlocal tabstop=2
autocmd FileType yaml setlocal tabstop=2
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=8
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs

" RENDERING:
set ttyfast

" STATUS BAR:
set laststatus=2
" Show file stats
set ruler
" last line
set showmode
set showcmd

" SEARCHING:
set nohlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" VISUALIZE: tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL
" }}} General Vim Settings "

" LOAD SYSTEM SPECIFIC CODE: Load system spacific vim directives and PlugIns
" Load OS Code {{{ "
if has("win32")
  call WIN_coce()
endif
if has("linux") || has("unix")
  if has("IOS")
    call IOS_code()
  else
    call LINUX_code()
  endif
endif
" }}} Load OS Code "

" PLUGINS SETTINGS:
" Plugin Related Settings {{{ "
" NERDTree: autocmd VimEnter * silent NERDTree | wincmd p
nnoremap \g :NERDTreeFocus<CR>
if has("win32")
  nnoremap \n :NERDTree C:\
else
  nnoremap \n :NERDTree $HOME/
endif
nnoremap \\ :NERDTreeToggle<CR>
nnoremap \f :NERDTreeFind<CR>

" vim-notes code
let g:notes_tab_indents = 0
vmap <leader>nn :SplitNoteFromSelectedText<CR>
nnoremap <leader>nn :Note 
nnoremap <leader>nd :DeleteNote
nnoremap <leader>ns :SearchNotes /TODO
nnoremap <leader>nr :RelatedNotes<CR>
nnoremap <leader>nt :RecentNotes<CR>
autocmd BufNewFile,BufRead */.git/COMMIT_EDITMSG setlocal filetype=notes
let g:notes_suffix = '.txt'
if !empty(glob("$HOME/Dropbox/Notes/README.md"))
  let g:notes_directories = ['$HOME/Dropbox/Notes']
else
  let g:notes_directories = ['$HOME/Notes']
endif

" unicode.vim code
nnoremap gz <Plug>(UnicodeGA)
nnoremap <leader>ut :UnicodeTable<CR>
nnoremap <leader>us :UnicodeSearch 
nnoremap <leader>ud :Digraphs
nnoremap <leader>un :UnicodeName<CR>

" Pencil:
" Manual Formatting
" gqap - format current paragraph (see :help gq for details)
" vapJgqap - merge two paragraphs (current and next) and format
" ggVGgq or :g/^/norm gqq - format all paragraphs in buffer)
function! Prose()
  call pencil#init()
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft', 'autoformat': 1})
  autocmd FileType text,notes   call pencil#init({'wrap': 'hard', 'autoformat': 0})
  call lexical#init()
  " Set Spellcheck On
  " setlocal spell spelllang=en_us
  " Set wrap on
  set wrap
  " force top correction on most recent misspelling
  nnoremap <buffer> <c-s> [s1z=<c-o>
  inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u
  " replace common punctuation
  iabbrev <buffer> -- –
  iabbrev <buffer> << «
  iabbrev <buffer> >> »
  " open most folds
  setlocal foldlevel=6
  let g:airline_section_x = '%{PencilMode()}'
  let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt','~/.vim/thesaurus/english.txt',]
  let g:lexical#spell_key = '<leader>sp'
  let g:lexical#thesaurus_key = '<leader>t'
  let g:lexical#dictionary_key = '<leader>k'
endfunction
" automatically initialize buffer by file type
autocmd FileType markdown,mkd,text call Prose()
" invoke manually by command for other file types
command! -nargs=0 Prose call Prose()

" FILE BROWSING: with netrw
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
if !has('nvim')
  if has("win32") || has("linux")
    let g:netrw_list_hide=netrw_gitignore#Hide()
  endif
  let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
endif
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" NetrwTreeListing: Like with netrw
" Toggle Vexplore with Ctrl-G
" from https://stackoverflow.com/questions/5006950/setting-netrw-like-nerdtree/5636941
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec 'wincmd w'
      let g:netrw_winsize = 30
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
nnoremap <silent> <C-G> :call ToggleVExplorer()<CR>

" SNIPPS:
  " Trigger configuration. You need to change this to something other than <tab> 
  " if you use one of the following:
  " - https://github.com/Valloric/YouCompleteMe
  " - https://github.com/nvim-lua/completion-nvim
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
  let g:UltiSnipsListSnippets="<C-L>"
  let g:UltiSnipsSnippetsDirectories=["UltiSnips"]
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsEnableSnipMate=1
  let g:snips_author="John Hight"
  let g:snips_email="john@hight.net"
  let g:snips_github="https://github.com/jthight"
  " Key to activate snipps
  " let g:UltiSnipsExpandTrigger="<tab>"
  " list all snippets for current filetype

" EasyAlign: Support code for Plugs
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" AirLine: Status bar look
let g:airline_theme='dracula'
" let g:airline_powerline_fonts = 1
" }}} Plugin Related Settings "
