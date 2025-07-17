vim.o.hlsearch = false
vim.o.incsearch = true
vim.opt.scrolloff = 10
vim.opt.updatetime = 50
vim.o.timeoutlen = 5000
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.wo.relativenumber = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.spell = true
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
