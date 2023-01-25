-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
require('mason').setup()
require('mason-lspconfig').setup()

lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = fufnr, remap = false}
	vim.keymap.set('n', "<leader>gd", function() vim.lsp.buf.definition() end, opts)
end)

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
