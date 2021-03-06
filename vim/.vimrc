let g:dotvim_settings = {}
if has("gui_running")
    let g:dotvim_settings.colorscheme = 'base16-monokai'
else
    let g:dotvim_settings.colorscheme = 'molokai'
endif
let g:dotvim_settings.version = 2


" vim book = http://learnvimscriptthehardway.stevelosh.com/
" by default, language specific plugins are not loaded.  this can be changed with the following:

let g:dotvim_settings.plugin_groups_exclude = ['scala', 'go']

if $COLORTERM != 'gnome-terminal' && !has("gui_running") && $TERM_PROGRAM != 'iTerm.app'
    let g:dotvim_settings.colorscheme = 'molokai'
    " disable auto complete when not runing with a proper terminal
    call add(g:dotvim_settings.plugin_groups_exclude, 'autocomplete')
endif

" if there are groups you want always loaded, you can use this:
" let g:dotvim_settings.plugin_groups_include = []

" alternatively, you can set this variable to load exactly what you want
" let g:dotvim_settings.plugin_groups = ['web','javascript','ruby','python','go','scala']

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

source ~/.vim/vimrc


" NeoBundle 'ferronrsmith/Colour-Sampler-Pack'
call dein#add('jelera/vim-javascript-syntax')
call dein#add('airblade/vim-gitgutter')
call dein#add('munen/find_yaml_key')
call dein#add('powerline/fonts')
call dein#add('ekalinin/Dockerfile.vim')
call dein#add('markcornick/vim-vagrant')
call dein#add('vim-scripts/bash-support.vim')
call dein#add('evanmiller/nginx-vim-syntax')
call dein#add('ninegrid/vim-fbp')


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
set wildignore+=*.swf,*.jar,*.zip,*.rar,*.tar,*.gz,*.dmg,*.jnlp         " binary files
set wildignore+=*.mp3,*.avi,*.pkg,*.torrent,*.otf,*.ttf,*.iso,*.img,*.mkv
set wildignore+=*/Wine\ Files/**,*/Downloads/**
set wildignore+=*/coverage/**                       " ignore simplcov/istanbul coverage folder
set wildignore+=*/test_out/**
set wildignore+=*/.idea/**,*/*.iml,*.iml
set wildignore+=*/node_modules/**                   " Ignore node js module folder
set wildignore+=*/tmp/*,*.so,*.swp,*.zip            " MacOSX/Linux
set wildignore+=*.min.js,*.min.css                  " Ignore minified files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe,*.so,*.dat'

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

" turn off wrapping
set nowrap
set linebreak
set gdefault        "searh/replace globally by default


" ================ Scrolling ========================

set scrolloff=4         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=7
set sidescroll=1

"============== disable GUI in GVIM =====================
:set go-=m  "remove menu bar
:set go-=T  "remove toolbar
:set go-=r  "remove right-hand scroll bar
:set go-=l  "remove left-hand scroll bar
"========================================================

"================== Search Functionality =================
nnoremap <CR> :noh<CR><CR> " disable highlights after search


" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?
"================== Search Func End ======================


set background=dark

let g:airline_powerline_fonts = 1

let g:EasyMotion_leader_key = '<Leader>'


" Quickly edit/reload the vimrc file
" http://nvie.com/posts/how-i-boosted-my-vim/
nmap <silent> <leader>1 :e $MYVIMRC<CR>
nmap <silent> <leader>2 :so $MYVIMRC<CR>


" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


" Visual mode keymappings: "{{{
" <TAB>: indent.
xnoremap <TAB>  >
" <S-TAB>: unindent.
xnoremap <S-TAB>  <
"}}}

" Easy escape."{{{
inoremap jj           <ESC>

"http://nvie.com/posts/how-i-boosted-my-vim/
"The following trick is a really small one, but a super-efficient one, since it strips off two full keystrokes from almost every Vim command:
nnoremap ; :

" This lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null

nmap <silent> ,/ :nohlsearch<CR>

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

if expand("%:e") == 'fbp'
  " detect fbp filetype
  autocmd BufNewFile,BufRead *.fbp set filetype=fbp
endif

if has("gui_running")
else
  highlight Normal ctermbg=none
endif
