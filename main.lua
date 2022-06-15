local prefix = "?"
local plr = game.Players.LocalPlayer

plr.Chatted:Connect(function(msg)
	msg = msg:lower()
	if string.sub(msg,1,3) == "/e " then
		msg = string.sub(msg,4)
	end
	if string.sub(msg,1,1) == prefix then
		local cmd
		local space = string.find(msg," ")
		if space then
			cmd = string.sub(msg,2,space-1)
		else
			cmd = string.sub(msg,2)
		end
		
		-----// COMMANDS //-----
		if cmd == "print" then
            local msgToPrint = string.sub(msg, space + 1)
            print(msgToPrint)
        elseif cmd == "rejoin" then
            local teleportService = game:GetService("TeleportService")
            teleportService:Teleport(game.PlaceId, plr)
        elseif cmd == "give" then
            local gunToGive = string.sub(msg, space + 1)
            for i, v in pairs(game.Workspace.Prison_ITEMS.giver:GetChildren()) do
                if v.Name == gunToGive then
                    game.Workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
                end
            end
        end
        
        ------------------------
		
	end
end)

function GetPlayer(String)
    local plr
    local strl = String:lower()
        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() then
                plr = v
            end 
        end
        if String == "me" then
                plr = game.Players.LocalPlayer
            end
        if String == "" or String == " " then
           plr = nil
        end
    return plr
end
