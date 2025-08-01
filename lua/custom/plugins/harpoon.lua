return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon.setup {}

    local conf = require('telescope.config').values

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon: [a]dd' })

    vim.keymap.set('n', '<leader>e', function()
      toggle_telescope(harpoon:list())
    end, { desc = '[H]arpoon: open' })

    vim.keymap.set('n', '<leader>r', function()
      harpoon:list():remove()
    end, { desc = 'Harpoon: [R]emove' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>j', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon: Previous buffer' })
    vim.keymap.set('n', '<leader>k', function()
      harpoon:list():next()
    end, { desc = 'Harpoon: Next buffer' })
  end,
}
