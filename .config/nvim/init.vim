set clipboard+=unnamedplus
set mousehide
set ignorecase
set smartcase
set mousehide

set completeopt=menuone,noinsert,noselect
set mouse=a
set shortmess+=c
set tabstop=8
set softtabstop=2
set shiftwidth=2
set noexpandtab
set noshowmode
set noshowcmd

call plug#begin('$HOME/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'tomlion/vim-solidity'

Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" --------------------------------------------------------------------
" Bindings
" --------------------------------------------------------------------

" Escape terminal
tnoremap <Esc> <C-\><C-n>

" NERDTree
nnoremap <silent><F2> <ESC>:NERDTreeToggle<CR>
nnoremap <Leader><F2>f <ESC>:NERDTreeFind 
nnoremap <Leader><F2>p <ESC>:NERDTreeProjectLoad 

" --------------------------------------------------------------------
" NERDTree config
" --------------------------------------------------------------------
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeMinimalMenu=1
let NERDTreeShowHidden=0
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeCascadeSingleChildDir=1
let NERDTreeCascadeOpenSingleChildDir=1
let NERDTreeIgnore=['^.git$[[dir]]', '^node_modules$[[dir]]']
let g:NERDTreeGitStatusUseNerdFonts = 1
autocmd BufWinEnter * silent NERDTreeMirror

" --------------------------------------------------------------------
" Onedark & Lightline config
" --------------------------------------------------------------------
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }
colorscheme onedark
highlight normal guibg=NONE ctermbg=NONE
