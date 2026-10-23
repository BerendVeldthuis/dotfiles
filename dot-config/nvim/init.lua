local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('ellisonleao/gruvbox.nvim')
Plug('windwp/nvim-autopairs')
Plug('preservim/nerdtree')
Plug('lervag/vimtex')

vim.call('plug#end')

vim.pack.add{
    { src = 'https://github.com/neovim/nvim-lspconfig' }
}

require("nvim-autopairs").setup {}

vim.o.wrap = false
vim.o.number = true
vim.o.colorcolumn = "80"

vim.o.spelllang ="en_us"
vim.o.spell = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.background = "dark"
vim.cmd([[
	colorscheme gruvbox
    filetype plugin indent on
    syntax enable
	]])

vim.g.vimtex_view_general_viewer = "okular"
vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"

-- binds
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- lsp
vim.lsp.enable('lua_ls')
vim.lsp.enable('texlab')

-- from nvim-lsp i need umd support
vim.lsp.config('r_language_server', {
  filetypes = { 'r', 'rmd', 'quarto', 'qmd' },
})
vim.lsp.enable('r_language_server')
