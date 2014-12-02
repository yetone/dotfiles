" General Settings {{{
set regexpengine=1             " set old regexp engine
set noswapfile                 " No swap files
set hidden                     " hide buffer without notice
set hlsearch                   " highlight the last searched term
set virtualedit=all            " let us walk in limbo
set cpoptions+=$               " dollar sign while changing
set foldmethod=marker          " folds on marks
set nowrap                     " don't wrap lines
set clipboard=unnamed          " for simplified clipboard copy/paste
set noshowmode                 " hide the default mode text (e.g. -- INSERT -- below the statusline)
set mouse=a                    " enable mouse to get scrolling
set vb t_vb=                   " No visual bell
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 " space for tabs by default

set wildignore+=CMakeFiles     " add ignored extension
set wildignore+=*.pyc          " add ignored extension

au InsertEnter * :let @/=''    " Disable highlighted search on insert mode
au InsertLeave * :let @/=''    " Enable it back
au GUIEnter * set vb t_vb=     " Enforces no visual bell for GUI
" }}}

" VIM-PLUG Setup {{{

" Automatic installation {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}

call plug#begin('~/.vim/plugged')

" Plugins {{{
Plug 'git://gitorious.org/vim-for-qt-kde/vim-qmake.git'
Plug 'biskark/vim-ultimate-colorscheme-utility'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Valloric/vim-operator-highlight'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'Twinside/vim-haskellConceal'
Plug 'guns/xterm-color-table.vim'
Plug 'leafgarland/typescript-vim'
Plug 'zerowidth/vim-copy-as-rtf'
Plug 'idris-hackers/idris-vim'
Plug 'flazz/vim-colorschemes'
Plug 'rhysd/vim-clang-format'
Plug 'oblitum/YouCompleteMe', { 'branch': 'clang_complete-params' }
Plug 'embear/vim-localvimrc'
Plug 'vim-pandoc/vim-pandoc'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'marijnh/tern_for_vim'
Plug 'edkolev/tmuxline.vim'
Plug 'scrooloose/nerdtree'
Plug 'tikhomirov/vim-glsl'
Plug 'Shougo/vimshell.vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'raichoo/haskell-vim'
Plug 'tpope/vim-obsession'
Plug 'thinca/vim-quickrun'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'godlygeek/tabular'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-abolish'
Plug 'peterhoeg/vim-qml'
"Plug 'gilligan/vim-lldb'
Plug 'bling/vim-airline'
Plug 'rizzatti/dash.vim'
"Plug 'jeaye/color_coded'
Plug 'oblitum/formatvim'
Plug 'tpope/vim-eunuch'
Plug 'SirVer/ultisnips'
Plug 'ujihisa/neco-ghc'
Plug 'mattn/webapi-vim'
Plug 'mileszs/ack.vim'
Plug 'oblitum/bufkill'
Plug 'morhetz/gruvbox'
Plug 'vim-jp/cpp-vim'
Plug 'wting/rust.vim'
Plug 'tpope/vim-haml'
Plug 'fidian/hexmode'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'mattn/gist-vim'
Plug 'oblitum/frawor'
Plug 'fatih/vim-go'
Plug 'dahu/vimple'
Plug 'dag/vim2hs'
" }}}

call plug#end()

" }}}

" Limit popup menu height {{{
set pumheight=30
" }}}

" Open QuickFix horizontally {{{
au FileType qf wincmd J
" }}}

" GUI Settings {{{
if has('gui_running')
    " Set default GUI font
    set guifont=monofur\ for\ Powerline:h17

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
hi! link Conceal Normal
set bg=dark
let g:gruvbox_invert_selection=0
colors gruvbox
"colors peaksea
"colors hemisu
"colors wombat256mod
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

" format.vim Setup {{{
let g:format_HTMLAdditionalCSS = 'body { font-size:10pt; -webkit-font-smoothing: antialiased; }'
" }}}

" vim-airline Setup {{{
"let g:airline_theme = 'sol'
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
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
exec 'hi! SyntasticErrorSign guifg=red ctermfg=red ' . s:getbg('SyntasticErrorLine')
exec 'hi! SyntasticWarningSign guifg=yellow ctermfg=yellow ' . s:getbg('SyntasticWarningLine')
exec 'hi! SyntasticError ' . s:getbg('SyntasticErrorLine')
exec 'hi! SyntasticWarning ' . s:getbg('SyntasticWarningLine')
" }}}

" delimitMate Setup {{{
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_quotes = "\" '"
" }}}

" YouCompleteMe Setup {{{
set completeopt-=preview " I really don't want preview window for this fork
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers = {'haskell' : ['.']}
nnoremap <leader>h :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>i :YcmCompleter GoToDefinition<CR>
" }}}

" Ultisnips Setup {{{
let g:UltiSnipsExpandTrigger = '<c-a>'
" }}}

" When editing a file, always jump to the last cursor position {{{
au BufReadPost *
            \ if ! exists("g:leave_my_cursor_position_alone")   |
            \   if line("'\"") > 0 && line ("'\"") <= line("$") |
            \     exe "normal g'\""                             |
            \   endif                                           |
            \ endif
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
let g:racer_cmd = "/opt/src/racer/bin/racer"
" }}}

" QuickRun Setup {{{
let b:quickrun_config = { 'outputter/buffer/close_on_empty': 1 }
let g:quickrun_config = {
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

" Toggle Shell Pasting {{{
nnoremap <F2> :set invpaste paste?<cr>
set pastetoggle=<F2>
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
nnoremap <silent> <space> :CtrlPBuffer<cr>
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

" ClangFormat Setup {{{
let g:clang_format#style_options = {
            \ "AccessModifierOffset": -4,
            \ "AllowShortLoopsOnASingleLine": "false",
            \ "AllowShortBlocksOnASingleLine" : "false",
            \ "AllowShortFunctionsOnASingleLine": "None",
            \ "AllowShortIfStatementsOnASingleLine": "false",
            \ "AlwaysBreakTemplateDeclarations": "true",
            \ "DerivePointerBinding": "false",
            \ "PointerBindsToType": "false",
            \ "BinPackParameters" : "false",
            \ "ColumnLimit": 80,
            \ "TabWidth": 4,
            \ "Standard": "C++11" }
let g:clang_format#auto_format = 1
au FileType c,cpp,objc,objcpp noremap  <silent> <buffer> <leader>f :ClangFormat<cr>
au FileType c,cpp,objc,objcpp noremap! <silent> <buffer> <leader>f <c-o>:ClangFormat<cr>
" }}}

" Edit command output in a buffer {{{
command! -nargs=+ BufOut redir => bufout | silent <args> | redir END | new | call append(0, split(bufout, '\n'))
" }}}

" :Me[ssages] as shorthand for `:BufOut :messages' (the dominant use case of :BufOut) {{{
command! -nargs=0 Messages :redir => bufout | silent :messages | redir END | new | call append(0, split(bufout, '\n'))
" }}}

" Gist it to bl.ocks.org {{{
let g:gist_clip_command = 'pbcopy'
"let g:gist_clip_command = 'xclip -selection clipboard'
command! -range=% Blocks
            \ <line1>,<line2>Format format | f index.html | exe 'Gist -a' | bd!                                       |
            \ let @+ = 'http://bl.ocks.org/anonymous/raw/' . matchstr(@+, 'https://gist.github.com/\zs\w\+\ze') . '/' |
            \ redraw | echomsg 'Done: ' . @+ | setlocal nomodified
" }}}

" Highlight text after column 80 {{{
exec 'hi! OverLength ' . s:getbg('Visual')
match OverLength /\%81v.\+/
" }}}
