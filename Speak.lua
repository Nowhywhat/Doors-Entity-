---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Speak",
    Model = "https://github.com/Yuzixser-Script/Monster_Model/blob/main/speak.rbxm?raw=true", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 80,
    MoveDelay = 2,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    SpawnInFront = false,
    ShatterLights = false,
    FlickerLights = {
        Enabled = false,
        Duration = 1
    },
    Cycles = {
        Min = 1,
        Max = 1.5,
        Delay = 0.1
    },
    CamShake = {
        Enabled = true,
        Values = {5.5, 20, 0.1, 1},
        Range = 50
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"Custom", "death", "message", "goes", "here."},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
    local redtweeninfo = TweenInfo.new(3)
local redinfo = {Color = Color3.new(100, 0, 0)}
----------
for i,v in pairs(workspace.CurrentRooms:GetDescendants()) do
			if v:IsA("Light") then
					game.TweenService:Create(v,redtweeninfo,redinfo):Play()
					if v.Parent.Name == "LightFixture" then
						    game.TweenService:Create(v.Parent,redtweeninfo,redinfo):Play()
					end
		  end
end
end

entity.Debug.OnEntityDespawned = function()
    print("Entity has despawned")
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity started moving")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity finished rebound")
end

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity entered room:", room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player looking at entity")
end

entity.Debug.OnDeath = function()
    print("Player has died")
    game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Speak"
    local func, setupval, getinfo, typeof, getgc, next = nil, debug.setupvalue or setupvalue, debug.getinfo or getinfo, typeof, getgc, next

for i,v in next, getgc(false) do
    if typeof(v) == "function" then
        local info = getinfo(v)
        if info.currentline == 54 and info.nups == 2 and info.is_vararg == 0 then
            func = v
            break
        end
    end
end

local function DeathHint(hints, type: string)
    setupval(func, 1, hints)
    if type ~= nil then
        setupval(func, 2, type)
    end
end

DeathHint({
    "You Died To Who You",
    "Wait...",
    "Who's This New Entity?",
    "Nah Gotta Remove It ",
}, "Blue") -- "Blue" or "Yellow"
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)
