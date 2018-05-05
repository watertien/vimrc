filetype indent plugin on
syntax on 

set showcmd

set hlsearch

set ignorecase 
set smartcase
set incsearch
set showmatch

set autoindent

set laststatus=2

set confirm

set noerrorbells
set novisualbell

set mouse=a

set cmdheight=2

set foldcolumn=1

set number

" -------------------------------------------
" ------------indent settings----------------
set shiftwidth=4
set softtabstop=4
set expandtab


"---------------------COLOR------------------

if $COLORTERM == "gnome-terminal"
	set t_Co=256
endif

try 
	colorscheme desert
catch
endtry

set background=dark

" --------------------encoding----------------
set encoding=utf8

set ffs=unix,dos,mac


" C
au BufRead,BufNewFile *.c,*.h set expandtab
au BufRead,BufNewFile *.c,*.h set tabstop=4
au BufRead,BufNewFile *.c,*.h set shiftwidth=4
au BufRead,BufNewFile *.c,*.h set autoindent
au         BufNewFile *.c,*.h set fileformat=unix
au         BufNewFile *.c     call Template("c")
au BufRead,BufNewFile *.c,*.h let b:comment_leader = '/* '
map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>




" Python, PEP-008
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw set textwidth=139
au BufRead,BufNewFile *.py,*.pyw set tabstop=4
au BufRead,BufNewFile *.py,*.pyw set softtabstop=4
au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set autoindent
au         BufNewFile *.py       call Template("python")
au BufRead,BufNewFile *.py,*.pyw let b:comment_leader = '#'

" HTML
au BufRead,BufNewFile *.html set filetype=xml
au BufRead,BufNewFile *.html set expandtab
au BufRead,BufNewFile *.html set tabstop=4
au BufRead,BufNewFile *.html set softtabstop=4
au BufRead,BufNewFile *.html set shiftwidth=4
au BufRead,BufNewFile *.html set autoindent
au         BufNewFile *.html set fileformat=unix
au BufRead,BufNewFile *.html let b:comment_leader = '<!--'



" Template Function definition
function! Template(language)
    let choice = a:language
    if choice == "c"
        0r~/Projects/template_C.txt 
    endif

    if choice == "python"
        0r~/Projects/template_python.txt
    endif
endfunction


nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
