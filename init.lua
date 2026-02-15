-- Options
vim.g.mapleader = " "
vim.opt.autoread = true
vim.opt.clipboard = "unnamedplus"
vim.opt.equalalways = false

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/site/pack/lazy/opt/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree-config")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine-config")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope-config")
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = {},
  },
  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>z", "<cmd>MaximizerToggle<CR>", desc = "Toggle maximize window" },
    },
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("claude-code").setup({
        window = {
          position = "botright vertical",
          split_ratio = 0.4,
        },
        keymaps = {
          toggle = {
            normal = "<leader>cc",
            terminal = "<leader>cc",
          },
        },
      })
    end,
  },
}, {
  git = { filter = false },
})

-- Keybindings for nvim-tree
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
vim.keymap.set('n', '<leader>E', '<cmd>NvimTreeFindFile<CR>', { desc = 'Find file in NvimTree' })

-- Telescope keybindings
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'Help tags' })
vim.keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>', { desc = 'Recent files' })
vim.keymap.set('n', '<leader>fw', '<cmd>Telescope grep_string<CR>', { desc = 'Find word under cursor' })
vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', { desc = 'Git commits' })
vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<CR>', { desc = 'Git status' })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope resume<CR>', { desc = 'Resume last picker' })
vim.keymap.set('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = 'Search in buffer' })
vim.keymap.set('n', '<leader>*', function()
  require('telescope.builtin').current_buffer_fuzzy_find({ default_text = vim.fn.expand('<cword>') })
end, { desc = 'Search word in buffer' })
vim.keymap.set('n', '<leader>fd', function()
  local dir = vim.fn.input('Directory: ', '', 'dir')
  if dir ~= '' then
    require('telescope.builtin').find_files({ cwd = dir })
  end
end, { desc = 'Find files in directory' })
vim.keymap.set('n', '<leader>fD', function()
  local dir = vim.fn.input('Directory: ', '', 'dir')
  if dir ~= '' then
    require('telescope.builtin').live_grep({ cwd = dir })
  end
end, { desc = 'Grep in directory' })