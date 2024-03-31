require "nvchad.mappings"

-- add yours here
local discipline = require "misc.discipline"
discipline.cowboy()

local map = vim.keymap.set

local noremap = function(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Text
map("n", "+", "<C-a>", { desc = "Text increase number under cursor" })
map("n", "-", "<C-x>", { desc = "Text decrease number under cursor" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Text select all texts" })

-- Tabs
map("n", "te", ":tabedit<Return>", { desc = "Tab create a new tab" })
map("n", "tx", ":tabclose<Return>", { desc = "Tab close this tab" })

-- Split Window
map("n", "ss", ":split<Return>", noremap "Window split window horizontal")
map("n", "sv", ":vsplit<Return>", noremap "Window split window vertical")

-- Resize Window
map("n", "<C-w><left>", "<C-w><" )
map("n", "<C-w><right>", "<C-w>>" )
map("n", "<C-w><up>", "<C-w>+" )
map("n", "<C-w><down>", "<C-w>-" )

map("n", "<leader>cr", ":IncRename ")
