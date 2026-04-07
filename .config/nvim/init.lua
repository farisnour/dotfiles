vim.o.wrapscan = false
vim.o.number = true
vim.o.scrolloff = 5

-- Store undo history between sessions
local undodir = vim.fn.expand("~/.vim/undodir")
if
	vim.fn.isdirectory(undodir) == 0
then
	vim.fn.mkdir(undodir, "p")
end

vim.o.undofile = true
vim.o.undodir = undodir


-- Always center search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Leader custom mappings
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>x', ':wq<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>e', ':Ex<CR>', { noremap = true, silent = true })


-- Jump to last cursor position when opening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line = mark[1]
    local col = mark[2]
    local last_line = vim.api.nvim_buf_line_count(0)
    if line > 0 and line <= last_line then
      pcall(vim.api.nvim_win_set_cursor, 0, {line, col})
    end
  end,
})
