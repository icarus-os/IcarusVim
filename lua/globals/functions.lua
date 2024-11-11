-- This file is for the global functions

-- Util functions
function Print_LSP_Clients()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  if #clients > 0 then
    print("Active LSP Clients:")
    for _, client in ipairs(clients) do
      print(string.format("Name: %s, ID: %d", client.name, client.id))
    end
  else
    print("No active LSP clients")
  end
end

-- Dump a table into a string. you can then print/notify it
function DumpTable(o)
  if type(o) == "table" then
    local s = "{ \n"
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. DumpTable(v) .. ", \n"
    end
    return s .. "\n}"
  else
    return tostring(o)
  end
end
