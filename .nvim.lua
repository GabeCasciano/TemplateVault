local cwd = vim.fn.getcwd()
local cwd_name = vim.fn.fnamemodify(cwd, ":t")

-- Safe wrapper in case the plugin isn't loaded yet for non-md buffers
local ok, obsidian = pcall(require, "obsidian")
if not ok then
  return
end

obsidian.setup({
  legacy_commands = false,
  workspaces = {
    {
      name = cwd_name,
      path = function()
        return cwd
      end,           -- dynamic workspace path
      strict = true, -- treat this dir as the vault root
      overrides = {
        -- Your project-specific overrides go here
        daily_notes = {
          date_format = "%m-%d-%Y",
          alias_format = "%B %-d, %Y",
          default_tags = { "daily-notes" },
          template = "Templates/Daily to-do.md",
          folder = "Daily_Notes", -- base folder; actual month subfolder via note_path_func below
          workdays_only = true,
        },
        templates = {
          folder = "Templates",
          date_format = "%d-%m-%Y",
          time_format = "%H:%M",
        },

      },
    },
  },
})

-- return {
--   "obsidian-nvim/obsidian.nvim",
--
--   config = function()
--     require("obsidian").setup {
--       overrides = {
--         workspaces = {
--           name = cwd_name,
--           path = cwd
--         },
--
--         daily_notes = {
--           date_format = "%m-%d-%Y",
--           alias_format = "%B %-d, %Y",
--           default_tags = { "daily-notes" },
--           template = "Templates/Daily to-do.md",
--
--           folder = (function(date)
--             local d = os.date("*t", date)
--             local month_year = string.format("%02d-%d", d.month, d.year)
--             return "Daily_Notes/" .. month_year
--           end)(),
--           workdays_only = true,
--         },
--         templates = {
--           folder = "Templates",
--           date_format = "%d-%m-%Y",
--           time_format = "%H:%M",
--         },
--       }
--     }
--   end,
-- }
