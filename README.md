# TemplateValut

Neovim obsidian.nvim template vault

Requires obsidian.nvim plugin : [repo](https://github.com/obsidian-nvim/obsidian.nvim)

Put these 2 lines in `~/.config/nvim/init.lua` to allow local configs

```lua

-- Allow project-local configs
vim.opt.exrc = true   -- look for a local config in the cwd
vim.opt.secure = true -- disable unsafe commands in local configs

```
