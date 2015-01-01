syntax on
filetype plugin indent on

colorscheme putty

set t_Co=256
set number
set hlsearch
set autoindent
set tabstop=4
set ignorecase
set nobackup
set tags=tags;
set autochdir

"*** vim-Bbye ***"
map bd : Bd <CR>
"*** winmanager ***"
map <F2> : FirstExplorerWindow <CR>
map <F3> : BottomExplorerWindow <CR>
"*** NerdTree ***"
map <F4> : Bookmark <CR>
map <F5> : let NERDTreeBookmarksFile='./.NERDTreeBookmarks_'
map <F6> : ReadBookmarks <CR> 
"*** buffer ***"
map <F7> : bp<CR>
map <F8> : bn<CR> 
"*** vim ***"
map <F9> : wqa <CR>
map <F10> : qa <CR>
map <C-l> : set hlsearch! <CR>
map <C-n> : set number!<CR>
"*** ctags ***"
map <C-F12> :!ctags -R -h ".cc.c.cpp.h" . <CR>

"*** cscope ***"
"*** Pathogen configuration ***"

execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

"*** vim-airline configuration ***"

set laststatus=2
let g:airline_powerline_fonts =1 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#enabled = 0 
let g:airline#extensions#default#section_truncate_width = {
	\ 'warning' : 0}
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"*** NERD Tree configuration ***"

let NERDTreeWinPos="left"
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=0

"*** Taglist configuration ***"

let Tlist_Show_One_File=1  
let Tlist_Use_Right_Window = 1 
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1 

"*** winmanager configuration ***"

let g:NERDTree_title="[NERDTree]" 

function! NERDTree_Start()
	exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction

map wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>
let g:winManagerWidth=30 
let g:winManagerWindowLayout='NERDTree|TagList'
let g:persistentBehaviour=0
