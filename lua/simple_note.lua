local api = vim.api

local M = {}

-- Default config
local default_config = {
  hotkey = "<leader>ns",
  window = {
    border = "rounded",
    width = 0.6,
    height = 0.4,
    anchor = "NW",
  },
}
local config = default_config

function M.setup(user_config)
  config = vim.tbl_deep_extend("force", {}, default_config, user_config or {})
  api.nvim_create_user_command("SimpleNote", M.open_note_popup, {})
  -- Map the hotkey in normal mode, remappable by user
  vim.keymap.set('n', config.hotkey, M.open_note_popup, { noremap=true, silent=true, desc="Open simple-note popup" })
end

local function save_and_close(buf, win, note_path)
  if api.nvim_buf_is_valid(buf) then
    local lines = api.nvim_buf_get_lines(buf, 0, -1, false)
    local f = io.open(note_path, "w")
    if f then
      for _, line in ipairs(lines) do
        f:write(line .. "\n")
      end
      f:close()
      print("Note saved to " .. note_path)
    else
      print("Failed to write note!")
    end
  end
  if api.nvim_win_is_valid(win) then
    api.nvim_win_close(win, true)
  end
  if api.nvim_buf_is_valid(buf) then
    api.nvim_buf_delete(buf, {force=true})
  end
end

local function file_exists(path)
  local f = io.open(path, "r")
  if f then io.close(f) return true else return false end
end

local function read_file_lines(path)
  local lines = {}
  local f = io.open(path, "r")
  if f then
    for line in f:lines() do
      table.insert(lines, line)
    end
    f:close()
  end
  return lines
end

function M.open_note_popup()
  local border_type = config.window and config.window.border or "rounded"
  local width_scale = config.window and config.window.width or 0.6
  local height_scale = config.window and config.window.height or 0.4
  local anchor = config.window and config.window.anchor or "NW"


  local buf = api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * width_scale)
  local height = math.floor(vim.o.lines * height_scale)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)



  local win = api.nvim_open_win(buf, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    style = "minimal",
    border = border_type,
    anchor = anchor,
  })
  vim.bo[buf].filetype = "markdown"
  local note_path = vim.fn.stdpath("data") .. "/notes.md"
  if file_exists(note_path) then
    local lines = read_file_lines(note_path)
    api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  end

  local keys = { "q", "Q", "<Esc>" }
  local opts = { noremap = true, silent = true, buffer = buf }
  for _, key in ipairs(keys) do
    vim.keymap.set('n', key, function()
      save_and_close(buf, win, note_path)
    end, opts)
  end
end



return M


