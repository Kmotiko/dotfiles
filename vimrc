set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
filetype off
filetype plugin indent off

"set nocompatible


augroup Vimrc
    autocmd!
augroup END
command! -nargs=* Autocmd autocmd Vimrc <args>
command! -nargs=* AutocmdFT autocmd Vimrc FileType <args>


let g:mapleader=','

" set opt {{{
if has('mac')
  set macmeta
endif
" マルチバイト文字によるカーソルずれ防止
set ambiwidth=double
"  バックアップファイルを作成しない
set nobackup
" 行番号表示
set number
" オートインデント
set autoindent
" スマートなインデント
set smarttab
set cindent
" カーソル行のライン表示
set cursorline
" タブの幅
set tabstop=2
" オートインデントの幅
set shiftwidth=2
" tabをスペースに
set expandtab
" タイトル表示ON
set title
" テキスト幅の制限なし
set textwidth=0
" 括弧の対応をハイライト
set showmatch
" 大文字小文字混在の場合のみ大文字小文字を区別
set ignorecase
set smartcase
" タブや行末を表示
set list
" 自動IM ONを防止
set iminsert=0
set imsearch=0
" インクリメンタルサーチ
set incsearch
" サーチハイライト
set hlsearch
" foldを有効に
set foldenable
" clipboard連携
"set clipboard+=unnamed

" fold
set foldmethod=marker
"set whichwrap +=h
"set whichwrap +=l
"syntax off
" }}}


" 表示行単位移動
nnoremap j gj
nnoremap k gk

" スペース挿入
nnoremap <C-Space> i<Space><ESC><Right>

" タブ移動
nnoremap <silent><A-h> gT
nnoremap <silent><A-l> gt

" insertモードカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-o> <ESC>o

" コマンドラインの移動
cnoremap <C-u> <END><C-u>
cnoremap <C-a> <HOME>
cnoremap <C-h> <LEFT>
cnoremap <C-l> <RIGHT>


" dein {{{
let s:dein_dir = expand('~/.cache/dein') 
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
 
if has('vim_starting')
  execute 'set runtimepath+=' . expand(s:dein_repo_dir)
endif

" キャッシュがあればロード
" if dein#load_state(expand('$MYVIMRC'))
if dein#load_state(s:dein_dir)
  call dein#begin(expand('~/.cache/dein/'))


  call dein#add('Shougo/vimproc', {
        \ 'build' : {
        \     'windows' : 'make -f make_mingw32.mak',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make -f make_mac.mak',
        \     'unix' : 'make -f make_unix.mak',
        \    },
        \ })
  "
  call dein#add('Shougo/unite.vim')
  call dein#add('thinca/vim-quickrun')
  call dein#add('thinca/vim-ref')
  call dein#add('osyo-manga/unite-quickfix')
  call dein#add('tpope/vim-markdown')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  "call dein#add('sudo.vim')
  call dein#add('glidenote/memolist.vim')

  "
  call dein#add('Shougo/vimfiler', {
    \ 'depends'  : 'Shougo/unite.vim',
    \ 'autoload'  : { 
      \ 'commands' : [ 'VimFiler', 'VimFilerSplit', 
      \                 'VimFilerBufferDir', 'VimFilerCurrentDir', 'VimFilerCreate',
      \                 'VimFIlerDouble', 'VimFilerExplorer'] 
    \ } 
  \ })

  "
  call dein#add('Shougo/vimshell', {
    \ 'autoload'  : { 
      \ 'commands' : [ 'VimShell', 'VimShelCurrentDir', 'VimShellBufferDir'],
    \ }
  \ })


  call dein#add('kannokanno/previm', {
    \ 'depends' : 'tyru/open-browser.vim',
    \ 'autoload'  : {
      \ 'commands' : 'PrevimOpen',
      \ 'filetypes' : 'markdown'
    \ }
  \ })

  "
  call dein#add('tyru/open-browser.vim', {
    \ 'autoload'  : { 
      \ 'commands' : [
      \ 'OpenBrowser', 'OpenBrowserSearch', 'OpenBrowserSmartSearch'
      \ ] ,
      \ 'functions' : '*openbrowser#open'
    \ }
  \ })


  " neocomplete or neocomplcache
  if has('lua')
      call dein#add('Shougo/neocomplete')
  else
      call dein#add('Shougo/neocomplcache')
  endif

  " clang complete
  "call dein#add('Rip-Rip/clang_complete', {
  "  \ 'depends' : 'kana/vim-operator-user',
  "  \ 'autoload'  : {'filetypes' : ['c', 'cpp']},
  "\ })

  " gtags
  " call dein#add('vim-scripts/gtags.vim', {
  "   \ 'autoload'  : {'filetypes' : ['c', 'cpp']},
  " \ })

  " vim-clang-format
  call dein#add('rhysd/vim-clang-format', {
    \ 'depends' : 'kana/vim-operator-user',
    \ 'autoload'  : {'filetypes' : ['c', 'cpp']},
  \ })

  call dein#add('majutsushi/tagbar', {
        \ 'commands': 'TagbarToggle'
        \ })
  
  
  call dein#end()
  call dein#save_state()
endif


filetype plugin indent on
syntax enable
" Autocmd BufWritePost *vimrc,*gvimrc NeoBundleClearCache


call dein#check_install()
" if dein#check_install()
"   echomsg 'Not installed bundles : ' .
"   \ string(dein#get_not_installed_bundle_names())
"   echomsg 'Please execute ":dein#install" command.'
" endif
" }}}


" if vim has lua extension, use neocomplete
" and use neocomplecache otherwise.
" neocomplete {{{
if has('lua')
  "neocomplete
  let g:neocomplete#enable_at_startup=1
  let g:neocomplete#enable_smart_case=1
  let g:neocomplete#enable_fuzzy_completion=1
  let g:neocomplete#enable_auto_delemiter=1
  let g:neocomplete#min_syntax_length = 3
  let g:neocomplete#auto_completion_start_length = 2
  let g:neocomplete#enable_camel_case_completion = 1

  "
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  "
  if !exists('g:neocomplete#delimiter_patterns')
    let g:neocomplete#delimiter_patterns = {}
  endif
  let g:neocomplete#delimiter_patterns.vim=['#']
  let g:neocomplete#delimiter_patterns.cpp=['::']

  "
  if !exists('g:neocomplete#sources#include#paths')
    let g:neocomplete#sources#include#paths={}
  endif
  let g:neocomplete#sources#include#paths.cpp = '.,/usr/local/inlude'
  let g:neocomplete#sources#include#paths.c = '.,/usr/local/include'

  " omni complete
  AutocmdFT python setlocal omnifunc=pythoncomplete#Complete
  AutocmdFT c setlocal omnifunc=ccomplete#Complete
  
  if !exists("g:neocomplete#force_omni_input_patterns")
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
  let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

  let g:neocomplete#force_overwrite_completefunc=1

  inoremap <expr><C-g> neocomplete#undo_completion()
  inoremap <expr><C-s> neocomplete#complete_common_string()
  inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr><C-b> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-e> neocomplete#cancel_popup()

  let g:neocomplete#sources#vim#complete_functions = {
      \ 'Unite' : 'unite#complete_source',
      \ 'VimShellExecute' : 'vimshell#vimshell_execute_complete',
      \ 'VimShellInteractive' : 'vimshell#vimshell_execute_complete',
      \ 'VimShellTerminal' : 'vimshell#vimshell_execute_complete',
      \ 'VimShell' : 'vimshell#complete',
      \ 'VimFiler' : 'vimfiler#complete',
      \}
" }}}
" neocomplecache {{{
else
  "neocomplcache
  let g:neocomplcache_enable_at_startup=1
  let g:neocomplcache_force_overwrite_completefunc=1
  let g:neocomplcache_text_mode_filetypes={}

  let g:neocomplcache_include_paths = {}
  let g:neocomplcache_include_paths.cpp = '.,/usr/local/inlude'
  let g:neocomplcache_include_paths.c = '.,/usr/include'
  
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  
  " Use camel case completion.
  let g:neocomplcache_enable_camel_case_completion = 1
  
  " Use underbar completion.
  let g:neocomplcache_enable_underbar_completion = 1
  
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
  
  "
  let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }
  
  AutocmdFT python setlocal omnifunc=pythoncomplete#Complete
  AutocmdFT c      setlocal omnifunc=ccomplete#Complete

  "
  if !exists("g:neocomplcache_force_omni_patterns")
      let g:neocomplcache_force_omni_patterns = {}
  endif
  let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  "
  if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


  inoremap <expr><C-g> neocomplcache#undo_completion()
  inoremap <expr><C-s> neocomplcache#complete_common_string()
  inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-e> neocomplcache#cancel_popup()
endif
" }}}


" neosnippet
imap <expr><C-a> neosnippet#expandable() \|\| neosnippet#jumpable() ?
            \ "\<Plug>(neosnippet_jump_or_expand)" :
            \ "\<C-s>"
smap <expr><C-a> neosnippet#expandable() \|\| neosnippet#jumpable() ?
            \ "\<Plug>(neosnippet_jump_or_expand)" :
            \ "\<C-s>"


" clang_complete
if has('mac')
  let g:clang_complete_auto = 0
  let g:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib'
  let g:clang_use_library = 1
  let g:clang_conceal_snippets=1
else
  let g:clang_auto_select = 1
endif

let g:clang_hl_errors=1
let g:clang_user_options='-std=c++11 -stdlib=libc++ -I /usr/local/include 2>/dev/null || exit 0'


" vimshell
nnoremap <silent>vs :VimShell<CR>
nnoremap <silent>ss :VimShellSendString<CR>


" vimfiler
nnoremap <F2> :VimFilerCreate -split -simple -winwidth=30 -toggle -no-quit<CR>

" gtags
nnoremap <Leader>? :GtagsCursor<CR> 
nnoremap <C-\> :Gtags -r <C-r><C-w><CR> 

" tagbar
nnoremap <F3> :TagbarToggle<CR>

" quickrun {{{
let g:quickrun_config = {}

let g:quickrun_config._ = {
      \ 'runner': 'vimproc',
      \ 'runner/vimproc/updatetime': 60,
      \}

let g:quickrun_config['cpp/clang'] = {
      \ 'command':  'clang++',
      \ 'cmdopt':  '-stdlib=libc++ -std=c++11 -02',
      \}

let g:quickrun_config['cpp/g++'] = {
      \ 'command':  'g++',
      \ 'cmdopt':  '-std=c++11 -02',
      \}

"markdown
"let g:quickrun_config['markdown/pandoc'] = {
"    \   'command': 'pandoc',
"    \   'cmdopt': '-s html5',
"    \   'outputter': 'browser'
"    \}


" syntax
AutocmdFT cpp nnoremap <silent><buffer><Leader>sc :<C-u>QuickRun -type cpp/clang<CR>

if executable('pyflakes')
  let g:quickrun_config['syntax/python'] = {
      \ 'command' : 'pyflakes',
      \ 'exec' : '%c %o %s:p',
      \ 'errorformat' : '%f %l:%c %m',
      \ }
  "Autocmd BufWritePost *.py QuickRun -type syntax/python
endif

if executable('go')
  let g:quickrun_config['syntax/go'] = {
      \ 'command' : 'go',
      \ 'exec' : '%c vet %o %s:p',
      \ 'errorformat' : '%f %l:%c %m',
      \ }
  Autocmd BufWritePost *.go QuickRun -type syntax/go
endif

" }}}


" previm {{{
Autocmd BufRead,BufNew,BufNewFile *.md,*.markdown,*.mkd setlocal ft=markdown
AutocmdFT markdown nnoremap <buffer><Leader>p :<C-u>PrevimOpen<CR>
Autocmd BufWritePost *.md,*.markdown call previm#refresh()
let g:previm_enable_realtime = 0
" }}}


" MemoList
let g:memolist_vimfiler = 1
let g:memolist_memo_suffix = "md"
noremap <Leader>mn  :MemoNew<CR>
noremap <Leader>ml  :MemoList<CR>

" vim-clang-format {{{
let g:clang_format#command="clang-format-36"
let g:clang_format#style_options = {
        \ "BasedOnStyle" : "LLVM", 
        \ "IndentWidth": 2,
        \}
map ,x <Plug>(operator-clang-format)
" }}}


" 改行でコメント自動挿入しない
AutocmdFT * setlocal formatoptions-=r formatoptions-=o

" quickfix
Autocmd QuickFixCmdPost *grep* cwindow


" vim-ref {{{
" pydoc
AutocmdFT python nnoremap <silent><buffer> <Space>k :<C-u>Unite -start-insert -default-action=split ref/pydoc<CR>
" }}}
