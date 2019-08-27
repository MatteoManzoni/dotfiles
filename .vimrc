set nocompatible  " be iMproved, required
filetype off  " required
set exrc

set encoding=UTF-8

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ==== plugin manager
Plugin 'VundleVim/Vundle.vim'

" ==== helpers
Plugin 'vim-scripts/L9'

" ==== File tree
Plugin 'scrooloose/nerdtree'

" ==== Completion
Plugin 'Valloric/YouCompleteMe'

" ==== Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ==== syntax helpers
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'ap/vim-css-color'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'python-rope/rope'
Plugin 'python-rope/ropemode'
Plugin 'python-rope/ropevim'
Plugin 'klen/pylama'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar' 

" ==== moving / searching
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'danro/rename.vim'

" === SPECIAL
Plugin 'w0rp/ale'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-sensible'
Plugin 'tmhedberg/matchit'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'segeljakt/vim-isotope'

" ==== snippets
Plugin 'SirVer/ultisnips'
Plugin 'vim-scripts/vim-auto-save'

" Status bar on bottom
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ==== PLUGIN THEMES
Plugin 'morhetz/gruvbox'
Plugin '0x7A69_dark.vim'
Plugin 'nikitavoloboev/vim-monokai-night'
Plugin 'ayu-theme/ayu-vim'

" ==== TMUX INTEGRATION
" Plugin 'edkolev/tmuxline.vim' " Only to update the tmuxline

call vundle#end()
filetype plugin indent on

" ==== Colors and other basic settings
"colorscheme 0x7A69_dark
colorscheme 0x7A69_dark_personalized
highlight Comment cterm=italic gui=italic
set guifont=Space\ Mono\ for\ Powerline:h10
let g:airline_powerline_fonts = 1
let g:airline_theme='night_owl'
set fillchars+=vert:\$
syntax enable
set background=dark
set ruler
set hidden
set number
set laststatus=2
set smartindent
set st=4 sw=4 et
set shiftwidth=4
set tabstop=4
set noshowmode
" let &colorcolumn="80" "remove 80char limit
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" ==== UNDOFILE
set undofile
set undodir=~/.vim/undodir 

" ==== AUTOSAVE (beta)
let g:auto_save = 1
let g:auto_save_no_updatetime = 1

" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
cd ~/Documents
map <F2> :NERDTreeToggle<CR>

" ==== SPELL
map <F6> :setlocal spell! spelllang=en_us<CR>
map <F7> :setlocal spell! spelllang=it<CR>

" ==== Rope python autocomplete
let ropevim_vim_completion = 1
let ropevim_extended_complete = 1

" ==== Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'python']
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'

" === flake8
let g:flake8_show_in_file=1

" ==== snippets
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ==== Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)
map <C-c> "+y<CR>

set backspace=indent,eol,start

" ==== moving around
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" ==== remember things
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" ==== disable mouse
set mouse=a

" ==== disable swap file warning
set shortmess+=A

" ==== custom commands
command JsonPretty execute ":%!python -m json.tool"
set secure

