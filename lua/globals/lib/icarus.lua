-- ICARUS MACROS

local utils = require("globals.lib.utils")

-- Put this in the 'dependencies'
-- tbl: {
--   [1]: string representing the plugin name that is being hooked to (not the plugin string, but the plugin name)
--   pre_load: function of what to do before the loading of the plugin
--   on_load: function of what to do on load of the plugin
--   from_dependency: string or none representing the dependency name that is being hooked from
--   additional_dependency_data: table containing the rest of the data outside of just `config`
-- }
function PlugHook(tbl)
  tbl.pre_load = tbl.pre_load or function() end
  tbl.on_load = tbl.on_load or function() end
  tbl.from_dependency = tbl.from_dependency or "AmeerArsala/absolute-placeholder.nvim"
  tbl.additional_dependency_data = tbl.additional_dependency_data or {}

  local ret = {
    tbl.from_dependency,
    config = function()
      tbl.pre_load()
      LazyVim.on_load(tbl[1], tbl.on_load)
    end,
  }

  return utils.merge_tables(ret, tbl.additional_dependency_data)
end

-- Simply putting `NOTIFY_` in front of `PlugHook` will log it
function NOTIFY_PlugHook(tbl)
  tbl.pre_load = tbl.pre_load or function() end
  tbl.on_load = tbl.on_load or function() end

  local preload = tbl.pre_load
  local onload = tbl.on_load

  tbl.pre_load = function()
    vim.notify("pre_load: " .. tbl[1])
    preload()
  end

  tbl.on_load = function()
    vim.notify("on_load: " .. tbl[1])
    onload()
  end

  return PlugHook(tbl)
end
