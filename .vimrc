"===========================================================================
" Automatically set paste mode in Vim when pasting in insert mode
" Suppot Tmux
" Reference:
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif
  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"
  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction
let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" ==========================================================================
" Vundle initialization
" Avoid modify this section, unless you are very sure of what you are doing

" no vi-compatible
set nocompatible

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" ==========================================================================
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/winmanager'
Bundle 'moll/vim-bbye'
Bundle 'putty'

Bundle 'airblade/vim-gitgutter'

Bundle 'tpope/vim-fugitive'
" Gblame -> git blame↵
" ctrl w w -> change screen
Bundle 'junegunn/gv.vim'
" GV -> git log --graph
" o-> open
" zc-> fold diff
" zn-> unfold diff

" ==========================================================================
" Install plugins the first time vim runs

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" ==========================================================================

colorscheme putty

syntax on

set t_Co=256
set number
set hlsearch
set autoindent
set tabstop=4
set ignorecase
set nobackup
set tags=tags;
set autochdir
set mouse=a
set listchars=eol:↵,tab:»·,trail:∎,extends:»,precedes:«
set list

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
map <C-h> : set hlsearch! <CR>
map <C-l> : set list! <CR>
map <C-n> : set number!<CR>
"*** ctags ***"
map <C-F12> :!ctags -R -h ".cc.c.cpp.h" . <CR>

"*** cscope ***"
"==========================================================================
"Plugin setting

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
