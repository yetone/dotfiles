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
Plug 'davidhalter/jedi-vim' | Plug 'lambdalisue/vim-pyenv'
Plug 'biskark/vim-ultimate-colorscheme-utility'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Valloric/vim-operator-highlight'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'enomsg/vim-haskellConcealPlus'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'whatyouhide/vim-lengthmatters'
"Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'jelera/vim-javascript-syntax'
Plug 'terryma/vim-multiple-cursors'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'guns/xterm-color-table.vim'
Plug 'leafgarland/typescript-vim'
Plug 'suan/vim-instant-markdown'
Plug 'gabrielelana/vim-markdown'
Plug 'idris-hackers/idris-vim'
Plug 'Valloric/MatchTagAlways'
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
Plug 'junegunn/seoul256.vim'
Plug 'pgdouyon/vim-evanesco'
Plug 'idanarye/vim-vebugger'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'edkolev/tmuxline.vim'
Plug 'djoshea/vim-autoread'
Plug 'tikhomirov/vim-glsl'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimshell.vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'raichoo/haskell-vim'
Plug 'tpope/vim-obsession'
Plug 'thinca/vim-quickrun'
Plug 'Slava/vim-spacebars'
Plug 'groenewege/vim-less'
Plug 'hsanson/vim-android'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'godlygeek/tabular'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-abolish'
Plug 'peterhoeg/vim-qml'
"Plug 'gilligan/vim-lldb'
Plug 'bling/vim-airline'
"Plug 'jeaye/color_coded', { 'do': './configure && make' }
Plug 'oblitum/formatvim'
Plug 'junegunn/goyo.vim'
Plug 'ogier/guessindent'
Plug 'basyura/bitly.vim'
Plug 'rhysd/wandbox-vim'
Plug 'eagletmt/neco-ghc'
Plug 'tmhedberg/matchit'
Plug 'fmoralesc/vim-pad'
Plug 'tpope/vim-eunuch'
Plug 'SirVer/ultisnips'
Plug 'mattn/webapi-vim'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-ragtag'
Plug 'Shougo/unite.vim'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'drn/zoomwin-vim'
Plug 'xolox/vim-shell'
Plug 'phildawes/racer', { 'do': 'cargo build --release' }
Plug 'keith/swift.vim'
Plug 'xolox/vim-misc'
Plug 'vim-jp/cpp-vim'
Plug 'wting/rust.vim'
Plug 'tpope/vim-haml'
Plug 'fidian/hexmode'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'mattn/gist-vim'
Plug 'oblitum/frawor'
Plug 'nicwest/QQ.vim'
Plug 'suy/vim-qmake'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'dahu/vimple'
" }}}

call plug#end()

" Plugin Preloading {{{
runtime! plugin/sensible.vim
" }}}

" }}}

" General Settings {{{
let mapleader = ','         " changes leader key
set regexpengine=1          " set old regexp engine
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
set t_ut=                   " Fix 256 colors in tmux http://sunaku.github.io/vim-256color-bce.html

au GUIEnter * set vb t_vb=  " enforces no visual bell for GUI

" Open QuickFix horizontally with line wrap
au FileType qf wincmd J | setlocal wrap

" Preview window with line wrap
au WinEnter * if &previewwindow | setlocal wrap | endif

set wildignore+=CMakeFiles  " add ignored extension
set wildignore+=*.pyc       " add ignored extension
" }}}

" GUI Settings {{{
if has('gui_running')
    " Set default GUI font
    set guifont=monofur\ for\ Powerline\ 11

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
let g:seoul256_background = 235
colors seoul256
"colors seoul256-light
hi! link Conceal Normal
" }}}

" Airline Setup {{{
let g:airline_theme = 'wombat'
"let g:airline_theme = 'tomorrow'
let g:airline_powerline_fonts = 1
" }}}

" File Type Settings {{{

" C++
au BufNewFile,BufRead *
            \ if expand('%:e') =~ '^\(h\|hh\|hxx\|hpp\|ii\|ixx\|ipp\|inl\|txx\|tpp\|tpl\|cc\|cxx\|cpp\)$' |
            \   if &ft != 'cpp'                                                                           |
            \     set ft=cpp                                                                              |
            \   endif                                                                                     |
            \ endif

" Go
let g:godef_split = 0
au FileType go setlocal noexpandtab

" Haskell
let g:hpaste_author = 'Francisco Lopes'
let g:syntastic_haskell_ghc_mod_args = '-g-fno-warn-type-defaults -g-fno-warn-missing-signatures'
au FileType haskell setlocal omnifunc=necoghc#omnifunc

" Ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

" Rust
let g:racer_cmd = "~/.vim/plugged/racer/target/release/racer"

" Java
au FileType java set omnifunc=javacomplete#Complete
" }}}

" format.vim Setup {{{
let g:format_HTMLAdditionalCSS = '
\ @font-face {
\   font-family: "monofur";
\   src: url("http://typefront.com/fonts/825592811.eot");
\   src: local("☺"),
\        url("http://typefront.com/fonts/825592811.woff") format("woff"),
\        url("http://typefront.com/fonts/825592811.ttf") format("truetype"),
\        url("http://typefront.com/fonts/825592811.svg") format("svg");
\ }
\ body { font-family: "monofur", "Bitstream Vera Sans Mono", "DejaVu Sans Mono", Monaco, monospace; font-size:12pt; -webkit-font-smoothing: antialiased; }'
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
hi! link SyntasticErrorLine Visual
hi! link SyntasticWarningLine Visual
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
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers = { 'haskell' : ['.'], 'rust' : ['::', '.'] }
if !exists('g:ycm_filetype_specific_completion_to_disable')
    let g:ycm_filetype_specific_completion_to_disable = {}
endif
let g:ycm_filetype_specific_completion_to_disable.python = 1
nnoremap <leader>h :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>e :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
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
            \   'cpp' : {
            \     'command': 'clang++',
            \     'cmdopt': '-g -O0 -Wall -Wextra -pedantic -std=c++1z -lpthread'
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
nnoremap <leader>x :VimFilerExplorer<cr>
" }}}

" CtrlP Setup {{{
let g:ctrlp_working_path_mode = 0
let g:ctrlp_follow_symlinks = 1
nnoremap <silent> <space> :CtrlPBuffer<cr>
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
au FileType c,cpp,objc,objcpp noremap  <silent> <buffer> <leader>f :ClangFormat<cr>
au FileType c,cpp,objc,objcpp noremap! <silent> <buffer> <leader>f <c-o>:ClangFormat<cr>
" }}}

" Jedi Setup {{{
if completer == 'Shougo/neocomplete.vim'
    let g:jedi#popup_on_dot = 0
endif
let g:jedi#show_call_signatures = 2
let g:jedi#auto_vim_configuration = 0
" }}}

" vim-pad Setup {{{
let g:pad#dir = '~/Dropbox/Notes'
let g:pad#open_in_split = 0
" }}}

" ZoomWin Setup {{{
nnoremap <leader>z :ZoomWin<CR>
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
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

function! s:goyo_enter()
    silent !tmux set status off
endfunction

function! s:goyo_leave()
    silent !tmux set status on
endfunction

au! User GoyoEnter
au! User GoyoLeave
au  User GoyoEnter nested call <SID>goyo_enter()
au  User GoyoLeave nested call <SID>goyo_leave()

nnoremap <leader>g :Goyo<CR>
" }}}

" vim-instant-markdown Setup {{{
let g:instant_markdown_autostart = 0
" }}}

" vim-markdown Setup {{{
let g:markdown_enable_mappings = 0
let g:markdown_enable_folding = 1
" }}}

" vim-operator-highlight Setup {{{
"let g:ophigh_highlight_link_group = 'Keyword'
let g:ophigh_filetypes_to_ignore = { "haskell": 1, "javascript": 1, "html": 1, "css": 1, "scss": 1 }
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
let g:vebugger_leader = '<Leader>d'
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
            \ <line1>,<line2>Format format | f index.html | exe 'Gist -a' | bd!                                       |
            \ let @+ = 'http://bl.ocks.org/anonymous/raw/' . matchstr(@+, 'https://gist.github.com/\zs\w\+\ze') . '/' |
            \ let @+ = bitly#shorten(@+).url | redraw | echomsg 'Done: ' . @+ | setlocal nomodified
" }}}
