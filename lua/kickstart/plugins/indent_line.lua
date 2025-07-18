return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      indent = {
        char = '·',
        -- tab_char = { 'a', 'b', 'c' },
        -- highlight = { 'Function', 'Label' },
      },
    },
  },
}
