" $HOME/.vimrc

" make backspace useful
set backspace=indent,eol,start 

" mouse
if has("mouse")
	set mouse=a
	set mousehide
	set mousemodel=popup
endif

" tabs and indents
set noexpandtab	" tabs are not spaces
set softtabstop=4	" two edit spaces
set shiftwidth=4	" a mix of tabs and spaces
set autoindent	" copy indentation from one line to the next

" backups and swap
set nobackup
set nowritebackup
set noswapfile

" visual
set splitright
set splitbelow

" colors
if &t_Co > 2 || has("gui_running")
	" syntax highlighting
	syntax enable
	" 256 colors
	set t_Co=256
	" background
	set background=light
	try
		colorscheme delek 
	catch
	endtry
endif

" statusline
set laststatus=2

set statusline=
set statusline+=\ %h{getcwd()}%r\
set statusline+=\ %{hostname()}\
set statusline+=%f\ %r%m%h\ %Y\ %L\
set statusline+=%=
set statusline+=\ [%l,%c]
set statusline+=\ \ [%{strftime(\"[%y/%m/%d\ %T]\",getftime(expand(\"%:p\")))}
set statusline+=

