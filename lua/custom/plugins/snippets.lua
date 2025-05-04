return {
  {
    'SirVer/ultisnips',
    init = function()
      vim.g.UltiSnipsSnippetDirectories = {
        vim.fn.stdpath 'config' .. '/snippets/UltiSnips',
      }
    end,
  },
  {
    'quangnguyen30192/cmp-nvim-ultisnips',
    config = function()
      -- optional call to setup (see customization section)
      require('cmp_nvim_ultisnips').setup {}
    end,
    -- If you want to enable filetype detection based on treesitter:
    requires = { 'nvim-treesitter/nvim-treesitter' },
    lazy = false,
  },
  {
    'saghen/blink.compat',
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = '*',
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },
}
