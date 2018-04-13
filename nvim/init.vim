" This must be first, because it changes other options as a side effect.
set nocompatible

" Try to initialize plug.vim plugin
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif


" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'itchyny/landscape.vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'taohex/lightline-buffer'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'shougo/denite.nvim'
Plug 'neomake/neomake'
" PHP related
Plug 'c9s/phpunit.vim'
Plug 'StanAngeloff/php.vim'

" Initialize plugin system
call plug#end()

" ************************************************
" Basic settings
" ************************************************
syntax on 		" Turn on syntax highlighting

" make nvim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

set encoding=utf-8
set fileencoding=utf-8

set fileformat=unix
set fileformats=unix,dos,mac

set laststatus=2

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*~
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep


"" Directories for swp files
set nobackup
set noswapfile

set hidden
set showtabline=2

"set showcmd             " Show (partial) command in status line.
"set showmatch           " Show matching brackets.
set noshowmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
"set formatoptions+=o    " Continue comment marker in new lines.
"set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.
set softtabstop=4

"set modeline            " Enable modeline.
"set esckeys             " Cursor keys in insert mode.
"set linespace=0         " Set line-spacing to minimum.
"set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
"set splitbelow          " Horizontal split below current.
"set splitright          " Vertical split to right of current.

"if !&scrolloff
"  set scrolloff=3       " Show next 3 lines while scrolling.
"endif
"if !&sidescrolloff
"  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
"endif
"set nostartofline       " Do not jump to first character with page commands.

set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=green guibg=green
"match ExtraWhitespace /\s\+$\|\t/



" ************************
" Visual settings
" ************************
set ruler
set number

" Set color scheme
if &t_Co >= 256 || has("gui_running")
    colorscheme gruvbox
    "colorscheme landscape
    set background=dark
endif

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

"" gruvbox color settings
let g:gruvbox_contrast_dark = 'hard'

""" vim-airline
"" smarter tab line
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_theme='wombat'
"let g:airline_powerline_fonts = 1
""let g:airline_right_alt_sep = '<<'
""let g:airline_right_sep = '<'
""let g:airline_left_alt_sep= '>>'
""let g:airline_left_sep = '>'
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"
"" fine-tuned configuration
""function! s:AirlineInit()
""  let g:airline_section_a = airline#section#create(['mode',' ','branch'])
""  let g:airline_section_b = airline#section#create_left([' ',' ','%f'])
""  let g:airline_section_c = airline#section#create(['ffenc'])
""  let g:airline_section_x = airline#section#create(['%p%%'])
""  let g:airline_section_y = airline#section#create(['%B'])
""  let g:airline_section_z = airline#section#create_right(['windowswap','linenr', ':%3v'])
""endfunction
""au VimEnter * call s:AirlineInit()

" NeoMake configuration
autocmd! BufReadPost,BufWritePost * Neomake
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
"let g:NERDTreeShowBookmarks=1
"let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <C-n> :NERDTreeToggle<CR>
"au VimEnter * NERDTree

" use lightline-buffer in lightline
let g:lightline = {
	\ 'tabline': {
		\ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
		\ 'right': [ [ 'close' ], ],
		\ },
	\ 'component_expand': {
		\ 'buffercurrent': 'lightline#buffer#buffercurrent2',
		\ },
	\ 'component_type': {
		\ 'buffercurrent': 'tabsel',
		\ },
	\ 'component_function': {
		\ 'bufferbefore': 'lightline#buffer#bufferbefore',
		\ 'bufferafter': 'lightline#buffer#bufferafter',
		\ 'bufferinfo': 'lightline#buffer#bufferinfo',
		\ },
	\ }

" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = '? '
let g:lightline_buffer_readonly_icon = '?'
let g:lightline_buffer_modified_icon = '?'
let g:lightline_buffer_git_icon = '? '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '? '
let g:lightline_buffer_expand_right_icon = ' ?'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = ' '

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20
