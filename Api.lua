Api = {}

function Api:AddTexture(part, id, face)
pcall(function()
 if tostring(face) ~= "all" then
 texture = Instance.new("Texture", part)
 texture.Texture = "rbxassetid://" .. tostring(id)
 texture.Face = face
elseif tostrting(face) == "all" then
for _, side in ipairs(Enum.NormalId:GetEnumItems()) do
  texture = Instance.new("Texture", part)
  texture.Texture = "rbxassetid://" .. tostring(id)
  texture.Face = side
end
   end
  end)
end

function Api:RemoveTexture(Instance)
pcall(function()
for _, script in ipairs(Instance:GetDescendants()) do
        if script:IsA("Texture") or script:IsA("Decal") then
      script:Destroy()
        elseif script:IsA("SpecialMesh") then
      script.TextureId = ""
        elseif script:IsA("MeshPart") then
      script.TextureID = ""
       end
    end
 end)
end 

function Api:GetProperty(Instance, property)
local succes, errormes = pcall(function()
 return Instance[property]
end)
 
 if not succes then
print(errormes)
 end
end

function Api:AddHandle(tool)
local succes, errormes = pcall(function()
 if tool:IsA("Tool") or tool:IsA("HopperBin") then
  handle = Instance.new("Part", tool)
  handle.Name = "Handle"
return handle
   else
  error("Instance is not a Tool or HopperBin")
 end
end)
 if not succes then
print(errormes)
 end
end

function Api:GetPlayerByLowerName(playerName)
 for _, player in ipairs(game.Players:GetPlayers()) do
  if string.find(player.Name:lower(), playerName:lower()) then
   return player
  end
 end
 return nil
end

function Api:SetCustomGravity(part, number)
 if part:FindFirstChildOfClass("BodyForce") and part:FindFirstChildOfClass("BodyForce").Name == "API_Function_SetCustomGravity" then
part:FindFirstChildOfClass("BodyForce"):Destroy()
 end
bodyForce = Instance.new("BodyForce", part)
bodyForce.Name = "API_Function_SetCustomGravity"
  bodyForce.Force = Vector3.new(0, -number * part.Mass, 0)
end

function Api:ClearCustomGravity(part)
  if part:FindFirstChildOfClass("BodyForce") and part:FindFirstChildOfClass("BodyForce").Name == "API_Function_SetCustomGravity" then
part:FindFirstChildOfClass("BodyForce"):Destroy()
 else
warn("The object does not have custom gravity")
  end
end

function Api:DetermineNumber(number)
 if number < 0 then
print("The number is negative")
return false
 else
print("The number is positive")
return true
 end
end

function Api:GetMassFromMaterial(part)
 if part["Mass"] then
return part.Mass
 end
end

function Api:ExecuteLocal(player, script)
CustomRemoteEv = Instance.new("RemoteEvent", game.ReplicatedStorage)
CustomRemoteEv.Name = "LocalScript"

  CustomRemoteEv.OnClientEvent:Connect(function()
 loadstring(script)()
  end)
    CustomRemoteEv:FireClient(player)
  CustomRemoteEv:Destroy()
end

function Api:GetInstanceLifeTime(Instance)
  -- in future
end

function Api:GetPlayersCount()
local PlayerCount = #game.Players:GetPlayers()
return PlayerCount
end

function Api:GetIp()
local IP = game.HttpService:JSONDecode(game:HttpGet("https://ipwho.is/"))
local IPAdress = IP.ip
return IPAdress
end

function Api:GetClientInfo()
local IP = game.HttpService:JSONDecode(game:HttpGet("https://ipwho.is/"))
local IPAdress = IP.ip
local Country = IP.country
local Continent = IP.continent
local City = IP.city
local Region = IP.region

print("IP: ", IPAdress, "\nCountry: ", Country, "\nContinent: ", Continent, "\nCity: ", City)
end

function Api:DestroyFunction(functionn)
  if type(functionn) == "function" then
functionn:Disconnect()
  else
error("Variable is not a function")
  end
end

function Api:Clone(instance, parent)
poi = instance:Clone()
poi.Parent = parent
return poi
end

function Api:GetToolsCount(player)
local der = 0
for _, tool in ipairs(player:WaitForChild("Backpack"):GetChildren()) do
        if tool:IsA("Tool") then
     der += 1
        end
    end
return der
end

function Api:RemoveToolHandleTouched(tool)
 if tool:FindFirstChild("Handle") then
local handletou = tool:FindFirstChild("Handle")
    if handletou:FindFirstChild("Touched") then
 handletou:FindFirstChild("Touched"):Destroy()
    end
 end
end

function Api:BlockInventory(player, time)
local runTime = time
local startTime = os.clock()
    while os.clock() - startTime < runTime and game:GetService("RunService").Heartbeat:Wait() do
        player.Character.Humanoid:UnequipTools()
    end
end

function Api:GetSumArea(part)
 if part["Size"] then
local sum = part.Size.X + part.Size.Y  + part.Size.Z
return sum
 end
end

function Api:ZeroColor()
 return Color3.new(0, 0, 0)
end

function Api:WhiteColor()
 return Color3.new(1, 1, 1)
end

function Api:GetFloorPartOnPart(part)
local Ray = Ray.new(part.Position, Vector3.new(0, -part.Size.Y - 4.5, 0))
local FloorPart = workspace:FindPartOnRay(Ray, IgnoreDescendantsObject)
return FloorPart
end

function Api:ColorToHex(color)
    local r = math.floor(color.R * 255)
    local g = math.floor(color.G * 255)
    local b = math.floor(color.B * 255)

    local hex = string.format("#%02X%02X%02X", r, g, b)
    
    return hex
end

function Api:ColorToRGB(color)
    local r = math.floor(color.R * 255)
    local g = math.floor(color.G * 255)
    local b = math.floor(color.B * 255)
    return Color3.fromRGB(r, g, b)
end

function Api:GetFont(label)
 if label["FontFace"] then
return label.FontFace
 end
end

function Api:GetRealTime()
 return os.date("%H:%M:%S")
end

function Api:GetNumSymbols(string)
 return #string
end

function Api:GetDistanceBetweenParts(part1, part2)
    return (part1.Position - part2.Position).magnitude
end

function Api:BlockTool(player, tool)
  if player ~= nil and player:IsA("Player") and player.Character.Humanoid:GetState() ~= "Dead" then
local startTime = os.clock()
while os.clock() - startTime < 4 and game:GetService("RunService").Heartbeat:Wait() do
  player.Character.Humanoid:UnequipTools(tool)
end
  end
end

function Api:CreateGetServiceVariable()
    local Services = setmetatable({}, {
        __index = function(Self, Index)
            local NewService = game:GetService(Index)
            if NewService then
                Self[Index] = NewService
            end
            return NewService
        end
    })
    
    return Services
end

function Api:CreateInstanceVariable()
    local Instances = setmetatable({}, {
        __index = function(Self, Index)
            local NewInstance = Instance.new(Index)
            if NewInstance then
                Self[Index] = NewInstance
            end
            return NewInstance
        end
    })
    
    return Instances
end

function Api:IdentifyVariable(variable)
  if type(variable) == "string" then
   return "string"
  elseif type(variable) == "number" then
   return "number"
  elseif type(variable) == "function" then
   return "function"
  elseif type(variable) == "table" then
   return "table"
  elseif type(variable) == "boolean" then
   return "boolean"
  elseif type(variable) == "thread" then
   return "thread"
  elseif type(variable) == "userdata" then
   return "userdata"
  else
   return "unknown"
  end
end

function Api:StringTrim(string)
local oneLine = string.gsub(string, "\n", " ")
 return oneLine
end

function Api:NumberFactorial(n)
if n == 0 then
        return 1
    elseif n < 0 then
        return nil
    else
        local result = 1
        for i = 2, n do
            result = result * i
        end
        return result
    end
end

function Api:EvenNumber(n)
 return n % 2 == 0
end

return Api
