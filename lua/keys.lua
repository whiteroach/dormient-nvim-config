--[[keys.lua]]
local map=vim.api.nvim_set_keymap

--Toggle nvim-tree
map('n','n',[[:NvimTreeToggle]], {})
map('n','nm',[[:NvimTreeFocus]], {})
map('n', 'l', [[:IndentLinesToggle]], {})
map('n', 't', [[:TagbarToggle]], {})
map('n', 'ff', [[:Telescope find_files]], {})
map('n', 't', [[:FloatermToggle]], {})
map('t', "<Esc>", "<C-\\><C-n>:q<CR>", {})
