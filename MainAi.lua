local AI = {}
AI.__index = AI


local Actions = {
	"Searching",
	"Attacking",
	"Moving",
}

local V3 = Vector3.new


function AI.new(MaxHealth, Level, Size)
	local Stats = {}
	setmetatable(Stats, AI)
	
	AI.Size = V3(Size, Size, Size)
	AI.Level = Level
	AI.MaxHealth = MaxHealth
	AI.Action = "Searching"
	
	return Stats
end

function AI:FindNearestPlayer(Radius)
		
	local List = game.Players:GetChildren()
	local Dist = Radius
	local Temp
	local Found
	
	for i = 1, #List do
		
		Temp = List[i].Character
		
		if not List[i].Humanoid.Health < 1 then
			
			if (AI.Body.Position - Temp.PrimaryPart.Position).Magnitude <= Dist then
				
				Dist = (AI.Body.Position - Temp.PrimaryPart.Position).Magnitude
				
				
			end
		end
	end
	
	Found = Temp
	
	return Found
end

function AI:Prowl()
	
	while AI.Target == nil do
		
	end
	
end

function AI:ComeToLife(Spawn)
	local Model = Instance.new("Model")
	Model.Parent = game.Workspace
	
	local Part = Instance.new("Part")
	Part.Size = AI.Size
	Part.Parent = Model
	Part.Name = "Core"
	
	Model.PrimaryPart = Part
	Model:SetPrimaryPartCFrame(Spawn.CFrame * CFrame.new(0,((Spawn.Size.Y/2) + (Part.Size.Y/2)),0))
	
	
	
	local Config = Instance.new("Configuration")
	Config.Parent = Model
	
	for i, v in pairs(AI) do
		
		if type(v) == "number" then
			
			local NumberValue = Instance.new("NumberValue")
			
			NumberValue.Name = i
			NumberValue.Value = v
			NumberValue.Parent = Config
			
		elseif type(v) == "string" then
			
			local StringValue = Instance.new("StringValue")
			
			StringValue.Name = i
			StringValue.Value = v
			StringValue.Parent = Config
						
		end
	end
	
	AI.Body = Model.PrimaryPart
	AI.Target = nil
	
end




local Npc = AI.new(100, 20, 2)
Npc:ComeToLife(game.Workspace.Spawn)
Npc:FindNearestPlayer(30)