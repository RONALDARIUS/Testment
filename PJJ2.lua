local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local espItemLoops = nil
local espQuestLoops = nil
--Items
local items = game:GetService("Workspace").Items
local npc = game:GetService("Workspace").NPC

local function createEsp(item)
	local bill = Instance.new('BillboardGui')
	local text = Instance.new("TextLabel")
	text.Parent = bill
  bill.Name = "ESPBILLBOARD"
	bill.AlwaysOnTop = true
	bill.Size = UDim2.new(1,200,1,30);
	bill.ExtentsOffset = Vector3.new(0,1,0)
	bill.ZIndexBehavior = 'Global';
	text.Text = `<i>{item.Name}</i>`
	text.Size = UDim2.new(0,200,0,30)
	text.BackgroundTransparency = 1
	text.Font = Enum.Font.Fondamento
	text.RichText = true
	text.TextScaled = true
	if item.PrimaryPart then
		if item.Name:sub(1,#item.PrimaryPart.Name) == 'Rokakaka' or item.Name:sub(1,#item.PrimaryPart.Name) == 'Stand' then
			text.TextColor = BrickColor.new('White')
		elseif item.Name:sub(1,#item.PrimaryPart.Name) == 'Requiem' then
			text.TextColor = BrickColor.new('Deep orange')
		elseif item.Name:sub(1,#item.PrimaryPart.Name) == 'Hamon' then
			text.TextColor = BrickColor.new('Bright yellow')
		elseif item.Name:sub(1,#item.PrimaryPart.Name) == 'Vampire' then
			text.TextColor = BrickColor.new('Maroon')
		elseif item.Name:sub(1,#item.PrimaryPart.Name) == 'Steel' then
			text.TextColor = BrickColor.new('Sea green')
		elseif item.Name:sub(1,#item.PrimaryPart.Name) == 'Stone' then
			text.TextColor = BrickColor.new('Dark stone grey')
		elseif item.Name:sub(1,#item.PrimaryPart.Name) == 'Aja' then
			text.TextColor = BrickColor.new('Royal purple')
		elseif item.Name:sub(1,#item.PrimaryPart.Name) == 'Corpse' then
			text.TextColor = BrickColor.new('Gold')
		elseif item.Name:sub(1,#item.PrimaryPart.Name) == 'New' then
			text.TextColor = BrickColor.new('Bright red')
		elseif item.Name:sub(1,#item.PrimaryPart.Name) == 'Dio' then
			text.TextColor = BrickColor.new('Really blue');
		elseif item.Name:sub(1,#item.PrimaryPart.Name) == 'Sinner'then
			text.TextColor = BrickColor.new('New Yeller');
		elseif item.Name:sub(1,#item.PrimaryPart.Name) == 'Cash' then
			text.TextColor = BrickColor.new('Lime green');
		else
			text.TextColor = BrickColor.new('White')
		end
	end
	bill.Parent = item
end

--[[
Roka, Stand : "White";
Req Arrow   : "Deep orange";
Hamon		: "Bright yellow"
Vamp		: "Maroon";
Steel		: "Sea green";
Stone		: "Dark stone grey";
Aja			: "Royal purple";
Corpse		: "Gold";
New Roka	: "Bright red";
Dio Diary	: "Really blue";
Sinner		: "New Yeller";
Dio Bone	: "Bright blue"
Cash		: "Lime green";
]]

--Quest
local function createEsp1(item)
	local bill = Instance.new('BillboardGui')
	local text = Instance.new("TextLabel")
	text.Parent = bill
	bill.AlwaysOnTop = true
	bill.Size = UDim2.new(1,200,1,30);
	bill.ExtentsOffset = Vector3.new(0,1,0)
	bill.ZIndexBehavior = 'Global';
	text.Text = `<i>{item.Name}</i>`
	text.Size = UDim2.new(0,200,0,30)
	text.BackgroundTransparency = 1
	text.Font = Enum.Font.Fondamento
	text.RichText = true
	text.TextScaled = true
	text.TextColor = BrickColor.new('White')
	bill.Parent = item
end
--[[for _,item in pairs(workspace.Items:GetChildren()) do
	if item:GetChildren()[1].Transparency == 0.5 then
		createEsp1(item)
	end
end
workspace.Items.ChildAdded:Connect(function(child)
	if child:GetChildren()[1].Transparency == 0.5 then
		createEsp1(child)
	end
end)]]

local Window = Fluent:CreateWindow({
    Title = "Project Jojo 2",
    SubTitle = "by me",
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 360),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "box" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local espItem = Tabs.Main:AddToggle("espItems", {Title = "Esp Items", Default = false })
local espQuest = Tabs.Main:AddToggle("espQuests", {Title = "Esp Quest", Default = false })

espItem:OnChanged(function()
    --Options.MyToggle.Value
    if Options.espItems.Value then
      for _,item in pairs(workspace.Items:GetChildren()) do
	      createEsp(item)
      end
      espItemLoops = workspace.Items.ChildAdded:Connect(createEsp)
    else
      espItemLoop:disconnect()
      for _,item in pairs(workspace.Items:GetChildren()) do
	      for _,item1 in pairs(item1:GetChildren()) do
	        if item1.Name == "ESPBILLBOARD" then
            item1.Destroy()
        end
      end
end)
    -- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
