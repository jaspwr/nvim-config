vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  desc = 'return cursor to where it was last time closing the file',
  pattern = '*',
  command = 'silent! normal! g`"zv',
})

require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

require('Comment').setup()

require('diagflow').setup()

local ccc = require("ccc")
ccc.setup({
  pickers = {
    ccc.picker.custom_entries({
      red = "#BF616A",
      green = "#A3BE8C",
      blue = "#81A1C1"
    })
  },
})

require("ibl").setup {
  indent = { char = "┊" },
}

require("nvim-tree").setup({
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    api.config.mappings.default_on_attach(bufnr)
  end
})

local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

require("tailwind-tools").setup({
  -- your configuration
})

local dap, dapui = require("dap"), require("dapui")
dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  host = "127.0.0.1",
  executable = {
    command = "C:\\Users\\jaspe\\AppData\\Local\\nvim-data\\mason\\packages\\codelldb\\extension\\adapter\\codelldb.exe",
    args = { "--port", "${port}" },
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
