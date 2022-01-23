local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  error("themer.lua requires nvim-telescope/telescope.nvim")
end
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")

-- Get Dir Info
local function scandir(directory)
  local i, t, popen = 0, {}, io.popen
  local pfile = popen('ls -a "' .. directory .. '"')
  for filename in pfile:lines() do
    i = i + 1
    t[i] = filename
  end
  pfile:close()
  return t
end

local function get_theme()
  local themes = {}
  local theme_dir = vim.fn.stdpath("data") .. "/site/pack/packer/opt/themer.lua/colors/"

  local fd = scandir(theme_dir)
  if fd then
    for _, file in ipairs(fd) do
      if string.find(file, "lua") then
        table.insert(themes, (file:gsub(theme_dir, ""):gsub(".lua", "")))
      end
    end
  end
  return themes
end

local function enter(prompt_bufnr)
  local selected = action_state.get_selected_entry()
  local cmd = "colorscheme " .. selected[1]
  vim.cmd(cmd)
  local colorscheme = "vim.cmd([[colorscheme " .. " " .. selected[1] .. "]])"
  vim.fn.jobstart(colorscheme)
  actions.close(prompt_bufnr)
end

local function next_color(prompt_bufnr)
  actions.move_selection_next(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  local cmd = "colorscheme " .. selection[1]
  vim.cmd(cmd)
end

local function prev_color(prompt_bufnr)
  actions.move_selection_previous(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  local cmd = "colorscheme " .. selection[1]
  vim.cmd(cmd)
end

local function preview(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  local cmd = "colorscheme " .. selection[1]
  vim.cmd(cmd)
end

local function themer(opts)
  local colors = get_theme()
  local opts = require("telescope.themes").get_dropdown({
    prompt_title = "Themer ColorScheme",
    results_title = "Change colorscheme",
    finder = finders.new_table({
      results = colors,
    }),
    previewer = false,
    attach_mappings = function(prompt_bufnr, map)
      for type, value in pairs(require("themer.config")("get").telescope_mappings) do
        for bind, method in pairs(value) do
          map(type, bind, function()
            if method == "enter" then
              enter(prompt_bufnr)
            elseif method == "next_color" then
              next_color(prompt_bufnr)
            elseif method == "prev_color" then
              prev_color(prompt_bufnr)
            elseif method == "preview" then
              preview(prompt_bufnr)
            end
          end)
        end
      end
      return true
    end,
    sorter = require("telescope.config").values.generic_sorter({}),
  })
  local colorschemes = pickers.new(opts)
  colorschemes:find()
end

return telescope.register_extension({
  exports = {
    themes = themer,
  },
})
