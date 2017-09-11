
set tabstop=4 "tabs appear as four spaces
set shiftwidth=4
set softtabstop=4 "The number of spaces a tab counts for when editing
set expandtab "tabs are spaces


if has("autocmd") "for make files that require tab
    filetype plugin indent on
    autocmd!
    autocmd FileType make setlocal tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
    autocmd FileType gitconfig setlocal tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
    autocmd FileType fortran setlocal tabstop=6 shiftwidth=6 expandtab softtabstop=6
    autocmd FileType bash setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd FileType sh setlocal expandtab shiftwidth=2 softtabstop=2
endif

syntax enable
"set background=dark
"let g:solarized_termcolors=16
"colorscheme solarized
filetype plugin indent on
set ruler
set ignorecase
set smartcase
set splitright "default virtual split
colo default

set tabpagemax=100 " Open up to 100 tabs

set hidden " Better buffer browsing

set spell "spellcheck

set number "show line numbers
set showcmd "show the command at the bottom
set cursorline "the cursor line now has a highlight
set wildmenu "visual autocomplete for command menu
set showmatch "show the matching {}[]()
set incsearch "search as characters are entered
set hlsearch "hilight searches
set noshowmode "don't show -- INSERT -- at bottom of screen

set tags=./tags;,tags;,./.tags;,.tags;

"change cursorline from underline to highlight
"hi Cursorline cterm=NONE ctermbg=darkred ctermfg=white

"airline
"set list          " Display unprintable characters f12 - switches
"set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
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

" Buffer cycling
map <C-K> :bnext<CR>
map <C-J> :bprev<CR>

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




