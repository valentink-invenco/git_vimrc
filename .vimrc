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

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

Plugin 'flazz/vim-colorschemes'

Plugin 'kergoth/vim-bitbake'

Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'shumphrey/fugitive-gitlab.vim'
"Plugin 'tomtom/tlib_vim'  " required by vim-snipmate

"Plugin 'MarcWeber/vim-addon-mw-utils'  " required by vim-snipmate

"Plugin 'garbas/vim-snipmate'

"Plugin 'honza/vim-snippets'  " used by vim-snipmate

" easytags replacement with support for Universal Ctags
Plugin 'ludovicchabant/vim-gutentags'

"Plugin 'git@github.com:Valloric/YouCompleteMe.git'  " YCM

Plugin 'mileszs/ack.vim' " alternative file contents search

Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'itchyny/lightline.vim'
"Plugin 'liuchengxu/eleline.vim'

Plugin 'rhysd/vim-clang-format'

Plugin 'dense-analysis/ale'
Plugin 'rust-lang/rust.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set ts=4
set shiftwidth=4
set expandtab
set ai

" Set gutentag to go scan only the same files as rg
let g:gutentags_file_list_command = 'rg --files'

" ALE configurations
let g:ale_cpp_cc_options = '-std=c++11 -Wall'
let g:ale_linters = {'rust': ['analyzer', 'rls']}
let g:ale_rust_cargo_check_tests = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
nmap <silent> <F12> :ALEGoToDefinition<CR>
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'rust': ['rustfmt'],
\}

" vim-cpp-enhanced-highlight - Highlith member vars
let g:cpp_member_variable_highlight = 1

" Extend fugitive plugin commands
command! Greview :Git! diff --staged

" Enable GitLab in fugitive :GBrowse
let g:fugitive_gitlab_domains = ['https://git.invencolabs.com']

" Tagbar shortcut
nmap <F8> :TagbarToggle<CR>
let g:tagbar_position = 'left'
set tags=./tags;

" ack
"let g:ackprg = 'ag --vimgrep'
let g:ackprg = 'rg --vimgrep'
let g:ackhighlight = 1
nnoremap <silent> <Leader>ack       :Ack <C-R><C-W><CR>

"colorscheme ego
"colorscheme gruvbox
colorscheme jellybeans
"colorscheme molokai  " bad parenthesis matching
"colorscheme stingray
"colorscheme Monokai " search results only underlined
"colorscheme apprentice
syntax on
set background=dark
set t_Co=256  " Force 256 colors (helps on tmux)

" commented in as it slows down j/h motion
"set cursorline  " highlight the current line

"" vim-snippets
"let g:snips_author = 'valentink'
"imap <C-J> <Plug>snipMateNextOrTrigger
"smap <C-J> <Plug>snipMateNextOrTrigger

" Global YCM Config
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

"" Don't ask for loading the local ycm conf
"let g:ycm_confirm_extra_conf = 0
"set completeopt-=preview
"nnoremap ,gl :YcmCompleter GoToDeclaration<CR>
"nnoremap ,gf :YcmCompleter GoToDefinition<CR>
"nnoremap ,gi :YcmCompleter GoToInclude<CR>
"" Apply YCM FixIt
"map <F9> :YcmCompleter FixIt<CR>

" ignore common files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o

" fzf
nmap <C-p> :FZF<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>rg       :Rg <C-R><C-W><CR>
"let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let $FZF_DEFAULT_COMMAND = 'fd --type file'

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('right', 'Ctrl-/'), <bang>0)
" fzf pop-up window setup
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.9, 'rounded': v:true } }
let g:fzf_action = { 'ctrl-v': 'vsplit' }
" Show status line and the current file name
set laststatus=2

let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead'
	\ },
	\ }

" clang-format
let g:clang_format#command="clang-format-6.0"

" yaml format
autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab

" Show relative line numbers
"set relativenumber
set number

" Mouse when run in tmux
set ttymouse=xterm2
set mouse=a

" autosave all files on focus lost
:au FocusLost * silent! wa
set hidden

" save the file when switch buffers, make it etc.
set autowriteall

" disable swap files
set noswapfile

" setup shortcut to perform 'increase number' operation
:noremap <F3> <C-A>
" setup shortcut to perform 'decrease number' operation
:noremap <C-F3> <C-X>

"automatically read the file again
"when it is changed outside of Vim
set autoread

" highlight all search matches
" it should be applied after colorscheme
set hlsearch
hi Search ctermbg=Yellow
hi Search ctermfg=Red

" start searching when typing
set incsearch

" fix Backspace key
set backspace=indent,eol,start

" cursor shapes: IBeam shape in insert mode,
" underline shape in replace mode and block shape in normal mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" sets 'path' to:
" " - the directory of the current file
" - every subdirectory of the "current directory"
set path=.,**

" enables the wildmenu
set wildmenu

" case-insensitive search
set wildignorecase
set ignorecase

" Ignore vim temp file types in netrw
let g:netrw_list_hide='.*\.swp,'
let g:netrw_list_hide.='\.git,'
let g:netrw_list_hide.='\.o,\.obj,\.pyc,'
let g:netrw_list_hide.='\..*\.un\~'

" Enable per project .vimrc
set secure
set exrc
