local status, so = pcall(require, "symbols-outline")
if not status then
	print("symbols-outline not loaded!")
	return
end

so.setup()

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>o", "<cmd>SymbolsOutline<CR>") -- see outline on right hand side
