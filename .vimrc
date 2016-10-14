syntax enable
"set background=dark
"let g:solarized_termcolors=16
"colorscheme solarized
filetype plugin indent on
set ruler
set ignorecase
set smartcase
set splitright




set tabstop=4 "tabs appear as four spaces
set shiftwidth=4
set softtabstop=4 "The number of spaces a tab counts for when editing
set expandtab "tabs are spaces

set number "show line numbers
set showcmd "show the command at the bottom
set cursorline "the cursor line now has a highlight
set wildmenu "visual autocomplete for command menu
set showmatch "show the matching {}[]()
set incsearch "search as characters are entered
set hlsearch "hilight searches

"airline
"set list          " Display unprintable characters f12 - switches
"set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

let mapleader="," "is the same as ols esc shortcut?
nnoremap <leader><space> :nohlsearch<CR>

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

if has("autocmd") "for make files tab carppiness
    filetype plugin indent on
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

execute pathogen#infect()
