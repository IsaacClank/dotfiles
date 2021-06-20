Opt = vim.opt
Fn = vim.fn
Cmd = vim.cmd
Nvim = vim.api

local set_options = function ()
  Opt.ignorecase = true
  Opt.smartcase = true

  Opt.tabstop = 2
  Opt.shiftwidth = 2
  Opt.expandtab = true

  Opt.mouse = 'a'
  Opt.clipboard = 'unnamedplus'
  Opt.showmode = false
  Opt.showcmd = false
end

local install_plugins = function()
  local PACKER_INSTALL_PATH = Fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
  local PACKER_REPO = 'https://github.com/wbthomason/packer.nvim'

  -- Install packer if not already installed
  if Fn.empty(Fn.glob(PACKER_INSTALL_PATH)) == 1 then
    print('Installing Packer\n')
    Cmd('!git clone '..PACKER_REPO..' '..PACKER_INSTALL_PATH)
  end

  -- Load packer
  Cmd('packadd packer.nvim')
  Cmd([[
  augroup Packer
  autocmd!
  autocmd BufWritePost plugins.lua PackerCompile
  augroup END
  ]], false)

  -- Install plugins
  require('packer').startup(function(use)
    use {'wbthomason/packer.nvim', opt = true}
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'joshdick/onedark.vim'
    use 'itchyny/lightline.vim'

    use 'preservim/nerdtree'
    use 'scrooloose/nerdtree-project-plugin'
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'ryanoasis/vim-devicons'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'
  end)
end

local configure_plugins = function()
  -- NERDTree
  vim.g.NERDTreeAutoDeleteBuffer = 1
  vim.g.NERDTreeMinimalUI = 1
  vim.g.NERDTreeMinimalMenu = 1
  vim.g.NERDTreeShowHidden = 0
  vim.g.NERDTreeShowBookmarks = 1
  vim.g.NERDTreeChDirMode = 2
  vim.g.NERDTreeCascadeSingleChildDir = 1
  vim.g.NERDTreeCascadeOpenSingleChildDir = 1
  vim.g.NERDTreeIgnore = { '^.git$[[dir]]', '^node_modules$[[dir]]' }
  vim.g.NERDTreeGitStatusUseNerdFonts = 1
  Cmd('autocmd BufWinEnter * silent NERDTreeMirror')

  Nvim.nvim_set_keymap('n', '<F2>', ':NERDTreeToggle<CR>', {noremap = true, silent = true})

  -- Onedark & Lightline
  if Fn.empty(vim.env.TMUX) then
    if(Fn.has('nvim')) then
      vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
    end

    if(Fn.has("termguicolors")) then
      vim.g.termguicolors = true
    end
  end
  vim.g.lightline = {colorscheme = 'onedark'}

  Cmd('syntax enable')
  Cmd('colorscheme onedark')
  Cmd('highlight normal guibg=NONE ctermbg=NONE')
end

local main = function ()
  set_options()
  install_plugins()
  configure_plugins()
end

main()
