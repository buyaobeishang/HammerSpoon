local wm = require('window-management')
local hk = require "hs.hotkey"

-- * Key Binding Utility
--- Bind hotkey for window management.
-- @function windowBind
-- @param {table} hyper - hyper key set
-- @param { ...{key=value} } keyFuncTable - multiple hotkey and function pairs
--   @key {string} hotkey
--   @value {function} callback function
local function windowBind(hyper, keyFuncTable)
  for key,fn in pairs(keyFuncTable) do
    hk.bind(hyper, key, fn)
  end
end

-- * Move window to screen
windowBind({"", "cmd"}, {
  left = wm.throwLeft,
  right = wm.throwRight
})

-- * Set Window Position on screen
windowBind({"", "alt", "cmd"}, {
  m = wm.maximizeWindow,    -- ⌃⌥⌘ + M
  c = wm.centerOnScreen,    -- ⌃⌥⌘ + C
  left = wm.leftHalf,       -- ⌃⌥⌘ + ←
  right = wm.rightHalf,     -- ⌃⌥⌘ + →
  up = wm.topHalf,          -- ⌃⌥⌘ + ↑
  down = wm.bottomHalf      -- ⌃⌥⌘ + ↓
})
-- * Set Window Position on screen
windowBind({"", "alt", ""}, {
  left = wm.rightToLeft,      -- ⌃⌥⇧ + ←
  right = wm.rightToRight,    -- ⌃⌥⇧ + →
  up = wm.bottomUp,           -- ⌃⌥⇧ + ↑
  down = wm.bottomDown        -- ⌃⌥⇧ + ↓
})
-- * Set Window Position on screen
windowBind({"alt", "cmd", "shift"}, {
  left = wm.leftToLeft,      -- ⌥⌘⇧ + ←
  right = wm.leftToRight,    -- ⌥⌘⇧ + →
  up = wm.topUp,             -- ⌥⌘⇧ + ↑
  down = wm.topDown          -- ⌥⌘⇧ + ↓
})

-- * Windows-like cycle
windowBind({"ctrl", "alt", "cmd"}, {
  left = wm.cycleLeft,          -- ⌃⌥⌘ + u
  right = wm.cycleRight          -- ⌃⌥⌘ + i
})
