-- return {
--   "nvim-treesitter/nvim-treesitter",
--   event = { "BufReadPre", "BufNewFile" },
--   build = ":TSUpdate",
--   dependencies = {
--     "windwp/nvim-ts-autotag",
--   },
--   config = function()
--     -- import nvim-treesitter plugin
--     local treesitter = require("nvim-treesitter.configs")
--
--     -- configure treesitter
--     treesitter.setup({ -- enable syntax highlighting
--       highlight = {
--         enable = true,
--       },
--       -- enable indentation
--       indent = { enable = true },
--       -- enable autotagging (w/ nvim-ts-autotag plugin)
--       autotag = {
--         enable = true,
--       },
--       -- ensure these language parsers are installed
--       ensure_installed = {
--         "json",
--         "javascript",
--         "typescript",
--         "tsx",
--         "yaml",
--         "html",
--         "css",
--         "prisma",
--         "markdown",
--         "markdown_inline",
--         "svelte",
--         "graphql",
--         "bash",
--         "lua",
--         "vim",
--         "dockerfile",
--         "gitignore",
--         "query",
--         "vimdoc",
--         "c",
--       },
--       incremental_selection = {
--         enable = true,
--         keymaps = {
--           init_selection = "<C-space>",
--           node_incremental = "<C-space>",
--           scope_incremental = false,
--           node_decremental = "<bs>",
--         },
--       },
--     })
--   end,
-- }
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({
      highlight = {
        enable = true, -- enable syntax highlighting
      },
      indent = { enable = true }, -- enable indentation
      autotag = { enable = true }, -- enable autotagging (w/ nvim-ts-autotag plugin)
      ensure_installed = { -- ensure these language parsers are installed
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      fold = { enable = true }, -- enable folding
    })

    -- Treesitter folding settings
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    vim.o.foldlevel = 99 -- Start with all folds open
    --
    _G.custom_fold_text = function()
      local first_line = vim.fn.getline(vim.v.foldstart)
      local fold_start_characters = first_line:sub(1, 30) -- get the first 30 characters
      local lines_count = vim.v.foldend - vim.v.foldstart + 1
      return "Folded: " .. fold_start_characters .. " ... " .. lines_count .. " lines"
    end

    -- Set custom fold text
    vim.wo.foldtext = "v:lua.custom_fold_text()"
    --
    -- Custom fold text suffix function
    -- local function get_custom_foldtxt_suffix(foldstart)
    --   local fold_suffix_str = string.format("  %s [%s lines]", "┉", vim.v.foldend - foldstart + 1)
    --   return { fold_suffix_str, "Folded" }
    -- end

    -- -- Set custom fold text
    -- vim.wo.foldtext = "v:lua.get_custom_foldtxt_suffix(v:foldstart)"

    -- Folding keybindings
    vim.api.nvim_set_keymap("n", "zR", "zR", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "zM", "zM", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "zo", "zo", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "zc", "zc", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "za", "za", { noremap = true, silent = true })
  end,
}
