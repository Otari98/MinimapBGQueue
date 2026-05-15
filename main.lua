MBGQ = {}

function MBGQ.OnClick(self, button)
	ToggleDropDownMenu(1, nil, MBGQFrameDropDown, self, 2, 2)
end

function MBGQ.JoinQueue(bg)
    SendChatMessage("."..string.lower(bg), "GUILD")
end

local info = {}
function info.clear()
	for k in pairs(info) do if k ~= "clear" then info[k] = nil end end
end

function MBGQ.DropDownInitialize()
	info.clear()
	info.text = BATTLEFIELDS
	info.isTitle = true
	UIDropDownMenu_AddButton(info)

	-- info.clear()
	-- info.text = ""
	-- info.disabled = true
	-- UIDropDownMenu_AddButton(info)

	local wsg, ab, ac, a2, a3
	for i = 1, MAX_BATTLEFIELD_QUEUES do
		local status, name = GetBattlefieldStatus(i)
		if status == "queued" or status == "confirm" or status == "active" then
            if name == "Warsong Gulch" then wsg = true
			elseif name == "Arathi Basin" then ab = true
			elseif name == "Azshara Crater" then ac = true
			elseif name == "Blackrock Massacre 2v2" then a2 = true
			elseif name == "Blackrock Massacre 3v3" then a3 = true
			end
		end
	end

	info.clear()
	info.text = "Arena 2v2"
	info.disabled = a2
	info.checked = a2
	info.func = MBGQ.JoinQueue
	info.arg1 = "arena 2"
	UIDropDownMenu_AddButton(info)
	
	info.clear()
	info.text = "Arena 3v3"
	info.disabled = a3
	info.checked = a3
	info.func = MBGQ.JoinQueue
	info.arg1 = "arena 3"
	UIDropDownMenu_AddButton(info)

	info.clear()
	info.text = "Warsong Gulch"
	info.disabled = wsg
	info.checked = wsg
	info.func = MBGQ.JoinQueue
	info.arg1 = "wsg"
	UIDropDownMenu_AddButton(info)

	info.clear()
	info.text = "Arathi Basin"
	info.disabled = ab
	info.checked = ab
	info.func = MBGQ.JoinQueue
	info.arg1 = "ab"
	UIDropDownMenu_AddButton(info)

    info.clear()
	info.text = "Azshara Crater"
	info.disabled = ac
	info.checked = ac
	info.func = MBGQ.JoinQueue
	info.arg1 = "ac"
	UIDropDownMenu_AddButton(info)
end