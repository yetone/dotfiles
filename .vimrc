" General Settings {{{
set nocompatible               " We're running Vim, not Vi!
set regexpengine=1             " set old regexp engine
set noswapfile                 " No swap files
set autoindent                 " auto indenting
set autoread                   " auto read external file changes
set history=100                " keep 100 lines of history
set ruler                      " show the cursor position
set hidden                     " hide buffer without notice
set hlsearch                   " highlight the last searched term
set virtualedit=all            " let us walk in limbo
set showcmd                    " show number of lines selected
set cpoptions+=$               " dollar sign while changing
set foldmethod=marker          " folds on marks
set nowrap                     " don't wrap lines
set clipboard=unnamed          " for simplified clipboard copy/paste"
set backspace=indent,eol,start " no constraints for backspace
set laststatus=2               " always display the statusline in all windows
set noshowmode                 " hide the default mode text (e.g. -- INSERT -- below the statusline)
set sessionoptions=blank,buffers,curdir,help,tabpages,winsize  " discards plugin stuff on saving session

set wildignore+=CMakeFiles     " add ignored extension
set wildignore+=*.pyc          " add ignored extension

syntax on                      " syntax highlighting
filetype plugin indent on      " use the file type plugins
au InsertEnter * :let @/=''    " Disable highlighted search on insert mode
au InsertLeave * :let @/=''    " Enable it back
au GUIEnter * set vb t_vb=     " No GUI visual bell
au VimEnter * set vb t_vb=     " No CLI visual bell
au FileType * set expandtab tabstop=4 shiftwidth=4 softtabstop=4
" }}}

" VIM Addon Manager Setup {{{

set runtimepath+=~/.vim/addons/vim-addon-manager
call vam#ActivateAddons([])
ActivateAddons git:git://gitorious.org/vim-for-qt-kde/vim-qmake.git
ActivateAddons github:biskark/vim-ultimate-colorscheme-utility
ActivateAddons hg:http://hg.code.sf.net/p/formatvim/code
ActivateAddons github:octol/vim-cpp-enhanced-highlight
ActivateAddons github:pbrisbin/vim-syntax-shakespeare
ActivateAddons hg:https://bitbucket.org/ZyX_I/frawor
ActivateAddons github:Twinside/vim-haskellConceal
ActivateAddons github:guns/xterm-color-table.vim
ActivateAddons github:idris-hackers/idris-vim
ActivateAddons github:flazz/vim-colorschemes
ActivateAddons github:rhysd/vim-clang-format
ActivateAddons github:oblitum/YouCompleteMe
ActivateAddons github:embear/vim-localvimrc
ActivateAddons github:Raimondi/delimitMate
ActivateAddons github:scrooloose/syntastic
ActivateAddons github:xuhdev/SingleCompile
ActivateAddons github:marijnh/tern_for_vim
ActivateAddons github:scrooloose/nerdtree
ActivateAddons github:tikhomirov/vim-glsl
ActivateAddons github:Shougo/vimshell.vim
ActivateAddons github:eagletmt/ghcmod-vim
ActivateAddons github:raichoo/haskell-vim
ActivateAddons github:tpope/vim-obsession
ActivateAddons github:honza/vim-snippets
ActivateAddons github:tpope/vim-markdown
ActivateAddons github:tpope/vim-fugitive
ActivateAddons github:godlygeek/tabular
ActivateAddons github:vim-ruby/vim-ruby
ActivateAddons github:tpope/vim-abolish
ActivateAddons github:peterhoeg/vim-qml
"ActivateAddons github:gilligan/vim-lldb
ActivateAddons github:bling/vim-airline
ActivateAddons github:tpope/vim-eunuch
ActivateAddons github:SirVer/ultisnips
ActivateAddons github:ujihisa/neco-ghc
ActivateAddons github:mattn/webapi-vim
ActivateAddons github:mileszs/ack.vim
ActivateAddons github:oblitum/rainbow
ActivateAddons github:oblitum/bufkill
ActivateAddons github:morhetz/gruvbox
ActivateAddons github:vim-jp/cpp-vim
ActivateAddons github:wting/rust.vim
ActivateAddons github:tpope/vim-haml
ActivateAddons github:fidian/hexmode
ActivateAddons github:kien/ctrlp.vim
ActivateAddons github:Shougo/vimproc
ActivateAddons github:mattn/gist-vim
ActivateAddons github:tomasr/molokai
ActivateAddons github:fatih/vim-go
ActivateAddons github:dahu/vimple
ActivateAddons github:dag/vim2hs

" }}}

" virtualenv Setup {{{
"au GUIEnter * exec 'VirtualEnvActivate default'
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
    set guifont=Droid\ Sans\ Mono\ for\ Powerline:h13

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
set bg=dark
let g:gruvbox_invert_selection=0
"colors peaksea
colors gruvbox
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
"let g:format_HTMLAdditionalCSS = '@import url(http://fonts.googleapis.com/css?family=Droid+Sans+Mono);' .
"            \' body { font-family: "Droid Sans Mono"; font-size:10pt; -webkit-font-smoothing: antialiased; }'
let g:format_HTMLAdditionalCSS = 'body { font-size:10pt; -webkit-font-smoothing: antialiased; }'
" }}}

" vim-airline Setup {{{
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'sol'
let g:airline_theme = 'base16'
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

" Rainbow Colors Improved Setup {{{
let g:rainbow_ctermfgs = ['10', '3', '13', '6', '15']
au FileType c,cpp,objc,objcpp,go,rust,python,ruby,javascript,java,vim call rainbow#load()
au FileType clojure call rainbow#load( [['(', ')'], ['\[', '\]'], ['{', '}']], '"[-+*/=><%^&$#@!~|:?\\]"')
" }}}

" delimitMate Setup {{{
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_quotes = "\" '"
" }}}

" YouCompleteMe Setup {{{
set ttimeoutlen=50 " for faster InsertLeave triggering
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
let g:go_fmt_autosave = 0
au FileType go set noexpandtab

" Haskell
let g:hpaste_author = 'Francisco Lopes'
let g:syntastic_haskell_ghc_mod_args = '-g-fno-warn-type-defaults'
" }}}

" SingleCompile Setup {{{
call SingleCompile#SetCompilerTemplate('c',
            \'clang',
            \'the Clang C and Objective-C compiler',
            \'clang',
            \'-o $(FILE_TITLE)$ -g -O0',
            \'./$(FILE_TITLE)$')

call SingleCompile#ChooseCompiler('c', 'clang')

call SingleCompile#SetCompilerTemplate('cpp',
            \'clang',
            \'the Clang C and Objective-C compiler',
            \'clang++',
            \'-o $(FILE_TITLE)$ -g -O0 -std=c++1y -stdlib=libc++ -lpthread',
            \'./$(FILE_TITLE)$')

call SingleCompile#ChooseCompiler('cpp', 'clang')

call SingleCompile#ChooseCompiler('javascript', 'node.js')

noremap  <silent> <F8> :SCCompile<cr>
noremap  <silent> <F9> :SCCompileRun<cr>
noremap! <silent> <F8> <c-o>:SCCompile<cr>
noremap! <silent> <F9> <c-o>:SCCompileRun<cr>
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
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "DerivePointerBinding" : "false",
            \ "PointerBindsToType" : "false",
            \ "Standard" : "C++11" }
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

hi! link Conceal Normal
