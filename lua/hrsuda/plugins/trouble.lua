return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  -- keys = {
  --   { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
  --   { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
  --   { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
  --   { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
  --   { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
  --   { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
  -- },
  -- Lua
  vim.keymap.set("n", "<leader>xx", function()
    require("trouble").toggle()
  end),
  vim.keymap.set("n", "<leader>xw", function()
    require("trouble").toggle("workspace_diagnostics")
  end),
  vim.keymap.set("n", "<leader>xd", function()
    require("trouble").toggle("document_diagnostics")
  end),
  vim.keymap.set("n", "<leader>xq", function()
    require("trouble").toggle("quickfix")
  end),
  vim.keymap.set("n", "<leader>xl", function()
    require("trouble").toggle("loclist")
  end),
  vim.keymap.set("n", "gR", function()
    require("trouble").toggle("lsp_references")
  end),
}
