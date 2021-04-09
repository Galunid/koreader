local InfoMessage = require("ui/widget/infomessage")
local Blitbuffer = require("ffi/blitbuffer")
local UIManager = require("ui/uimanager")
local WidgetContainer = require("ui/widget/container/widgetcontainer")
local ImageWidget = require("ui/widget/imagewidget")
local _ = require("gettext")

local NoteTaking = WidgetContainer:new{
    name = "NoteTaking",
    is_doc_only = false,
}


local bb = Blitbuffer.new(600, 300)
bb:paintRect(0, 0, 100, 100, Blitbuffer.COLOR_WHITE)
bb:paintRect(0,0,50,50,Blitbuffer.BLACK)
bb:paintRect(500, 0, 10, 10, Blitbuffer.COLOR_WHITE)

local Im = ImageWidget:new{
    image = bb
}

function NoteTaking:init()
    self.ui.menu:registerToMainMenu(self)
end

function NoteTaking:addToMainMenu(menu_items)
    menu_items.note_taking = {
        text = _("Note Taking"),
        -- in which menu this should be appended
        sorting_hint = "more_tools",
        -- a callback when tapping
        callback = function()
            UIManager:show(Im)
        end,
    }
end

return NoteTaking
