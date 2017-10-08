set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'majutsushi/tagbar'

"Plugin 'kien/ctrlp.vim'

Plugin 'junegunn/fzf'

Plugin 'flazz/vim-colorschemes'

Plugin 'kergoth/vim-bitbake'

Plugin 'tpope/vim-fugitive'

Plugin 'tomtom/tlib_vim'  " required by vim-snipmate

Plugin 'MarcWeber/vim-addon-mw-utils'  " required by vim-snipmate

Plugin 'garbas/vim-snipmate'

Plugin 'honza/vim-snippets'  " used by vim-snipmate

" easytags replacement with support for Universal Ctags
Plugin 'ludovicchabant/vim-gutentags'

Plugin 'git@github.com:Valloric/YouCompleteMe.git'  " YCM

Plugin 'mileszs/ack.vim' " alternative file contents search

Plugin 'octol/vim-cpp-enhanced-highlight'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set ts=4
set shiftwidth=4
set noexpandtab

" vim-cpp-enhanced-highlight - Highlith member vars
let g:cpp_member_variable_highlight = 1

" Extend fugitive plugin commands
command Greview :Git! diff --staged

" Tagbar shortcut
nmap <F8> :TagbarToggle<CR>
set tags=./tags;

" ack
let g:ackprg = 'ag --vimgrep'
let g:ackhighlight = 1

colorscheme ego
syntax on

" vim-snippets
let g:snips_author = 'valentink'

" Global YCM Config
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Don't ask for loading the local ycm conf
let g:ycm_confirm_extra_conf = 0

" ignore common files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o

nmap <C-p> :FZF<CR>
""" start CtrlP in the same where the vim has been started
""let g:ctrlp_working_path_mode = 'rw'
""
""" ignore pattersn for CtrlP
""let g:ctrlp_custom_ignore = {
""  \ 'dir':  '\v[\/]\.(git|hg|svn|CMakeFiles)$',
""  \ 'file': '\v\.(exe|so|dll|o)$',
""  \ }

" Show status line and the current file name
set laststatus=2
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

" Show line numbers
set number

set mouse=a

" autosave all files on focus lost
:au FocusLost * silent! wa
set hidden

" setup shortcut to perform 'increase number' operation
:noremap <F3> <C-A>
" setup shortcut to perform 'decrease number' operation
:noremap <C-F3> <C-X>

"automatically read the file again
"when it is changed outside of Vim
set autoread

" highlight all search matches
set hlsearch

" start searching when typing
set incsearch
