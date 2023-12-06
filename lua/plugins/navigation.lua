vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

vim.opt.termguicolors = true

require("bufferline").setup({
    
    options = {

        diagnostics = "nvim_lsp",
        
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
        }},
    },
})

require("gitsigns").setup({

    signs = {

        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelet = { text = '='},
        changeddelete = { text = '~' },
    },
})
