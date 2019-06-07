set tabstop=2
set shiftwidth=2


set scrolloff=25
set ttyfast

set number

set laststatus=2

set showmode
set showcmd

set matchpairs+=<:>

syntax on
colorscheme desert

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
"colorize the status line display
hi statusline cterm=bold ctermfg=red ctermbg=black



""""""""""""""""""""""""""""""""""""""""""""""
" Experiments in setting up cursor highlight "
""""""""""""""""""""""""""""""""""""""""""""""
set cursorline "set cul
":autocmd InsertEnter * set nocul "hi CursorLine ctermbg=DarkGrey
":autocmd InsertLeave * set cul "hi CursorLine ctermbg=NONE

" subtle
hi CursorLine cterm=bold

":autocmd InsertEnter,InsertLeave * set cul!




""""""""""""""""""""""""""""""""""""""""""""""
" End of Section                             "
""""""""""""""""""""""""""""""""""""""""""""""

"highlight Cursor guifg=yellow guibg=steelblue
"highlight iCursor guifg=red guibg=steelblue
"highlight CursorLine guibg=honeydew2
"hi CursorLine cterm=bold ctermbg=darkred ctermfg=white guibg=darkred guifg=white


" gvim only
"set guicursor=n-v-c:block-Cursor
"set guicursor=a:block-Cursor
"set guicursor+=i:block-iCursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10

" the following works in terminal vim (not gvim)
if &term =~ "xterm\\|rxvt"

  " orange insert mode
  let &t_SI = "\<Esc>]12;orange\x7"

  " red otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"

  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal

  " solid underscore
  let &t_SI .= "\<Esc>[6 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif
