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
        if script:IsA("Texture") then
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

function Api:ExecuteLocal(player, script, mode)
CustomRemoteEv = Instance.new("RemoteEvent", game.ReplicatedStorage)
CustomRemoteEv.Name = "LocalScript"

  CustomRemoteEv.OnClientEvent:Connect(function()
 loadstring(script)()
  end)

  if tostring(mode) == "server" then
    CustomRemoteEv:FireServer()
  elseif tostring(mode) == "client" then
    CustomRemoteEv:FireClient(player)
  elseif tostring(mode) == "all" then
    CustomRemoteEv:FireAllClients()
  end
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

return Api