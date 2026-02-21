local M = {}

function M.setup()
  require('base16-colorscheme').setup {
    -- Background tones
    base00 = '#1a1a1a', -- Default Background
    base01 = '#242424', -- Lighter Background (status bars)
    base02 = '#2e2e2e', -- Selection Background
    base03 = '#666666', -- Comments, Invisibles
    -- Foreground tones
    base04 = '#eac88f', -- Dark Foreground (status bars)
    base05 = '#cdd6f4', -- Default Foreground
    base06 = '#cdd6f4', -- Light Foreground
    base07 = '#cdd6f4', -- Lightest Foreground
    -- Accent colors
    base08 = '#f7768e', -- Variables, XML Tags, Errors
    base09 = '#f7768e', -- Integers, Constants
    base0A = '#2a9999', -- Classes, Search Background
    base0B = '#eac88f', -- Strings, Diff Inserted
    base0C = '#f8879c', -- Regex, Escape Chars
    base0D = '#ebca94', -- Functions, Methods
    base0E = '#96e9e9', -- Keywords, Storage
    base0F = '#bb0023', -- Deprecated, Embedded Tags
  }
end

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
