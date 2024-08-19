
-- import gitsigns plugin safely
local setup, cursor = pcall(require, "smoothcursor")
if not setup then
	return
end

cursor.setup()
