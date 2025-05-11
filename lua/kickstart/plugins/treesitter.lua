return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    lazy = false,
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    config = function()
      local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
      local local_parser_dir = vim.fn.stdpath 'config' .. '/tree-sitter/tree-sitter-snippets'

      -- vim.filetype.add {
      --   extension = {
      --     snippets = 'snippets',
      --   },
      -- }
      -- vim.treesitter.language.register('snippets', 'snippets')

      parser_config.snippets = {
        install_info = {
          url = local_parser_dir,
          files = { 'src/parser.c' }, -- note that some parsers also require src/scanner.c or src/scanner.cc
          generate_requires_npm = false, -- if stand-alone parser without npm dependencies
          requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
        },
        filetype = 'snippets',
      }
      require('nvim-treesitter').setup {
        ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'snippets' },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = {
          enable = true,
          -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
          --  If you are experiencing weird indenting issues, add the language to
          --  the list of additional_vim_regex_highlighting and disabled languages for indent.
          additional_vim_regex_highlighting = { 'ruby' },
        },
      }
      -- unglaublich...
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
