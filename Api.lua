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

function Api:HumanoidHeal(humanoid, number)
 if humanoid ~= nil and humanoid:IsA("Humanoid") and humanoid:GetState() ~= "Dead" then
   humanoid.Health += number
 end
end

function Api:HumanoidRestore(humanoid)
 if humanoid ~= nil and humanoid:IsA("Humanoid") and humanoid:GetState() ~= "Dead" then
   humanoid.Health = humanoid.MaxHealth
 end
end

function Api:TeleportTo(Instance1, Instance2)
  if Instance1 ~= nil and Instance2 ~= nil and Instance1["Position"] and Instance2["Position"] then
   Instance1.Position = Instance2.Position
  end
end

function Api:CreateChat(character, message)
game:GetService("Chat"):Chat(character, message, Enum.ChatColor.White)
end

function Api:TemporaryImmortal(humanoid, time)
 if humanoid ~= nil and time >= 0 then
    if humanoid:IsA("Humanoid") and humanoid:GetState() ~= "Dead" then
 humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
  task.delay(time, function()
 pcall(function()
humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
 end)
  end)
    end
  end
end

function Api:IdentifyPosition(variable)
 if typeof(variable) == "Vector3" then
return "Vector3"
 elseif typeof(variable) == "CFrame" then
return "CFrame"
 end
end

function Api:GetLaunchTime()
  return math.floor(workspace.DistributedGameTime)
end

function Api:ldentifyValueType(variable)
 local value = typeof(variable)
 return value
end

function Api:NumberToHex(number)
 if type(number) == "number" then
return string.format("%X", number)
 end
end

function Api:NumberToBinary(num)
 if type(num) == "number" then
       if num == 0 then return "0" end
       local binary = ""
       while num > 0 do
           binary = (num % 2) .. binary
           num = math.floor(num / 2)
       end
       return binary
 end
end

function Api:AverageArithmetic(tbl)
local sum = 0
       for _, v in ipairs(tbl) do
           sum = sum + v
       end
       return sum / #tbl
end

function Api:CopyTable(tbl)
local copy = {}
       for k, v in pairs(tbl) do
           if type(v) == "table" then
               copy[k] = copyTable(v)
           else
               copy[k] = v
           end
       end
       return copy
end

function Api:TableIsEmpty(tbl)
 return type(tbl) == "table" and next(tbl) == nil
end

function Api:TableFindKey(tbl, key)
 return tbl[key] ~= nil
end

function Api:StringHasSpaces(string)
  return string:find(" ") ~= nil
end

function Api:ExceedingNumber(max, min)
 return max > min
end

function Api:ReverseString(str)
 return string.reverse(str)
end

function Api:StringIsNumber(string)
 return tostring(string) ~= nil
end

function Api:ReverseNumber(number)
 local strNum = tostring(number)
 local reversedStr = strNum:reverse()
 return tonumber(reversedStr)
end

function Api:PartIsFalling(part)
 return part.Velocity.Y < 0
end

function Api:PartOnGrounded(part)
 return part.Velocity.Y == 0
end

function Api:Wait(time)
  task.wait(time)
end

function Api:FastWait()
  game:GetService("RunService").Heartbeat:Wait()
end

function Api:FrameWait()
  game:GetService("RunService").RenderStepped:Wait()
end

function Api:VulnerableIsStorage(vulnerable)
  if vulnerable ~= nil and vulnerable:IsA("Instance") then
 return #vulnerable > 3
  end
  return false
end

return Api
