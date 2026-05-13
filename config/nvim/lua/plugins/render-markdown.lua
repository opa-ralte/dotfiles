return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons', -- NvChad uses devicons by default
        },
        ft = { 'markdown' }, -- only load on markdown files
        opts = {
            latex = {
                enabled = true,
                converter = 'latex2text',
            }
        },
    },
}
