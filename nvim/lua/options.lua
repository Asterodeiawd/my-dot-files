require "nvchad.options"

-- add yours here!
-- if vim.fn.has "wsl" then
--   vim.g.clipboard = {
--     name = "WslClipboard",
--
--     copy = {
--       ["+"] = "/mnt/c/Windows/System32/clip.exe",
--       ["*"] = "/mnt/c/Windows/System32/clip.exe",
--     },
--     paste = {
--       ["+"] = '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).toString().replace("`r", ""))',
--
--       ["*"] = '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).toString().replace("`r", ""))',
--     },
--   }
-- end
-- -- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
