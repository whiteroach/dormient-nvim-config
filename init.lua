--[[init.lua]]

--LEADER
--These keybindings need to be defined before the first / is called; otherwise it will default to '\'
vim.g.mapleader=","  --works across files
vim.g.localleader="\\"  --works with specific file types

--IMPORTS
require('vars')  --Variables
require('opts') --Options
require('keys') --Keymaps 
require('plug') --Plugins
-- require('scnvim-opts') 
require('nvim-cmp')

-- PLUGINS
require('nvim-tree').setup{}
require('lualine').setup{}
require('nvim-autopairs').setup{}
require('Comment').setup{}

-- TREE-SITTER
---WORKAROUND
-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "supercollider", "c", "lua", "vim", "vimdoc", "query", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    disable = {"markdown"},
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- SCNVIM
local scnvim = require 'scnvim'
local map = scnvim.map
local map_expr = scnvim.map_expr

require('scnvim').setup{ 
    keymaps = {
    ['<M-e>'] = map('editor.send_line', {'i', 'n'}),
    ['<C-e>'] = {
      map('editor.send_block', {'i', 'n'}),
      map('editor.send_selection', 'x'),
    },
    ['<CR>'] = map('postwin.toggle'),
    ['<M-CR>'] = map('postwin.toggle', 'i'),
    ['<M-L>'] = map('postwin.clear', {'n', 'i'}),
    ['<C-k>'] = map('signature.show', {'n', 'i'}),
    ['<F12>'] = map('sclang.hard_stop', {'n', 'x', 'i'}),
    ['<leader>st'] = map('sclang.start'),
    ['<leader>sk'] = map('sclang.recompile'),
    ['<F1>'] = map_expr('s.boot'),
    ['<F2>'] = map_expr('s.meter'),
  },
  editor = {
    highlight = {
      color = 'IncSearch',
    },
  },  
  statusline = {
    poll_interval = 1,
  },
  postwin = {
    float = {
      enabled = true,
    },
  },
}
