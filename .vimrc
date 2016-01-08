set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vim- Multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" Syntastic
Plugin 'scrooloose/syntastic'

" You Complete Me 
Plugin 'Valloric/YouCompleteMe'

" Vim-Airline
Plugin 'bling/vim-airline'

" vim-mini map
Plugin 'severin-lemaignan/vim-minimap'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Leader Key
let mapleader = ","

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

syntax enable

set number
" Mappings Begin Here
nnoremap - ddp
"noremap <c-u> viwU
nnoremap <space> viw
"inoremap <c-d> <esc>ddi

noremap  ;  :
noremap  :  ;

noremap  0  $
noremap  $  0

:noremap <leader>ev :split $MYVIMRC<cr>
:noremap <leader>sv :source $MYVIMRC<cr>                                                                   

map  <expr>  <LEFT>   DVB_Drag('left')                         
vmap  <expr>  <RIGHT>  DVB_Drag('right')                        
vmap  <expr>  <DOWN>   DVB_Drag('down')                         
vmap  <expr>  <UP>     DVB_Drag('up')                           
vmap  <expr>  D        DVB_Duplicate()                          
" Mappings end here
                                                                
runtime plugin/dragvisuals.vim
" Remove any introduced trailing whitespace after moving...     
let g:DVB_TrimWS = 1  

let g:airline_powerline_fonts = 1
colorscheme monokai

let g:python_host_prog = '/usr/bin/python2.7'

" Printer thing
let &printexpr="(v:cmdarg=='' ? ".
    \"system('lpr' . (&printdevice == '' ? '' : ' -P' . &printdevice)".
    \". ' ' . v:fname_in) . delete(v:fname_in) + v:shell_error".
    \" : system('mv '.v:fname_in.' '.v:cmdarg) + v:shell_error)"

" open terminal split below buffer

if has('nvim')
    :tnoremap <Esc> <C-\><C-n>
    nnoremap <leader>t :below 10sp term://$SHELL<cr>i
endif

" EITHER the entire 81st column, full-screen...
" highlight ColorColumn ctermbg=magenta
" set colorcolumn=81

" OR ELSE just the 81st column of wide lines...
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%79v', 100)

" OR ELSE on April Fools day...
" highlight ColorColumn ctermbg=red ctermfg=blue
" exec 'set colorcolumn=' . join(range(2,80,3), ',')
