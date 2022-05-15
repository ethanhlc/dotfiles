""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My vimrc file
"
" Created using various online sources
"
" Creator: Ethan
" Date: 2022.01.12
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Set the commands to save in history.
set history=500

" Configure backspace so it acts as it should act
set backspace=indent,eol,start

" Enable filetype detection, plugins, indent files
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread
" au FocusGained,BufEnter * checktime

" don't keep backup file (files end in ~)
set nobackup


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface & Behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" add dracula
"packadd! dracula

" Enable Dracula color scheme
"colorscheme dracula

" Turn syntax highlighting on.
syntax enable

" Always show current position
set ruler

" Add numbers to each line on the left-hand side.
set number

" Set listchars
set listchars=trail:·

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn

" Do not let cursor scroll below or above N number of lines.
set scrolloff=10

" Wrap lines
set wrap

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Jump to matching brackets when typing
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" Enable auto completion on commands
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" No error sounds.
set noerrorbells

" Enable mouse if available.
if has('mouse')
    set mouse=a
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, Tab, Indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs.
set expandtab

" Set tab width to 4 columns.  (Default 8)
" Only necessary when expandtab not set.
set tabstop=4

" Set tab-key width to 4 spaces.
" Allows backspace to delete 4 spaces.
"set softtabstop=4

" Set shift width to 4 spaces.
set shiftwidth=4

" Auto indent
set autoindent


" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" With a map leader it's possible to do extra key combinations (Default: \)
" like <leader>w saves the current file
"let mapleader = ","

" Remap 0 to first NON-BLANK character.
nnoremap 0 ^

" Disable highlight when <leader>\ is pressed. (\\)
nnoremap <silent> <leader>\ :nohlsearch<cr>

" Visual mode search: * or # (backward) search selection.
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    "autocmd WinLeave * set nocursorline nocursorcolumn
    "autocmd WinEnter * set cursorline cursorcolumn
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
augroup END

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid,
" inside an event handler (happens when dropping a file on gvim)
" and for a commit message (it's likely a different one than last time).
" Put these in an autocmd group, so that you can revert them with:
" ':augroup vimStartup | au! | augroup END'
augroup cursor_pos
    au!
    autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set the background tone.
    set background=dark

    " Set the color scheme.
    "colorscheme molokai

    " Set a custom font you have installed on your computer.
    " Syntax: set guifont=<font_name>\ <font_weight>\ <size>
    "set guifont=Monospace\ Regular\ 12

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the right-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show the status on the second to last line.
set laststatus=2

" Clear status line when vimrc is reloaded.
"set statusline=

" Status line left side.
"set statusline+=\ %F\ %M\ %Y\ %R

" Add a divider.
"set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Set Status line
set statusline=\ %{HasPaste()}%F\ %m%r%h\ %Y%=Line:%l\ Col:%c\ %p%%

" Status line helper function
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" }}}


" MISC ------------------------------------------------------------------- {{{

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" }}}
