local hotkey = require "hs.hotkey"
local grid = require "hs.grid"
local window = require "hs.window"
local application = require "hs.application"
local appfinder = require "hs.appfinder"
local fnutils = require "hs.fnutils"

grid.setMargins({0, 0})

applist = {
    {shortcut = 'I',appname = 'IntelliJ IDEA'},
    {shortcut = 'D',appname = 'DataGrip'},
    {shortcut = 'C',appname = 'Google Chrome'},
    {shortcut = 'B',appname = 'Notes'},
    {shortcut = 'S',appname = 'com.rocket.9ac52070'},
    {shortcut = 'T',appname = 'com.torusknot.SourceTreeNotMAS'},
    {shortcut = 'F',appname = 'Finder'},
    {shortcut = '.',appname = 'Activity Monitor'},
    {shortcut = 'P',appname = 'System Preferences'},
}

fnutils.each(applist, function(entry)
    hotkey.bind({'', 'cmd', 'shift'}, entry.shortcut, entry.appname, function()
        -- 单次调出
        -- application.launchOrFocus(entry.appname)
        toggle_application(entry.appname)
    end)
end)

-- Toggle an application between being the frontmost app, and being hidden
function toggle_application(_app)
    local app = appfinder.appFromName(_app)
    if not app then
        application.launchOrFocus(_app)
        return
    end
    local mainwin = app:mainWindow()
    if mainwin then
        if mainwin == window.focusedWindow() then
            mainwin:application():hide()
        else
            mainwin:application():activate(true)
            mainwin:application():unhide()
            mainwin:focus()
        end
    end
end