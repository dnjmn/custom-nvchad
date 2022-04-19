local install = {
   -- { "elkowar/yuck.vim", ft = "yuck" },
   -- { "ellisonleao/glow.nvim", cmd = "Glow" },
   {
      "williamboman/nvim-lsp-installer",
      after = "nvim-lspconfig",
   },
   -- {
   --    "jose-elias-alvarez/null-ls.nvim",
   --    after = "nvim-lspconfig",
   --    config = function()
   --       require("custom.plugin_confs.null-ls").setup()
   --    end,
   -- },
   {
      "ray-x/go.nvim",
      -- config = function()
      --    require("custom.plugins.configs.go_nvim").setup()
      -- end,
   },
}

return install
