

-- import gitsigns plugin safely
local setup, rayso = pcall(require, "rayso")
if not setup then
	return
end

rayso.setup({
  open_cmd = 'chromium',
  options = {
    theme = 'midnight',
  }
})
