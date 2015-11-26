" http://dougblack.io/words/a-good-vimrc.html#colors

syntax enable
set tabstop=3
set softtabstop=3
set expandtab
set number
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set foldenable
set foldlevelstart=10
set foldnestmax=10

nnoremap j gj
nnoremap k gk

nnoremap B ^
nnoremap E $

let mapleader=","
inoremap jk <esc>
nnoremap <leader>u :GundoToggle<CR>

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" toggle between number and relativenumber
function! ToggleNumber()
   if(&relativenumber == 1)
      set norelativenumber
      set number
   else
      set relativenumber
   endif
endfunc 


" vim:foldmethod=marker:foldlevel=0