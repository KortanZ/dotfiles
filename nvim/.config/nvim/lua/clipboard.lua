local fn = vim.fn
local env = vim.env
local ssh = (env.SSH_CONNECTION or '') ~= ''
    or (env.SSH_CLIENT or '') ~= ''
    or (env.SSH_TTY or '') ~= ''

if not ssh and fn.has('wsl') == 1
    and fn.executable('clip.exe') == 1 and fn.executable('powershell.exe') == 1 then
    local paste = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = { ['+'] = 'clip.exe', ['*'] = 'clip.exe' },
        paste = { ['+'] = paste, ['*'] = paste },
        cache_enabled = 0,
    }
elseif not ssh and fn.has('macunix') == 1 then
    vim.g.clipboard = 'pbcopy'
else
    vim.g.clipboard = 'osc52'
end
