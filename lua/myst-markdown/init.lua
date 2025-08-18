-- MyST Markdown Neovim Plugin
-- Author: myst-markdown.nvim contributors
-- License: MIT

local M = {}

-- Plugin version
M.version = "0.1.0"

-- Setup function for future configuration options
function M.setup(opts)
  opts = opts or {}
  
  -- Future configuration options can be added here
  -- For now, the plugin works with default settings
end

-- Helper function to check if current buffer contains MyST syntax
function M.is_myst_buffer()
  local lines = vim.api.nvim_buf_get_lines(0, 0, 20, false)
  
  for _, line in ipairs(lines) do
    -- Check for MyST-specific patterns
    if line:match("^%s*:::") or 
       line:match("^%s*%%") or 
       line:match("^%s*%+%+%+") or 
       line:match("^%([^%)]+%)=") then
      return true
    end
  end
  
  return false
end

-- Get MyST-specific syntax information from current buffer
function M.get_myst_info()
  if not M.is_myst_buffer() then
    return nil
  end
  
  local info = {
    has_comments = false,
    has_directives = false,
    has_targets = false,
    has_block_breaks = false,
    has_colon_fences = false
  }
  
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  
  for _, line in ipairs(lines) do
    if line:match("^%s*%%") then
      info.has_comments = true
    elseif line:match("^%s*:::[%w_-]+") then
      info.has_directives = true
    elseif line:match("^%s*:::") then
      info.has_colon_fences = true
    elseif line:match("^%([^%)]+%)=") then
      info.has_targets = true
    elseif line:match("^%s*%+%+%+") then
      info.has_block_breaks = true
    end
  end
  
  return info
end

return M