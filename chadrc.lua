-- Just an example, supposed to be placed in /lua/custom/
-- make sure you maintain the structure of `core/default_config.lua` here,

local M = {}

-- example of changing theme:
M.ui = {
   theme = "gruvbox",
}

M.mappings = {
   plugins = {
      bufferline = {
         prev_buffer = "<S-H>",
         next_buffer = "<S-L>",
      },
   },
}

M.options = {
   shiftwidth = 3,
   relativenumber = true,
   expandtab = true,
   tabstop = 3,
}

-- plugins
M.plugins = {
   install = require "custom.plugins",
   default_plugin_remove = {
      -- "akinsho/bufferline.nvim",
      -- "norcalli/nvim-colorizer.lua",
      -- "neovim/nvim-lspconfig",
   },

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.configs.lspconfig", -- or any path
      },
      statusline = {
         style = "slant", -- default, round , slant , block , arrow
      },
   }
}

return M
