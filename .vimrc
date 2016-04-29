" VIM-PLUG Setup {{{

" Automatic installation {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall
endif
" }}}

call plug#begin('~/.vim/plugged')

" Plugins {{{
Plug 'maksimr/vim-jsbeautify', { 'dir': '~/.vim/plugged/vim-jsbeautify', 'do': 'git submodule update --init --recursive' }
Plug 'davidhalter/jedi-vim' | Plug 'lambdalisue/vim-pyenv'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Valloric/vim-operator-highlight'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline-themes'
"Plug 'enomsg/vim-haskellConcealPlus'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'jelera/vim-javascript-syntax'
Plug 'terryma/vim-multiple-cursors'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'guns/xterm-color-table.vim'
Plug 'leafgarland/typescript-vim'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'suan/vim-instant-markdown'
Plug 'terryma/vim-expand-region'
Plug 'neovimhaskell/haskell-vim'
Plug 'idris-hackers/idris-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'vim-airline/vim-airline'
Plug 'rhysd/vim-clang-format'
Plug 'junegunn/limelight.vim'
Plug 'dietsche/vim-lastplace'
Plug 'hail2u/vim-css3-syntax'
let completer = 'oblitum/YouCompleteMe'
if has("python3") && !has("python")
    let completer = 'Shougo/neocomplete.vim'
endif
Plug completer
Plug 'embear/vim-localvimrc'
"Plug 'vim-pandoc/vim-pandoc'
Plug 'pgdouyon/vim-evanesco'
Plug 'idanarye/vim-vebugger'
Plug 'junegunn/seoul256.vim'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
"Plug 'edkolev/tmuxline.vim'
Plug 'djoshea/vim-autoread'
Plug 'junegunn/vim-journal'
Plug 'tikhomirov/vim-glsl'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimshell.vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'tpope/vim-obsession'
Plug 'thinca/vim-quickrun'
Plug 'Slava/vim-spacebars'
Plug 'groenewege/vim-less'
Plug 'hsanson/vim-android'
Plug 'lambdatoast/elm.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'romainl/Apprentice'
Plug 'rust-lang/rust.vim'
Plug 'bitc/vim-hdevtools'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-abolish'
Plug 'peterhoeg/vim-qml'
"Plug 'gilligan/vim-lldb'
"Plug 'jeaye/color_coded', { 'do': 'cmake . && make -j4 && make install' }
Plug 'oblitum/formatvim'
Plug 'junegunn/goyo.vim'
Plug 'ogier/guessindent'
Plug 'basyura/bitly.vim'
Plug 'rhysd/wandbox-vim'
Plug 'eagletmt/neco-ghc'
Plug 'tmhedberg/matchit'
Plug 'fmoralesc/vim-pad'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-eunuch'
Plug 'SirVer/ultisnips'
Plug 'mattn/webapi-vim'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-ragtag'
Plug 'Shougo/unite.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'mileszs/ack.vim'
Plug 'drn/zoomwin-vim'
Plug 'xolox/vim-shell'
Plug 'keith/swift.vim'
Plug 'xolox/vim-misc'
Plug 'vim-jp/cpp-vim'
Plug 'tpope/vim-haml'
Plug 'fidian/hexmode'
Plug 'Shougo/vimproc', { 'do': 'make -j4' }
Plug 'mattn/gist-vim'
Plug 'oblitum/frawor'
Plug 'nicwest/QQ.vim'
Plug 'suy/vim-qmake'
Plug 'elzr/vim-json'
Plug 'lervag/vimtex'
Plug 'fatih/vim-go'
" }}}

call plug#end()

" Plugin Preloading {{{
runtime! plugin/sensible.vim
" }}}

" }}}

" General Settings {{{
let mapleader = ' '         " changes leader key
set noswapfile              " no swap files
set hidden                  " hide buffer without notice
set hlsearch                " highlight the last searched term
set virtualedit=all         " let us walk in limbo
set cpoptions+=$            " dollar sign while changing
set foldmethod=marker       " folds on marks
set nowrap                  " don't wrap lines
set clipboard=unnamedplus   " for simplified clipboard copy/paste
set noshowmode              " hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowcmd               " disable blinking command feedback in bottom-right corner
set mouse=a                 " enable mouse to get scrolling
set vb t_vb=                " no visual bell
set pumheight=30            " limit popup menu height
set concealcursor=nv        " expand concealed characters in insert mode solely
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 " space for tabs by default
set t_ut=                   " fix 256 colors in tmux http://sunaku.github.io/vim-256color-bce.html
set spelllang=en,pt_br      " set default spelling languages

au GUIEnter * set vb t_vb=  " enforces no visual bell for GUI

" Open QuickFix horizontally with line wrap
au FileType qf wincmd J | setlocal wrap

" Preview window with line wrap
au WinEnter * if &previewwindow | setlocal wrap | endif

" Mappings
nnoremap <leader>l :redraw!<cr>

" Ignored extensions
set wildignore+=CMakeFiles
set wildignore+=*.pyc
" }}}

" GUI Settings {{{
if has('gui_running')
    " Set default GUI font
    set guifont=monofur\ for\ Powerline\ 11.6

    " Remove scroll bars
    set guioptions-=L
    set guioptions-=R
    set guioptions-=l
    set guioptions-=r

    " Disable toolbar
    set guioptions=-t
endif
" }}}

" Colorscheme {{{
colors apprentice
"colors seoul256-light
hi! link Conceal Normal
hi! Normal ctermbg=NONE
hi! NonText ctermbg=NONE
" }}}

" Airline Setup {{{
let g:airline_theme = 'hybrid'
let g:airline_powerline_fonts = 1
" }}}

" File Type Settings {{{

" C++
au BufNewFile,BufRead *
            \ if expand('%:e') =~ '^\(h\|hh\|hxx\|hpp\|ii\|ixx\|ipp\|inl\|txx\|tpp\|tpl\|cc\|cxx\|cpp\)$' |
            \     if &ft != 'cpp'                                                                         |
            \         set ft=cpp                                                                          |
            \     endif                                                                                   |
            \ endif

" Go
let g:godef_split = 0
au FileType go setlocal noexpandtab

" Haskell
let g:hpaste_author = 'Francisco Lopes'
let g:syntastic_haskell_ghc_mod_args = '-g-fno-warn-type-defaults -g-fno-warn-missing-signatures'
let g:haskellmode_completion_ghc = 0
au FileType haskell setlocal omnifunc=necoghc#omnifunc

" Ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

" Rust
let g:rustfmt_autosave = 1

" Java
au FileType java setlocal omnifunc=javacomplete#Complete

" Mmark
au BufNewFile,BufRead *.mmark set filetype=pandoc
" }}}

" format.vim Setup {{{
let g:format_HTMLAdditionalCSS = '
\ @font-face {
\   font-family: "monofur";
\   src: url("http://s3.amazonaws.com/oblitum-fonts/monofur-webfont.eot");
\   src: local("monofur for Powerline"),
\        url("http://s3.amazonaws.com/oblitum-fonts/monofur-webfont.woff") format("woff"),
\        url("http://s3.amazonaws.com/oblitum-fonts/monofur-webfont.ttf") format("truetype"),
\        url("http://s3.amazonaws.com/oblitum-fonts/monofur-webfont.svg") format("svg");
\ }
\ body { font-family: "monofur", "Bitstream Vera Sans Mono", "DejaVu Sans Mono", Monaco, monospace; font-size:11.6pt; -webkit-font-smoothing: antialiased; }'
" }}}

" Syntastic Setup {{{

" getbg function {{{
" gets background of a highlighting group with fallback to SignColumn group
function! s:getbg(group)
    if has("gui_running")
        let l:mode = 'gui'
        let l:validation = '\w\+\|#\x\+'
    else
        let l:mode = 'cterm'
        let l:validation = '\w\+'
    endif

    if synIDattr(synIDtrans(hlID(a:group)), 'reverse', l:mode)
        let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'fg', l:mode)
    else
        let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'bg', l:mode)
    endif

    if l:bg == '-1' || l:bg !~ l:validation
        if synIDattr(synIDtrans(hlID('SignColumn')), 'reverse', l:mode)
            let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'fg', l:mode)
        else
            let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', l:mode)
        endif
    endif

    if l:bg == '-1' || l:bg !~ l:validation
        return ''
    endif

    return l:mode . 'bg=' . l:bg
endfunction
"}}}

let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = '☢'
hi! link SyntasticErrorLine SignColumn
hi! link SyntasticWarningLine SignColumn
au VimEnter,ColorScheme * exec 'hi! SyntasticErrorSign guifg=red ctermfg=red ' . s:getbg('SyntasticErrorLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticWarningSign guifg=yellow ctermfg=yellow ' . s:getbg('SyntasticWarningLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticError ' . s:getbg('SyntasticErrorLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticWarning ' . s:getbg('SyntasticWarningLine')

let g:syntastic_mode_map = { "mode": "active", "passive_filetypes": ["go", "html"] }
" }}}

" delimitMate Setup {{{
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_quotes = "\" '"
" }}}

" YouCompleteMe Setup {{{
set completeopt-=preview
let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_semantic_triggers = { 'haskell' : ['.'] }
let g:ycm_rust_src_path = '/opt/src/rust/src'
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1,
      \ 'html': 1,
      \ 'css': 1
      \}
nnoremap <leader>h :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>? :YcmCompleter GoToDefinitionElseDeclaration<cr>
nnoremap <leader>d :YcmCompleter GoToDefinition<cr>
nnoremap <leader>i :YcmCompleter FixIt<cr>
" }}}

" neocomplete Setup {{{
let g:neocomplete#enable_at_startup = 1
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" }}}

" vim-pyenv Setup {{{
if jedi#init_python()
    function! s:jedi_auto_force_py_version() abort
        let major_version = pyenv#python#get_internal_major_version()
        call jedi#force_py_version(major_version)
    endfunction
    augroup vim-pyenv-custom-augroup
        au! *
        au User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
        au User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
    augroup END
endif
" }}}

" Ultisnips Setup {{{
let g:UltiSnipsExpandTrigger = '<c-a>'
" }}}

" QuickRun Setup {{{
let g:quickrun_config = {
            \   '_': {
            \     'outputter/buffer/close_on_empty': 1
            \   },
            \   'haskell' : {
            \     'command': 'stack',
            \     'cmdopt': 'runghc --verbosity silent'
            \   },
            \   'cpp' : {
            \     'command': 'clang++',
            \     'cmdopt': '-g -O0 -Wall -Wextra -pedantic -std=c++1z -lpthread'
            \   },
            \   'swift' : {
            \     'command': 'swiftc',
            \     'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
            \     'tempfile': '%{tempname()}.swift',
            \     'hook/sweep/files': ['%S:p:r'],
            \   }
            \ }
" }}}

" localvimrc Setup {{{
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0
" }}}

" VimShell Setup {{{
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
" }}}

" VimFiler Setup {{{
let g:vimfiler_as_default_explorer = 1
nnoremap <leader>f :VimFilerExplorer<cr>
au FileType vimfiler nmap <silent><buffer> <2-LeftMouse> <Plug>(vimfiler_smart_l)
" }}}

" CtrlP Setup {{{
let g:ctrlp_working_path_mode = 0
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <silent> <leader>b :CtrlPBuffer<cr>
" }}}

" ClangFormat Setup {{{
let g:clang_format#style_options = {
            \ "AccessModifierOffset": -4,
            \ "AllowShortLoopsOnASingleLine": "false",
            \ "AllowShortBlocksOnASingleLine" : "false",
            \ "AllowShortIfStatementsOnASingleLine": "false",
            \ "AlwaysBreakTemplateDeclarations": "false",
            \ "DerivePointerBinding": "false",
            \ "PointerBindsToType": "false",
            \ "ColumnLimit": 80,
            \ "TabWidth": 4,
            \ "Standard": "C++11" }
au FileType c,cpp,objc,objcpp noremap  <silent> <buffer> <leader>= :ClangFormat<cr>
" }}}

" Jedi Setup {{{
if completer == 'Shougo/neocomplete.vim'
    let g:jedi#popup_on_dot = 0
endif
let g:jedi#auto_initialization = 0
let g:jedi#show_call_signatures = 2
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures_delay = 0
if &rtp =~ '\<jedi\>'
    augroup JediSetup
        au!
        au FileType python
              \ setlocal omnifunc=jedi#completions  |
              \ call jedi#configure_call_signatures()
    augroup END
endif
" }}}

" vim-pad Setup {{{
let g:pad#dir = '~/Documents/Dropbox/Notes'
let g:pad#set_mappings = 0
let g:pad#open_in_split = 0
" }}}

" ZoomWin Setup {{{
nnoremap <leader>z :ZoomWin<cr>
" }}}

" GuessIndent Setup {{{
au BufReadPost * :GuessIndent
" }}}

" lengthmatters Setup {{{
let g:lengthmatters_on_by_default = 0
call lengthmatters#highlight_link_to('Visual')
au FileType c,cpp,go :LengthmattersEnable
" }}}

" Indent Guides Setup {{{
let g:indent_guides_enable_on_vim_startup = 0
" }}}

" Goyo Setup {{{
let g:goyo_width = 120
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

function! s:goyo_enter()
    if !has('gui_running')
        silent !tmux set status off
    endif
endfunction

function! s:goyo_leave()
    if !has('gui_running')
        silent !tmux set status on
    endif
    hi! Normal ctermbg=NONE
    hi! NonText ctermbg=NONE
endfunction

au! User GoyoEnter
au! User GoyoLeave
au  User GoyoEnter nested call <SID>goyo_enter()
au  User GoyoLeave nested call <SID>goyo_leave()

nnoremap <leader>g :Goyo<cr>
" }}}

" vim-instant-markdown Setup {{{
let g:instant_markdown_autostart = 0
" }}}

" vim-operator-highlight Setup {{{
let g:ophigh_highlight_link_group = 'Keyword'
let g:ophigh_filetypes_to_ignore = { "haskell": 1, "javascript": 1, "html": 1, "css": 1, "scss": 1, "pandoc": 1 }
" }}}

" tern_for_vim Setup {{{
let g:tern_show_signature_in_pum = 1
let g:tern_show_argument_hints = 'on_move'
" }}}

" vim-css3-syntax Setup {{{
augroup VimCSS3Syntax
    au!
    au FileType css setlocal iskeyword+=-
augroup END
" }}}

" vim-android Setup {{{
let g:android_sdk_path = '/opt/android-sdk'
let g:gradle_path = '/usr/bin'
" }}}

" Vebugger Setup {{{
let g:vebugger_leader = '<leader>v'
" }}}

" better-whitespace Setup {{{
let g:better_whitespace_filetypes_blacklist = ['vimfiler']
" }}}

" vim-multiple-cursors Setup {{{
function! Multiple_cursors_before()
    let g:ycm_auto_trigger = 0
    silent! exe 'NeoCompleteDisable'
endfunction

function! Multiple_cursors_after()
    let g:ycm_auto_trigger = 1
    silent! exe 'NeoCompleteEnable'
endfunction
" }}}

" Sayonara Setup {{{
nnoremap <leader>q :Sayonara!<cr>
" }}}

" vim-journal Setup {{{
let g:journal#dirs =  ['Notes', 'notes', 'journal.d']
"}}}

" TagBar Setup {{{
nnoremap <leader>t :TagbarToggle<cr>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \ ]
\ }

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
" }}}

" Fix borders of fullscreen GUI {{{
if has('gui_gtk') && has('gui_running')
    let s:border = synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')
    exe 'silent !echo ''style "vimfix" { bg[NORMAL] = "' . escape(s:border, '#') . '" }'''.
                \' > ~/.gtkrc-2.0'
    exe 'silent !echo ''widget "vim-main-window.*GtkForm" style "vimfix"'''.
                \' >> ~/.gtkrc-2.0'
endif
" }}}

" Toggle Shell Pasting {{{
nnoremap <F2> :set invpaste paste?<cr>
set pastetoggle=<F2>
" }}}

" Paste block while inserting new lines to hold it {{{
function! FancyPaste(reg)
    let paste = split(getreg(a:reg), '\n')
    let spaces = repeat(' ', virtcol('.')-1)
    call map(paste, 'spaces . v:val')
    call append(line('.'), paste)
endfunction

nnoremap <leader>p :call FancyPaste('"')<cr>
nnoremap <leader>P :call FancyPaste('+')<cr>
" }}}

" Edit command output in a buffer {{{
command! -nargs=+ BufOut redir => bufout | silent <args> | redir END | new | call append(0, split(bufout, '\n'))
" }}}

" :Me[ssages] as shorthand for `:BufOut :messages' (the dominant use case of :BufOut) {{{
command! -nargs=0 Messages :redir => bufout | silent :messages | redir END | new | call append(0, split(bufout, '\n'))
" }}}

" Gist it to bl.ocks.org {{{
let g:gist_clip_command = 'xclip -selection clipboard'
command! -range=% Blocks
            \ <line1>,<line2>Format format | f index.html | exe 'Gist! -p' | bd!                                    |
            \ let @+ = 'http://bl.ocks.org/oblitum/raw/' . matchstr(@+, 'https://gist.github.com/\zs\w\+\ze') . '/' |
            \ let @+ = bitly#shorten(@+).url | redraw | echomsg 'Done: ' . @+ | setlocal nomodified
" }}}
