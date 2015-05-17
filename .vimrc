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
Plug 'biskark/vim-ultimate-colorscheme-utility'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Valloric/vim-operator-highlight'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'enomsg/vim-haskellConcealPlus'
"Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'jelera/vim-javascript-syntax'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'guns/xterm-color-table.vim'
Plug 'leafgarland/typescript-vim'
Plug 'zerowidth/vim-copy-as-rtf'
Plug 'suan/vim-instant-markdown'
Plug 'idris-hackers/idris-vim'
Plug 'rhysd/vim-clang-format'
Plug 'junegunn/limelight.vim'
Plug 'dietsche/vim-lastplace'
Plug 'oblitum/YouCompleteMe'
Plug 'embear/vim-localvimrc'
"Plug 'vim-pandoc/vim-pandoc'
Plug 'junegunn/seoul256.vim'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'edkolev/tmuxline.vim'
Plug 'davidhalter/jedi-vim'
Plug 'djoshea/vim-autoread'
Plug 'scrooloose/nerdtree'
Plug 'tikhomirov/vim-glsl'
Plug 'Shougo/vimshell.vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'raichoo/haskell-vim'
Plug 'tpope/vim-obsession'
Plug 'thinca/vim-quickrun'
Plug 'Soares/longline.vim'
Plug 'Slava/vim-spacebars'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-abolish'
Plug 'peterhoeg/vim-qml'
"Plug 'gilligan/vim-lldb'
Plug 'bling/vim-airline'
Plug 'rizzatti/dash.vim'
"Plug 'jeaye/color_coded', { 'do': './configure && make' }
Plug 'oblitum/formatvim'
Plug 'junegunn/goyo.vim'
Plug 'ogier/guessindent'
Plug 'basyura/bitly.vim'
Plug 'rhysd/wandbox-vim'
Plug 'eagletmt/neco-ghc'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-eunuch'
Plug 'SirVer/ultisnips'
Plug 'mattn/webapi-vim'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-ragtag'
Plug 'mileszs/ack.vim'
Plug 'oblitum/bufkill'
Plug 'morhetz/gruvbox'
Plug 'drn/zoomwin-vim'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-shell'
Plug 'phildawes/racer'
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
set regexpengine=1          " set old regexp engine
set noswapfile              " no swap files
set hidden                  " hide buffer without notice
set hlsearch                " highlight the last searched term
set virtualedit=all         " let us walk in limbo
set cpoptions+=$            " dollar sign while changing
set foldmethod=marker       " folds on marks
set nowrap                  " don't wrap lines
set textwidth=80            " set expected line width to 80
set clipboard=unnamed       " for simplified clipboard copy/paste
set noshowmode              " hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowcmd               " disable blinking command feedback in bottom-right corner
set mouse=a                 " enable mouse to get scrolling
set vb t_vb=                " no visual bell
set pumheight=30            " limit popup menu height
set concealcursor=nv        " expand concealed characters in insert mode solely
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 " space for tabs by default

au InsertEnter * :let @/='' " disable highlighted search on insert mode
au InsertLeave * :let @/='' " enable it back
au GUIEnter * set vb t_vb=  " enforces no visual bell for GUI

" Open QuickFix horizontally with line wrap and not avoiding long lines
au FileType qf wincmd J | setlocal wrap textwidth=0

" Preview window with line wrap and not avoiding long lines
au WinEnter * if &previewwindow | setlocal wrap textwidth=0 | endif

set wildignore+=CMakeFiles  " add ignored extension
set wildignore+=*.pyc       " add ignored extension
" }}}

" GUI Settings {{{
if has('gui_running')
    " Set default GUI font
    set guifont=monofur\ for\ Powerline:h15

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
hi! link Conceal Normal
" }}}

" Airline Setup {{{
let g:airline_theme = 'wombat'
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
let g:racer_cmd = "/opt/src/racer/target/release/racer"
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
nnoremap <leader>h :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>e :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
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
" }}}

" VimShell Setup {{{
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
" }}}

" NERDTree Setup {{{

let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.egg-info$', '\.DS_Store$', '^Session\.vim']
let NERDTreeShowBookmarks=1
let NERDTreeHightlightCursorline=1

" Map NERDTreeToggle to convenient key
nnoremap <silent> <c-n> :NERDTreeToggle<cr>

" Prevent :bd inside NERDTree buffer
au FileType nerdtree cnoreabbrev <buffer> bd <nop>
au FileType nerdtree cnoreabbrev <buffer> BD <nop>

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
            \ "AlwaysBreakTemplateDeclarations": "true",
            \ "DerivePointerBinding": "false",
            \ "PointerBindsToType": "false",
            \ "ColumnLimit": 80,
            \ "TabWidth": 4,
            \ "Standard": "C++11" }
au FileType c,cpp,objc,objcpp noremap  <silent> <buffer> <leader>f :ClangFormat<cr>
au FileType c,cpp,objc,objcpp noremap! <silent> <buffer> <leader>f <c-o>:ClangFormat<cr>
" }}}

" Jedi Setup {{{
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
" }}}

" vim-notes Setup {{{
let g:notes_directories = ['~/Google Drive/Notes']
" }}}

" ZoomWin Setup {{{
nnoremap <leader>z :ZoomWin<CR>
" }}}

" GuessIndent Setup {{{
au BufReadPost * :GuessIndent
" }}}

" LongLine Setup {{{
let g:longline_autohl = 1
let g:longline_matchgroup = 'Visual'
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

" vim-operator-highlight Setup {{{
"let g:ophigh_highlight_link_group = 'Keyword'
let g:ophigh_filetypes_to_ignore = { "haskell": 1, "javascript": 1, "python": 1 }
" }}}

" tern_for_vim Setup {{{
let g:tern_show_signature_in_pum = 1
let g:tern_show_argument_hints = 'on_move'
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
let g:gist_clip_command = 'pbcopy'
command! -range=% Blocks
            \ <line1>,<line2>Format format | f index.html | exe 'Gist -a' | bd!                                       |
            \ let @+ = 'http://bl.ocks.org/anonymous/raw/' . matchstr(@+, 'https://gist.github.com/\zs\w\+\ze') . '/' |
            \ let @+ = bitly#shorten(@+).url | redraw | echomsg 'Done: ' . @+ | setlocal nomodified
" }}}
