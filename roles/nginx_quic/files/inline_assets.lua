-- /etc/nginx/inline_assets.lua
local function read_file(path)
    local f = io.open(path, "r")
    if not f then return nil end
    local c = f:read("*a"); f:close(); return c
end

local function inline_assets(html)
    -- Inline <link rel="stylesheet" ...>
    html = html:gsub('<link.-href="(.-%.css)".->', function(href)
        local css = read_file("/mnt/wordpress" .. href)
        return css and ("<style>" .. css .. "</style>")
               or ("<!-- failed to inline: " .. href .. " -->")
    end)

    -- Inline external <script src="..."></script>
    html = html:gsub('<script.-src="(.-%.js)".->%s*</script>', function(src)
        local js = read_file("/mnt/wordpress" .. src)
        return js and ("<script>" .. js .. "</script>")
               or ("<!-- failed to inline: " .. src .. " -->")
    end)

    return html
end

------------------------------------------------------------
-- body-filter entry point
------------------------------------------------------------
-- Buffer chunks in ctx until eof == true
local chunk, eof   = ngx.arg[1], ngx.arg[2]
local buf = ngx.ctx.buffered_body

if not buf then
    buf = {}
    ngx.ctx.buffered_body = buf
end

if chunk ~= "" then
    buf[#buf + 1] = chunk
    ngx.arg[1] = nil      -- swallow chunk for now
end

if eof then
    local whole = table.concat(buf)
    ngx.ctx.buffered_body = nil
    ngx.arg[1] = inline_assets(whole)
    ngx.arg[2] = true     -- final chunk
end
