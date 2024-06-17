-- return {
--   "nvim-lualine/lualine.nvim",
--   event = "VeryLazy",
--   opts = function(_, opts)
--     local fg_color = "#36454F" -- Foreground color for the text
--
--     -- Function to determine file permissions and appropriate background color
--     local function get_permissions_color()
--       local file = vim.fn.expand("%:p")
--       if file == "" or file == nil then
--         return "No File", "#0099ff" -- Default blue for no or non-existing file
--       else
--         local permissions = vim.fn.getfperm(file)
--         -- Check only the first three characters for 'rwx' to determine owner permissions
--         local owner_permissions = permissions:sub(1, 3)
--         -- Green for owner 'rwx', blue otherwise
--         return permissions, owner_permissions == "rwx" and "#50fa7b" or "#0099ff"
--       end
--     end
--
--     -- Decide background color based on hostname's last character
--     -- These colors match my starship profile
--     local function decide_color()
--       local hostname = vim.fn.systemlist("hostname")[1]
--       local last_char = hostname:sub(-1)
--       local bg_color = "#A6AAF1" -- Default pink
--
--       if last_char == "1" then
--         bg_color = "#0DFFAE"
--       elseif last_char == "2" then
--         bg_color = "#FF6200"
--       elseif last_char == "3" then
--         bg_color = "#DBF227"
--       end
--
--       return bg_color
--     end
--
--     -- Hostname component with dynamically decided background color
--     local bg_color = decide_color()
--
--     -- Insert hostname component into lualine_x
--     table.insert(opts.sections.lualine_x, 1, {
--       "hostname",
--       color = { fg = fg_color, bg = bg_color, gui = "bold" },
--       separator = { left = "█", right = "" },
--       -- separator = { left = "", right = "" },
--       -- separator = { left = "", right = "" },
--       -- separator = { left = "", right = "" },
--       -- separator = { left = "", right = "" },
--       padding = 0,
--     })
--
--     -- File permissions component with dynamic background color
--     -- Insert file permissions component into lualine_x
--     table.insert(opts.sections.lualine_x, 1, {
--       function()
--         local permissions, _ = get_permissions_color() -- Ignore bg_color here if unused
--         return permissions
--       end,
--       color = function()
--         local _, bg_color = get_permissions_color() -- Use bg_color for dynamic coloring
--         return { fg = fg_color, bg = bg_color, gui = "bold" }
--       end,
--       -- separator = { left = "", right = "" },
--       -- separator = { left = "", right = "" },
--       -- separator = { left = "", right = "" },
--       separator = { left = "", right = "█ " },
--       -- separator = { left = "", right = "" },
--       -- separator = { left = "", right = "" },
--       -- separator = { left = "", right = "" },
--       -- separator = { left = "", right = "" },
--       padding = 0,
--     })
--   end,
-- }

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      -- blue = "#65D1FF",
      blue = "#82aaff",
      -- green = "#3EFFDC",
      green = "#c3e88d",
      violet = "#fca7ea",
      -- violet = "#FF61EF",
      yellow = "#FFc777",
      -- yellow = "#FFDA7B",

      red = "#FF757f",
      -- red = "#FF4A4A",
      fg = "#c3ccdc",
      -- fg = "#828bb8",
      -- bg = "#112638",
      bg = "#222436",
      bg1 = "#2d3f76",
      inactive_bg = "#2f334d",
      -- inactive_bg = "#2c3043",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg1, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg1, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg1, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg1, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg1, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
