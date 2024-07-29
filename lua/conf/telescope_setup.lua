local telescope_actions = require("telescope.actions")

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<esc>'] = telescope_actions.close,
      },
    },
  },
}

pcall(require('telescope').load_extension, 'fzf')
