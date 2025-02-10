vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

local function tree_opts(desc)
  return { desc = "nvim-tree: " .. desc, noremap = true, silent = true, nowait = true }
end

vim.keymap.set('n', '<C-b>', require("nvim-tree.api").tree.toggle, tree_opts('Toggle'))
vim.keymap.set('n', '<leader>b', '"_');
vim.keymap.set({ 'n', 'i', 'v' }, '<C-f>', vim.lsp.buf.code_action, { desc = 'Quick fix options' })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set({ 'n', 'i', 'v' }, '<C-S-i>', function()
  vim.cmd('Format')
end, { desc = 'Format current buffer' })

vim.keymap.set('n', '<leader>m', function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = 'Harpoon menu' })
vim.keymap.set('n', '<leader>M', function()
  require("harpoon.mark").add_file()
end, { desc = 'Harpoon mark' })
vim.keymap.set('n', '<leader><space>', function()
  require("harpoon.ui").nav_next()
end, { desc = 'Harpoon cycle' })
