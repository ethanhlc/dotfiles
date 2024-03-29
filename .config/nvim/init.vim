" ~/.vimrc & ~/.config/nvim/init.vim
" vimrc file created using various online sources
" Created by: Ethan
" Date: 2022.12.22

" PLUGINS ---------------------------------------------------------------- {{{

" vim-plug
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" color schemes
Plug 'arcticicestudio/nord-vim'         " nord theme
Plug 'dracula/vim', { 'as': 'dracula' } " dracula theme

" usability
Plug 'itchyny/lightline.vim'        " lightline statusline
Plug 'preservim/nerdtree'           " nerdtree file browser
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocompletion
Plug 'tpope/vim-commentary'         " easy un/comment code

Plug 'christoomey/vim-tmux-navigator'   " vim / tmux ctrl navigation

" git plugins
Plug 'tpope/vim-fugitive'           " git integration
Plug 'airblade/vim-gitgutter'       " git gutter

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()


"+--- Plugin Configs ---+
" gitgitter config
set updatetime=100      " reduce time until gitgutter is updated

" nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>

" coc nvim
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" }}}


" General ---------------------------------------------------------------- {{{

" vim specific
if !has('nvim')
    " Disable compatibility with vi which can cause unexpected issues.
    set nocompatible
    " Set the commands to save in history.
    set history=500
    " Configure backspace so it acts as it should act
    set backspace=indent,eol,start
    " Set to auto read when a file is changed from the outside
    set autoread
    " au FocusGained,BufEnter * checktime
    " No error sounds.
    set noerrorbells
    " Enable mouse if available.
    if has('mouse')
        set mouse=a
    endif
endif

" Enable filetype detection, plugins, indent files
filetype plugin indent on

" don't keep backup file (files end in ~)
set nobackup

" }}}


" User Interface & Behavior ---------------------------------------------- {{{

" vim specific
if !has('nvim')
    " Turn syntax highlighting on.
    syntax enable
    " Always show current position
    set ruler 
    " Highlight search results
    set hlsearch
    " Makes search act like search in modern browsers
    set incsearch
    " Enable auto completion on commands
    set wildmenu
endif

" Enable color scheme
colorscheme nord

" Add numbers to each line and show relative numbers.
set number relativenumber

" Enable listchars
set list

" Set listchars
set listchars=tab:»·,trail:·

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn

" Do not let cursor scroll below or above N number of lines.
set scrolloff=10

" Wrap lines
set wrap

" Allow arrow keys to travel past eol
set whichwrap+=<,>,[,]

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Jump to matching brackets when typing
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Splits open to right & bottom
set splitright splitbelow

" }}}


" Text, Tab, Indent ------------------------------------------------------ {{{

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

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" With a map leader it's possible to do extra key combinations (Default: \)
" like <leader>w saves the current file
"let mapleader = ","

" Remap 0 to first NON-BLANK character.
nnoremap 0 ^

" Mappings (Learn Vim Scripting the Hard Way)
" convert current word to upper case
inoremap <c-u> <esc>viwU

" map 'jk' to exit insert mode
inoremap jk <esc>

" Open vimrc in a vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Disable highlight when <leader>\ is pressed. (\\)
nnoremap <silent> <leader>\ :nohlsearch<cr>

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

" Visual mode search: * or # (backward) search selection.
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
"inoremap <C-U> <C-G>u<C-U>

" Open/Close folds using <Space> key
nnoremap <space> za

" Zoom a vim pane, <C-w> to rebalance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Automatic toggling between line number modes
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter   * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave     * if &nu                  | set nornu | endif
augroup END

" This will enable code folding.
" Use the marker method of folding for vim files.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
"autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

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
    autocmd!
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

" Show the mode you are on the last line. noshomode for lightline
set noshowmode

" Show the status on the second to last line.
set laststatus=2

" lightline statusline config
let g:lightline = {
    \ 'colorscheme': 'nord',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'relativepath' ],
    \             [ 'readonly', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'filetype', 'fileencoding', 'fileformat' ] ]
    \ },
    \ 'component': {
    \   'modified': '%m',
    \   'gitbranch': '%{b:gitbr}'
    \ },
    \ 'component_visible_condition': {
    \   'gitbranch': 'strlen(b:gitbr)'
    \ },
    \ 'separator': {
    \   'left': '', 'right': ''
    \ },
    \ 'subseparator': {
    \   'left': '|', 'right': '|'
    \ },
    \}

" Lightline helper functions
" Run FugitiveHead on buffer enter/read/write, add  to branch name
augroup branchname
    autocmd!
    autocmd BufEnter,BufRead,BufWritePost * 
        \ let b:gitbr = strlen(FugitiveHead(7)) ? ' '.FugitiveHead(7) : ''
augroup END

" unused function (same as augroup branchname)
"function! GitFug()
"    if strlen(FugitiveHead())
"        return ' ' . FugitiveHead()
"    else
"        return FugitiveHead()
"    endif
"endfunction

"call lightline#disable()        " disable lightline

" Build statusline
"set statusline=                                         " clear statusline
"set statusline+=%#Left1#                                " highlight L1
"set statusline+=\ %{toupper(g:currentmode[mode()])}     " show mode
"set statusline+=%{&paste?'PASTE\ ':''}                  " paste mode
"set statusline+=%#LArrow1#                              " arrow L1
"set statusline+=                                       " arrow left
"set statusline+=%#Left2#                                " highlight L2
"set statusline+=\ %{b:gitstl}                           " git branch
"set statusline+=%F\                                     " filename (fullpath)
"set statusline+=%#LArrow2#                              " arrow L2
"set statusline+=                                       " arrow left
"set statusline+=%#Center1#                              " highlight center
"set statusline+=\ %r%m                                  " ReadOnly/Modified
"set statusline+=%=                                      " left/right divider
"set statusline+=\ %{&ft!=#''?&ft:'no_ft'}               " filetype
"set statusline+=\ \|                                    " divider
"set statusline+=\ %{&fenc?&fenc:&enc}                   " fenc=fileencoding, enc=encoding
"set statusline+=\ \|                                    " divider
"set statusline+=\ %{&fileformat}\                       " fileformat (dos/unix)
"set statusline+=%#RArrow2#                              " arrow R2
"set statusline+=                                       " arrow right
"set statusline+=%#Right2#                               " highlight R2
"set statusline+=\ %p%%\                                 " % of document
"set statusline+=%#RArrow1#                              " arrow R1
"set statusline+=                                       " arrow right
"set statusline+=%#Right1#                               " highlight R1
"set statusline+=\ %3l:%-2c\                             " line:col

" old_Set Status line
"set statusline=\ %{HasPaste()}%F\ %m%r%h\ %Y%=Line:%l\ Col:%c\ %p%%

" Status line helper functions
"function! GitBranch()
"    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction

" Run GitBranch on buffer enter/read/write, add  to branch name
"augroup gitstatusline
"    autocmd!
"    autocmd BufEnter,BufRead,BufWritePost,FileChangedShell,FocusGained *
"        \ let b:gitstl = strlen(GitBranch()) ? ' '.GitBranch().' | ' : ''
"augroup END

" get current mode
"let g:currentmode={
"    \ 'n'  : 'NORMAL ',
"    \ 'v'  : 'VISUAL ',
"    \ 'V'  : 'V·Line ',
"    \ "\<C-V>" : 'V-Block ',
"    \ 'i'  : 'INSERT ',
"    \ 'R'  : 'Replace ',
"    \ 'Rv' : 'V-Replace ',
"    \ 'c'  : 'Command ',
"    \}

" colors for statusline
"highlight Left1 ctermfg=0 ctermbg=6 guifg=#3B4252 guibg=#88C0D0
"highlight Left2 ctermfg=6 ctermbg=8 guifg=#88C0D0 guibg=#4C566A
"highlight Center1 ctermbg=0 guifg=#D8DEE9 guibg=#3B4252
"highlight Right2 ctermfg=6 ctermbg=8 guifg=#88C0D0 guibg=#4C566A
"highlight Right1 ctermbg=0 guifg=#D8DEE9 guibg=#3B4252
"highlight LArrow1 ctermfg=6 ctermbg=8 guifg=#88C0D0 guibg=#4C566A
"highlight LArrow2 ctermfg=8 ctermbg=0 guifg=#4C566A guibg=#3B4252
"highlight RArrow2 ctermfg=8 ctermbg=0 guifg=#4C566A guibg=#3B4252
"highlight RArrow1 ctermfg=0 ctermbg=8 guifg=#3B4252 guibg=#4C566A

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
