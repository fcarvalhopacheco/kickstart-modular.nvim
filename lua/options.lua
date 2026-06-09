-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.o.number = true -- Make line numbers default
vim.o.relativenumber = true -- Set relative numbered lines
vim.o.mouse = 'a' -- Enable mouse support
vim.o.showmode = false -- Don't show the mode, since it is already in status line
vim.o.breakindent = true -- Enable break indent
vim.o.swapfile = false -- Don't use swapfile
vim.o.undofile = true -- Enable persistent undo
vim.o.completeopt = 'menuone,noselect,noinsert'

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
-- See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Sets how neovim will display certain whitespace in the editor.
-- See `:help 'list'` and `:help 'listchars'`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type.
vim.o.inccommand = 'split'

vim.o.showmatch = true -- Highlight matching parenthesis
vim.o.foldmethod = 'marker' -- Enable folding with markers
vim.o.colorcolumn = '79' -- Line length marker
vim.o.splitright = true -- Vertical split to the right
vim.o.splitbelow = true -- Horizontal split to the bottom

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.linebreak = true -- Wrap on word boundary
vim.o.laststatus = 3 -- Set global statusline

vim.o.guifont = 'monospace:h17' -- Font used in graphical Neovim applications
vim.o.cmdheight = 2 -- More command-line space
vim.o.cursorline = true -- Highlight the current line
vim.o.spelllang = 'en_us' -- Spell language
vim.o.spell = true -- Enable spell checking

-- Ask before quitting/running risky actions with unsaved buffers.
vim.o.confirm = true

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-----------------------------------------------------------
-- Tabs, indent and others
-----------------------------------------------------------
vim.o.textwidth = 79
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = 4 -- Shift 4 spaces when tab
vim.o.shiftround = true
vim.o.tabstop = 4 -- 1 tab == 4 spaces
vim.o.smartindent = true -- Autoindent new lines
vim.o.softtabstop = 4
vim.o.autoindent = true

vim.o.numberwidth = 4
vim.o.signcolumn = 'yes'
vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8
vim.o.autowrite = true
vim.o.infercase = false

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.o.timeoutlen = 300
vim.o.hidden = true
vim.o.history = 100
vim.o.lazyredraw = true
vim.o.synmaxcol = 240
vim.o.updatetime = 250

-----------------------------------------------------------
-- Others
-----------------------------------------------------------
vim.o.backup = false
vim.o.conceallevel = 2
vim.o.fileencoding = 'utf-8'
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.pumheight = 10
vim.o.writebackup = false
vim.o.undodir = os.getenv 'HOME' .. '/.vim/undodir'

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-----------------------------------------------------------
-- NVIM PYTHON location
-----------------------------------------------------------
local function isempty(s)
  return s == nil or s == ''
end

local function use_if_defined(val, fallback)
  return val ~= nil and val or fallback
end

-- Custom Python provider
local conda_prefix = os.getenv 'CONDA_PREFIX'
if not isempty(conda_prefix) then
  vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, conda_prefix .. '/bin/python')
  vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, conda_prefix .. '/bin/python3')
else
  vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, '/Users/fcp/mambaforge/bin/python')
  vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, '/Users/fcp/mambaforge/bin/python3')
end

-- vim: ts=2 sts=2 sw=2 et
