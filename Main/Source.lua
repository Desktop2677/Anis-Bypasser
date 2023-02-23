-- // Wait until game loaded to make sure bypasses will work!
repeat wait() until game:IsLoaded()

-- // Locals
local gpi = game.PlaceId

-- // Function
function GameBypassed()
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Anis Bypasser", -- Required
	Text = "Bypassed "..game.Name.."'s anticheat!", -- Required
})
end

-- // Game table
local Games = {
    Main = {
        TowerofHell = 1962086868,
        Skywars = 855499080,
        RoMeet = 6062977619,
        ZeppelinWars = 5024793931,
        TowerofMisery = 4954752502,
        BadBusiness = 3233893879,
        Arsenal = 286090429,
        YBA = 2809202155,
        DaHood = 2788229376,
        Fallen = 2506738224
    }
}

-- // Tower Of Hell
if gpi == Games.Main.TowerofHell then
    GameBypassed()
	for a,b in pairs(getgc()) do 
		if typeof(b) == 'function' then 
			if debug.getinfo(b).name == 'kick' then 
				hookfunction(debug.getinfo(b).func, function()
					print'game tried to kick'
				end)
			end
		end 
	end 
elseif gpi == Games.Main.Skywars then
-- // Skywars
repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Extra")
GameBypassed()
pcall(function()
    
	for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Extra:GetChildren()) do
		if string.find(v.Name, "Sploit") then
			v:Destroy()
		end
	end
	Workspace.DescendantAdded:Connect(function(v)
		if string.find(v.Name, "Sploit") then
			v:Destroy()
		end
	end)
	for i, v in pairs(game:GetService("StarterGui").Extra:GetChildren()) do
		if string.find(v.Name, "Sploit") then
			v:Destroy()
		end
	end
	game:GetService("Workspace").Lobby.KillPlates:Destroy()
end)
elseif gpi == Games.Main.RoMeet then
-- // Ro-meet: Talk to Strangers
local ya = getrawmetatable(game)
local mum = ya.__namecall
setreadonly(ya, false)
ya.__namecall = newcclosure(function(name, ...)
	local tabs = {...}
	if getnamecallmethod() == "FireServer"  and tostring(name) == "AC" or getnamecallmethod() =="Kick" then
		return wait(9e9)
	end
	return mum(name, unpack(tabs))
end)
GameBypassed()
elseif gpi == Games.Main.ZeppelinWars then
-- // Zeppelin Wars
local mt = getrawmetatable(game)
setreadonly(mt, false)

local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
   local method = getnamecallmethod()
   local args = {...}

   if method == "FireServer" then
       if tostring(self) == "SettingEvent" then
           if args[1] == "CL" then
               return warn("[SECURITY] Blocked Event: SettingEvent");
           end
       elseif tostring(self) == "KickEvent" then
           if not args[1] then return warn("[SECURITY] Blocked Function: Kick()") else return warn("[SECURITY] Blocked Function: Kick() with " .. args[1] .. " reason.") end
       elseif tostring(self) ~= "KickEvent" and tostring(self) ~= "SettingEvent" then
            return namecall(self, table.unpack(args))
       end
   else
       return namecall(self, table.unpack(args))
   end
end)
GameBypassed()
elseif gpi == Games.Main.TowerofMisery then
-- // Tower of Misery
local Character = game.Players.LocalPlayer.Character

Character:WaitForChild("Cheat Detector")["Security Lock"].Disabled = true
Character:WaitForChild("Cheat Detector")["Event Handler"].Disabled = true
Character:WaitForChild("Cheat Detector")["Regular Checks"].Disabled = true
Character:WaitForChild("Cheat Detector")["Change Signals"].Disabled = true

game.Players.LocalPlayer.CharacterAdded:Connect(function(Char)
	Char:WaitForChild("Cheat Detector"):WaitForChild("Security Lock").Disabled = true
	Char:WaitForChild("Cheat Detector"):WaitForChild("Event Handler").Disabled = true
	Char:WaitForChild("Cheat Detector"):WaitForChild("Regular Checks").Disabled = true
	Char:WaitForChild("Cheat Detector"):WaitForChild("Change Signals").Disabled = true
end)
GameBypassed()
elseif gpi == Games.Main.BadBusiness then
-- // Bad Business
for i, v in next, getgc() do
	if type(v) == "function" and islclosure(v) and (not is_synapse_function(v)) then
		getfenv(v)
	end
end
GameBypassed()
elseif gpi == Games.Main.Arsenal then
-- // Arsenal
local mt = getrawmetatable(game);
local old = mt.__namecall

local rstorage = game:GetService("ReplicatedStorage");
local Events = rstorage.Events;
local FallDamage = Events.FallDamage;
local Kick = Events.Kick;
local HitPart = Events.HitPart;
local BeanBoozled = rstorage.BeanBoozled;
local Client = game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client;
local BanBoi = game:GetService("Players").LocalPlayer.PlayerGui.BanBoi.Ban;
local FallDamage = game:GetService("ReplicatedStorage").Events.FallDamage;


setreadonly(mt, false);

mt.__namecall = newcclosure(function(self,...)
    local args = {...}
    local method = args[#args]
	
	if (self == FallDamage and method:find('FireServer')) then 
		return wait(9e9);
	end
	
    if (self == Kick or self == FallDamage) and string.lower(method) == 'fireserver' then 
        print(self, ...)
		return wait(9e9);
    end
	if self == HitPart and string.lower(method) == 'fireserver' then
		if args[1] == "ban" then
			print(self, ...)
			return wait(9e9);
		else 
			return old(self, ...);
		end
	end
	if self == BeanBoozled and string.lower(method) == 'fireserver' then
		return wait(9e9);
	end
	if (self == Client or self == BanBoi) and string.lower(method) == 'destroy' then
		return wait(9e9)
	end

    return old(self, ...)
end)

wait(1)

local player = game.Players.LocalPlayer
local storage = game.ReplicatedStorage
local dirtyRemotes = {"NewYear", "hmm", "Whizz", "Kick", "ApplyVel", "YouGotXP", "Flames", "ReplicateGear", "GetMapVote", "Vote", "DoVotekick", "TCtullysBigStinkyEvent2", "TCtullysBigStinkyEvent", "MoreFreeBadgesEnjoy", "COMMAND", "Fire", "BurnMe", "ForceTeam", "SCP", "Glitch", "ThrowBall"}

for _, v in pairs(player.PlayerGui.Menew:GetChildren()) do
	if v:IsA("BindableEvent") then
		v:Destroy()    
	end
end

for _, v in pairs(player.PlayerGui:GetChildren()) do
	if v:IsA("BindableEvent") then
		v:Destroy()    
	end
end

for _, v in pairs(storage:GetChildren()) do
	if v:IsA("RemoteEvent") or v:IsA("BindableEvent") then
		v:Destroy()    
	end
end

for _, v in pairs(storage.Modules:GetChildren()) do
	if v.Name == "ping" or v.Name == "Sound" or v.Name == "Teams" then
	end
	v:Destroy()
end

for _, v in pairs(storage.SCRIPT:GetChildren()) do
	v:Destroy()
end

for _, v in pairs(storage.Functions:GetChildren()) do
	if v.Name == "Ping" then
	end
	v:Destroy()
end


for _, v in pairs(storage.Events:GetChildren()) do
	if v:IsA("RemoteFunction") or v:IsA("BindableEvent") then
		if v.Name == "GetPing" or v.Name == "GetInventory" or v.Name == "AssetStreaming" or v.Name == "Redeem" then
		end
		v:Destroy()
	end


end

for _, v in pairs(dirtyRemotes) do
	storage.Events[v]:Destroy()
end

for _, v in pairs(storage:GetChildren()) do
	if v:IsA("ModuleScript") then
		if v.Name == "KillEffects" then
		end
		v:Destroy()
	end
end

for _, v in pairs(storage:GetChildren()) do
	if v:IsA("Script") then
		v:Destroy()
	end
end

for _, v in pairs(storage:GetChildren()) do
	if v:IsA("RemoteFunction") then
		v:Destroy()
	end
end
GameBypassed()
elseif gpi == Games.Main.YBA then
-- // Your Bizzare Adventure
local function main(f)
	if typeof(f) == "function" then
		local UpValues = debug.getupvalues(f)
		local Constants = debug.getconstants(f)
		local Protos = debug.getprotos(f)
		for _, Proto in next, Protos do
			main(Proto)
		end
		for _, UpValue in next, UpValues do
			if typeof(UpValue) == "function" then
				main(Proto)
			else
				if (_ == 15 or _ == 19) and typeof(UpValue) == "string" then
					debug.setupvalue(f, _, "hacked")
				end
			end
		end
	end
end
for _, func in next, getgc() do
	if islclosure(func) then
		local _ENV = getfenv(func)
		local Script = _ENV.script
		if Script and Script.Name == "Client" then
			main(func)
		end
	end
end
local __namecall __namecall = hookmetamethod(game, "__namecall", function(...)
	local Args = {...}
	if getnamecallmethod() == "InvokeServer" and Args[4] == "hacked" then
		return "hacked"
	end
	return __namecall(...)
end)

local old = math.random
setreadonly(math, false)
math.random = function(...)
	local args = {...}
	if args[1] == 5 or args[1] == 7 then
		return 999
	end
	return old(...)
end
setreadonly(math, true)
GameBypassed()
elseif gpi == Games.Main.DaHood then
-- // Da Hood Bypasser
assert(getrawmetatable)
grm = getrawmetatable(game)
setreadonly(grm, false)
old = grm.__namecall
grm.__namecall = newcclosure(function(self, ...)
    local args = {...}
    if tostring(args[1]) == "TeleportDetect" then
        return
    elseif tostring(args[1]) == "CHECKER_1" then
        return
    elseif tostring(args[1]) == "CHECKER" then
        return
    elseif tostring(args[1]) == "GUI_CHECK" then
        return
    elseif tostring(args[1]) == "OneMoreTime" then
        return
    elseif tostring(args[1]) == "checkingSPEED" then
        return
    elseif tostring(args[1]) == "BANREMOTE" then
        return
    elseif tostring(args[1]) == "PERMAIDBAN" then
        return
    elseif tostring(args[1]) == "KICKREMOTE" then
        return
    elseif tostring(args[1]) == "BR_KICKPC" then
        return
    elseif tostring(args[1]) == "BR_KICKMOBILE" then
        return
    end
    return old(self, ...)
end)
GameBypassed()
elseif gpi == Games.Main.Fallen then
-- // Fallen Bypasser
game.Players.LocalPlayer.UserId = 47983795
wait()
local namecall; namecall = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    
    if method == "FireServer" and self.Name == "BanExploiter" then 
        return 
    elseif method == "GetChildren" and self.Name == "Remotes" then 
        return {}
    end 
    
    return namecall(self,unpack(args))
end)
GameBypassed()
else
-- // Universal Bypasser
-- adonis
local Namecall
Namecall = hookmetamethod(game, '__namecall', function(self, ...)
    local Method = getnamecallmethod()
   
    if tostring(getcallingscript()) == 'ClientMover' and Method == 'GetService' then
        return
    end
   
    return Namecall(self, ...)
end)

-- fly bypass
local plr = game:GetService("Players").LocalPlayer;

local old;
old = hookmetamethod(game, "__index", function(self, key)
   if not checkcaller() and key == "PlatformStand" and self.ClassName == "Humanoid" and self.Parent and plr.Character and self.Parent == plr.Character then -- Prevents PlatformStanding detections
       return false
   end
   return old(self, key)
end)

game.DescendantAdded:Connect(function(d)
   if d.ClassName:find("Body") and plr.Character and d:IsDescendantOf(plr.Character) then
       
       local old_idx;
       local old_nc;
       
       old_idx = hookmetamethod(d, "__index", newcclosure(function(self, ...) -- Prevent indexing (checking properties, name, etc)
           if not checkcaller() and self == d then
               local s,e = pcall(old_idx, self, ...)
               
               if not s then
                   return error(e)
               end
               return
           end
           return old_idx(self, ...)
       end))
       
       old_nc = hookmetamethod(d, "__namecall", newcclosure(function(self, ...) -- Prevent namecalling (functions)
           if not checkcaller() and self == d then
               local s,e = pcall(old_nc, self, ...)
               
               if not s then
                   return error(e)
               end
               return
           end
           return old_nc(self, ...)
       end))
   end
end)

-- walkspeed and jumppower
local mt = getrawmetatable(game)
local oldindex = mt.__index
local oldnewindex = mt.__newindex
setreadonly(mt, false)

local hum = game:service'Players'.LocalPlayer.Character.Humanoid
local oldws = hum.WalkSpeed
local oldjp = hum.JumpPower

mt.__newindex = newcclosure(function(t, k, v)
    if checkcaller() then
        return oldnewindex(t,k,v)
    elseif (t:IsA'Humanoid' and k == "WalkSpeed") then
        v = tonumber(v)
        if not v then v = 0 end
        oldws = v
    elseif (t:IsA'Humanoid' and k == "JumpPower") then
        v = tonumber(v)
        if not v then v = 0 end
        oldjp = v
    else
        return oldnewindex(t,k,v)
    end
end)

mt.__index = newcclosure(function(t, k)
    if checkcaller() then
        return oldindex(t,k)
    elseif (t:IsA'Humanoid' and k == "WalkSpeed") then
        return oldws
    elseif (t:IsA'Humanoid' and k == "JumpPower") then
        return oldjp
    else
        return oldindex(t,k)
    end
end)

setreadonly(mt, true)

-- noclip (shit bypass)
local statetype = Enum.HumanoidStateType
local rnd = Random.new():NextInteger(150, 100000)
local mt = getrawmetatable(statetype)
local mt_index = mt.__index
setreadonly(mt, false)

mt.__index = newcclosure(function(t, k)
    if not checkcaller() and t == statetype and k == "StrafingNoPhysics" then
        return rnd
    end

    return mt_index(t, k)
end)

setreadonly(mt, true)
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Anis Bypasser", -- Required
	Text = "Bypassed universal anticheat!", -- Required
})
end
