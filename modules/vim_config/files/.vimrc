" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------
syntax on
set hidden
set nocompatible                      " essential
set history=10000                     " lots of command line history
set cf                                " error files / jumping
set ffs=unix,dos,mac                  " support these files
set isk+=_,$,@,%,#,-                  " none word dividers
set viminfo='1000,f1,:100,@100,/20
set modeline                          " make sure modeline support is enabled
set autoread                          " reload files (no local changes only)
set tabpagemax=50                     " open 50 tabs max

" ----------------------------------------------------------------------------
"  Backups
" ----------------------------------------------------------------------------
set nobackup                           " do not keep backups after close
set nowritebackup                      " do not keep a backup while working
set noswapfile                         " don't keep swp files either
set backupdir=$HOME/.vim/backup        " store backups under ~/.vim/backup
set backupcopy=yes                     " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,.      " keep swp files under ~/.vim/swap

" ----------------------------------------------------------------------------
" Keep undo history across sessions, by storing in file.
" ----------------------------------------------------------------------------
set undodir=~/.vim/backups
set undofile

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------
set ruler                  " show the cursor position all the time
set noshowcmd              " don't display incomplete commands
set nolazyredraw           " turn off lazy redraw
set number                 " line numbers
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
set ch=2                   " command line height
set backspace=2            " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOA     " shorten messages
set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling

" ----------------------------------------------------------------------------
" Visual Cues
" ----------------------------------------------------------------------------
set showmatch              " brackets/braces that is
set mat=10                 " duration to show matching brace (1/5 sec)
set incsearch              " do incremental searching
set laststatus=2           " always show the status line
set ignorecase             " ignore case when searching
set visualbell             " shut the fuck up
set list listchars=tab:\ \ ,trail:·

" ----------------------------------------------------------------------------
" Text Formatting
" ----------------------------------------------------------------------------
" set autoindent             " automatic indent new lines
" set smartindent            " be smart about it
set nowrap                 " do not wrap lines
set softtabstop=4          " yep, two
set shiftwidth=4           " ..
set tabstop=4
set expandtab              " expand tabs to spaces
set nosmarttab             " fuck tabs
" set formatoptions+=n       " support for numbered/bullet lists
" set textwidth=80           " wrap at 80 chars by default
" set virtualedit=block      " allow virtual edit in visual block ..
set linebreak               " don't wrap textin the middle of a word

" don't outdent hashes
inoremap # #

" It's not like :W is bound to anything anyway
command! W :w

" ---------------------------------------------------------------------------
"  Strip all trailing whitespace in file
" ---------------------------------------------------------------------------
function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map ,s :call StripWhitespace ()<CR>

function! SplitScroll ()
    :wincmd v
    :wincmd w
    execute "normal! \<C-d>"
    :set scrollbind
    :wincmd w
    :set scrollbind
endfu
nmap <leader>sb :call SplitScroll()<CR>

" sudo write this
cmap W! w !sudo tee % >/dev/null

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
