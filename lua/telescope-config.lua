local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/", "%.lock" },
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["dd"] = actions.delete_buffer,
        },
      },
    },
  },
})

telescope.load_extension("fzf")
