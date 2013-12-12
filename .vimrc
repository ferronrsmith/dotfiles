set nocompatible                  " Must come first because it changes other options.

filetype off                  " required!

" use symlink ln -s /path/to/spf13-vim/vimrc .vimrc

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/LustyExplorer'
Bundle 'Lokaltog/vim-powerline'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-endwise'
Bundle 'vim-scripts/tComment'
Bundle 'munen/find_yaml_key'
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'vim-scripts/Gundo'
"Bundle 'honza/vim-snippets'
Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neosnippet'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'ferronrsmith/Colour-Sampler-Pack'
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/emmet-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'ferronrsmith/ultisnips_snippets'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'vim-scripts/SearchComplete'
Bundle 'vim-scripts/matchit.zip'
Bundle 'amix/open_file_under_cursor.vim'
Bundle 'terryma/vim-expand-region'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'moll/vim-node'
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/mru.vim'
Bundle 'mihaifm/bck'

" vim-scripts repos
" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'


" Set vi compatibility mode
set nocp 

" automatically change directory to the open file
set autochdir

nnoremap <F5> :GundoToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F10> :YRShow<CR> 
nmap <F8> :TagbarToggle<CR>
nnoremap <C-c> :bd<CR>

"=================== UltiSnips Config ==================

let g:UltiSnipsSnippetsDir        = '~/.vim/bundle/ultisnips_snippets'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippets']

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
   
   
"=================== UltiSnips Config END ==================


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
nnoremap <C-f> :MRU<CR>


"===================== Reload .vimrc when changes are detected =====================

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"======================= End ======================================================

" Remap :W to :w
command W w

" Remap :Q to :q
command Q q

" Turn on line numbering. Turn it off with 'set nonu'" 
set nu 

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set showmatch					  " set show matching parenthesis
set gdefault					  " search/replace "globally" (on a line) by default

set list listchars=tab:»·
set list
"set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" turn off wrapping
set nowrap
set linebreak    "Wrap lines at convenient points

" disable swap (.swp) file creation
set noswf
set nobackup
set nowb

" history + undo count
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set viminfo='200


"multiple windows
set switchbuf=usetab            "swb:   Jumps to first tab or window that contains specified buffer instead of duplicating an open window
set showtabline=1               "stal:  Display the tabbar if there are multiple tabs. Use :tab ball or invoke Vim with -p
set splitright                  "spr:   puts new vsplit windows to the right of the current
set splitbelow                  "sb:    puts new split windows to the bottom of the current

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================= Search Related ==================
" Case insensitive search
set ic

" Higlhight search
set hls

" Set partial match search
set is 

" Change colorscheme from default to delek
" emacs pink topfunky-light
" colorscheme railscasts2 
" colorscheme molokai
colorscheme argokai
" colorscheme Tomorrow

"syntax enable
"set background=light
"colorscheme solarized

" Set the # of colors
set t_Co=256

"call pathogen#runtime_append_all_bundles()

" let g:Powerline_symbols = "fancy"

let g:airline#extensions#tabline#enabled = 1

" let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Always show statusline
set laststatus=2

let g:syntastic_always_populate_loc_list=1

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0


"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_min_keyword_length = 3

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \   if &omnifunc == "" |
    \     setlocal omnifunc=syntaxcomplete#Complete |
    \   endif
endif

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


let g:used_javascript_libs = 'underscore,backbone,angularjs,sugar,jquery'



" vim ruby config
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1



" ===================== Indentation Configuration ============

" set tab length
set ts=4

" set auto indent tab value
set sw=4

set autoindent
set ai
set smarttab
set expandtab


" Indent automatically depending on filetype
filetype plugin indent on

" ================ Folding Configuration ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use


" Then you can toggle folding with za. 
" You can fold everything with zM and unfold everything with zR.
" zm and zr can be used to get those folds just right. Always remember the almighty help file at “help :folding” if you get stuck.


" Wrap text instead of being on one line
set lbr

" ====================== Completion
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list

" ================= Files to Ignore =============
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*/vendor/rails/**
set wildignore+=*/vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.lock,*.gitkeep
set wildignore+=*.swp,*.bak,*.pyc,*.pyo,*.class,*.dll,*.a,*.lib,*.dylib,*.ncb,*.sdf,*.suo,*.pdb,*.psd,*.idb,*.db
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.ttf,*.tga,*.dds,*.ico,*.eot,*.pdf,*.ppt,*.pptx,*.doc,*.docx,*.dash
set wildignore+=*.swf,*.jar,*.zip,*.rar,*.tar,*.gz,*.dmg,*.jnlp 		" binary files
set wildignore+=*.mp3,*.avi,*.pkg,*.torrent,*.otf,*.ttf,*.iso,*.img,*.mkv
set wildignore+=*/Wine\ Files/**,*/Downloads/**
set wildignore+=*/coverage/**						" ignore simplcov/istanbul coverage folder
set wildignore+=*/test_out/**
set wildignore+=*/.idea/**
set wildignore+=*/node_modules/**					" Ignore node js module folder
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     		" MacOSX/Linux
set wildignore+=*.min.js,*.min.css 					" Ignore minified files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe,*.so,*.dat'


" ====================== Ctrl-P File/Folder Ignore =============
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

" ================ Scrolling ========================

set scrolloff=4         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=7
set sidescroll=1

" Remap leader to comma
let mapleader = ","

" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:EasyMotion_leader_key = '<Leader>'

" want to enable emmet in all modes, you can use set these options in vimrc
" let g:user_emmet_mode='n'    "only enable normal mode functions.
" let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall

let g:user_emmet_expandabbr_key='<C-space>'   "This maps the expansion to Ctrl-space 
let g:use_emmet_complete_tag=1

set autoread                    "Reload files changed outside vim
set visualbell                  "No sounds

autocmd BufWritePre {*.rb,*.js,*.coffee,*.scss,*.haml} :%s/\s\+$//e

map // <c-_>b
map <C-Space> <C-n>
"let g:ctrlp_map = '<c-f>'
let g:yankring_replace_n_pkey = '<C-Y>'

nnoremap <CR> :noh<CR><CR> " disable highlights after search


" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Allow undoing insert-mode ctrl-u and ctrl-w
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Smart way to move btw. windows {{{2
" (use cursor keys to not overwrite C-l (redraw))
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l


"===================== Buffer Management ===========================

"Buffer switching
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
:nnoremap <C-s> :w<CR>

" Close the current buffer
map <leader>bd :bd<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>


"========================= End Buffer Management =======================


"========================= ALT+[jk] or Command+[jk] ====================
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif
"============================= Close Tag ================================

" Default mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-b>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"let g:yankring_replace_n_pkey = '<C-Y>'

"========================= VimGrep ====================
" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>
"============================= Vim Close ================================


"http://nvie.com/posts/how-i-boosted-my-vim/
"The following trick is a really small one, but a super-efficient one, since it strips off two full keystrokes from almost every Vim command:
nnoremap ; :

if has("autocmd") "
	au BufRead,BufNewFile *.haml         setfiletype haml
	au BufRead,BufNewFile *.conf         setfiletype apache
endif


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if &ft != 'gitcommit' && fnamemodify(bufname('%'), ':t') != 'svn-commit.tmp' && line("'\"") > 0 && line("'\"") <= line("$") |
\   exe 'normal! g`"zv' |
\ endif 

" Make directory automatically.
" --------------------------------------
" http://vim-users.jp/2011/02/hack202/

autocmd BufWritePre *
      \ call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)
function! s:mkdir_as_necessary(dir, force)
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
