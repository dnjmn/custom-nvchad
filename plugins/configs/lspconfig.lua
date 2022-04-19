-- custom.configs.lspconfig file
local M = {}

local util = require "lspconfig/util"

local enhance_server_opts = {
   -- Provide settings that should only apply to the "eslint" server
   ["eslint"] = function(opts)
      opts.settings = {
         format = {
            enable = true,
         },
      }
   end,

   ["sumneko_lua"] = function(opts)
      opts.settings = {
         format = {
            enable = true,
         },
         diagnostics = {
            neededFileStatus = {
               ["codestyle-check"] = "Any",
            },
            globals = { 'vim' },
         },
      }
   end,

   -- ["gopls"] = function(opts)
   --    opts.settings = {
   --       gopls = {
   --          analyses = {
   --             unusedparams = true,
   --          },
   --          staticcheck = true,
   --       },
   --    }
   --    opts.cmd = { "gopls", "serve" }
   --    opts.filetypes = { "go", "gomod" }
   --    opts.root_dir = util.root_pattern("go.work", "go.mod", ".git")
   -- end,
}

local get_server_opts = {
   -- ["gopls"] = require 'go.lsp'.config()
}

M.setup_lsp = function(attach, capabilities)
   local lsp_installer = require "nvim-lsp-installer"

   lsp_installer.settings {
      ui = {
         icons = {
            server_installed = "﫟",
            server_pending = "",
            server_uninstalled = "✗",
         },
      },
   }

   lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
         settings = {},
      }

      if enhance_server_opts[server.name] then
         -- Enhance the default opts with the server-specific ones
         enhance_server_opts[server.name](opts)
      end

      if get_server_opts[server.name] then
         opts = get_server_opts[server.name]
      end

      server:setup(opts)
   end)
end

return M
