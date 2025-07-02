-- notebook nav
return {
  'echasnovski/mini.hipatterns',
  event = 'VeryLazy',
  dependencies = { 'nwpulverizer/NotebookNavigator.nvim' },
  opts = function()
    local nn = require 'notebook-navigator'

    local opts = { highlighters = { cells = nn.minihipatterns_spec } }
    return opts
  end,
}
