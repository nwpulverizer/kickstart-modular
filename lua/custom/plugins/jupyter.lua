return {
  --[[
--Jupyter stuff for neovim. We need image.nvim as an image provider so we can see results from plots in the terminal. Next we need molten.nvim which is a fork of magma.nvim that supports the kitty terminal image protocol with image.nvim and is more actively maintained.
--]]
  {
    '3rd/image.nvim',
    build = true, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
      processor = 'magick_cli',
      -- image nvim options table. Pass to `require('image').setup`
      backend = 'kitty', -- Kitty will provide the best experience, but you need a compatible terminal
      integrations = {}, -- do whatever you want with image.nvim's integrations
      max_width = 100, -- tweak to preference
      max_height = 12, -- ^
      max_height_window_percentage = math.huge, -- this is necessary for a good experience
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
      hijack_file_patterns = { '*.png', '*.jpg', '*.jpeg', '*.webp', '*.avif' }, -- render image files as images when opened
    },
  },
  {
    'nvimtools/hydra.nvim',
    config = function()
      -- create hydras in here
    end,
  },
  {
    'benlubas/molten-nvim',
    version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
    build = ':UpdateRemotePlugins',
    init = function()
      -- this is an example, not a default. Please see the readme for more configuration options
      -- vim.g.molten_output_win_max_height = 12
      vim.g.molten_image_provider = 'image.nvim'
      vim.g.molten_wrap_output = true
    end,
  },
  {
    'nwpulverizer/NotebookNavigator.nvim',
    keys = {
      {
        ']h',
        function()
          require('notebook-navigator').move_cell 'd'
        end,
      },
      {
        '[h',
        function()
          require('notebook-navigator').move_cell 'u'
        end,
      },
      { '<leader>X', "<cmd>lua require('notebook-navigator').run_cell()<cr>", desc = 'Run notebook cell' },
      { '<leader>x', "<cmd>lua require('notebook-navigator').run_and_move()<cr>", desc = 'Run notebook cell and move' },
    },
    dependencies = {
      'echasnovski/mini.comment',
      'benlubas/molten-nvim', -- alternative repl provider
      'nvimtools/hydra.nvim',
    },
    event = 'VeryLazy',
    config = function()
      local nn = require 'notebook-navigator'
      nn.setup { activate_hydra_keys = '<leader>p' }
    end,
  },
}
