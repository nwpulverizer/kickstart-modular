return {
  'echasnovski/mini.ai',
  event = 'VeryLazy',
  dependencies = { 'nwpulverizer/NotebookNavigator.nvim' },
  opts = function()
    local nn = require 'notebook-navigator'

    local opts = { custom_textobjects = { h = nn.miniai_spec } }
    return opts
  end,
}
