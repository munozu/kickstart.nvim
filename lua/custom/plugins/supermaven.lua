return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup {
      -- Enable/disable the plugin
      enabled = true,
      keymaps = {
        accept_suggestion = '<C-j>',
        accept_word = '<C-l>',
      },
    }
  end,
}
