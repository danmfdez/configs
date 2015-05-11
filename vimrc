" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" FEATURES
" Enable syntax highlighting
syntax on
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
"filetype plugin indent on
" Set 'nocompatible' to ward off unexpected things that your distro might
" " have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
"""

" MUST HAVE
" Better command-line completion
 set wildmode=longest,list ",full
 set wildmenu
" Highlight searches (use <C-L> to temporarily turn off highlighting; see
" the mapping of <C-L> below)
set hlsearch
"""

" USABILITY
set background=dark
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" Allow backspacing over autoindent, line breaks and start of insert action
"set backspace=indent,eol,start
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on.
"set autoindent
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
"set confirm
" Use visual bell instead of beeping when doing something wrong
"set visualbell
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
"set t_vb=
" Disable beep and flash
"set noeb vb t_vb=
" Display line numbers on the left
"set number
"""

if has('cmdline_info')
	" Show the ruler
	set ruler
	" Show char/line number in visual mode
	set showcmd
endif

" INDENTATION 
" " Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
" use indents of 4 spaces
set shiftwidth=4
" let backspace delete indent
set softtabstop=4
" tabs are spaces, not tabs
set expandtab
" round indent to the nearest multiple of shiftwidth
" set shiftround

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
" use indents of 4 spaces
"set shiftwidth=4
" an indentation every four columns
"set tabstop=4
" round indent to the nearest multiple of shiftwidth
"set shiftround
" Display the cursor position on the last line of the screen or in the status
" line of a window
"set ruler
"""

" MAPPING
" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null
" Para compilar ficheros directamente con “:make” añadimos:
set makeprg=gcc\ -Wall\ -o\ %:r\ %
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
" <F2> key is now programmed to displayed line numbers when you select it.  
" <F3> key performs the opposite function.
set showmode
"map #1 :!more /etc/vim/vi_help
map #2 :set number
map #3 :set nonumber

" OTHERS
" Ignore blanks in vimdiff
set diffopt+=iwhite



if has('cmdline_info')
    " Show the ruler
    set ruler
    " Show char/line number in visual mode
    set showcmd
endif
    
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

