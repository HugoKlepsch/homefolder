" DEFAULT TAB BEHAVIOUR {{{

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=4

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4

"The number of spaces a tab counts for when editing
set softtabstop=4
" }}}

if has("autocmd") "for make files that require tab
    filetype plugin indent on
    autocmd!
    autocmd FileType make setlocal tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
    autocmd FileType gitconfig setlocal tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
    autocmd FileType fortran setlocal tabstop=6 shiftwidth=6 expandtab softtabstop=6
    autocmd FileType bash setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd FileType sh setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd FileType vue setlocal autoindent shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType vue syntax sync fromstart

    " auto folding
    " Toggles fold rememberance emulation
    autocmd BufRead * setlocal foldmethod=marker
    autocmd BufRead * normal zM
endif

" Settings {{{
"
" Switch syntax highlighting on, when the terminal has colors
syntax enable

" Use vim, not vi api
set nocompatible

" Command history
set history=100

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden

" Turn word wrap on
set wrap

" Break lines on word boundaries
set linebreak

" Don't indent broken lines
set nobreakindent

" Mark broken lines with "> "
let &showbreak = '~~~> '

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start


" Turn on line numbers
set number

" Highlight tailing whitespace
" See issue: https://github.com/Integralist/ProVim/issues/4
set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" Hide the toolbar
set guioptions-=T

" UTF encoding
set encoding=utf-8

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline

" Auto load local vimrcs
set exrc

" Ensure Vim doesn't flash at you every time you make a mistype
" Beeping is ok
set novisualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" Set built-in file system explorer to use layout similar to the NERDTree plugin
let g:netrw_liststyle=3

" vue scss
let g:vue_disable_pre_processors=1

" Always highlight column 80 so it's easier to see where
" cutoff appears on longer screens
" autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
" set colorcolumn=80
" }}}

"set background=dark
"let g:solarized_termcolors=16
"colorscheme solarized
filetype plugin indent on
colo default

" Change misspell and search highlight colors
hi SpellBad cterm=bold ctermfg=0 ctermbg=255 gui=undercurl guisp=Red
hi Search ctermfg=0 ctermbg=130

set tabpagemax=100 " Open up to 100 tabs

set spell "spellcheck

set noshowmode "don't show -- INSERT -- at bottom of screen

set tags=./tags;,tags;,./.tags;,.tags;

"airline
"set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
let g:airline#extensions#tabline#enabled = 1
"set guifont=Liberation\ Mono\ for\ Powerline\ 10
"set guifont=Liberation\ Mono\ 10
"let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}

" unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
endif

let mapleader="," "is the same as ols esc shortcut?
nnoremap <leader><space> :nohlsearch<CR>

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" list buffers and get ready to go
nnoremap <Leader>b :ls<CR>:b<Space>

" tab cycling
map <C-K> :tabn<CR>
map <C-J> :tabp<CR>
" map <C-K> :bnext<CR>
" map <C-J> :bprev<CR>

" For finding git merge tags
nnoremap <leader>r /\(<<<\+\)\\|\(>>>\+\)\\|\(====\+\)

" For spellcheck toggle
" Toggle spellchecking
function! ToggleSpellCheck()
    set spell!
    if &spell
        echo "Spellcheck ON"
    else
        echo "Spellcheck OFF"
    endif
endfunction

nnoremap <silent> <Leader>s :call ToggleSpellCheck()<CR>

let g:hexmode_tog = 0
function! ToggleHexMode()
    if g:hexmode_tog
        %!xxd -r
        let g:hexmode_tog = 0
    else
        %!xxd
        let g:hexmode_tog = 1
    endif
endfunction

" go hex mode
nnoremap <silent> <Leader>h :call ToggleHexMode()<CR>

execute pathogen#infect()

fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
    w
endfun
:noremap <Leader>w :call TrimWhitespace()<CR>




