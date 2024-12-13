print("Executed")
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local espItemLoops
local infyld = false
local dex = false

local RS = game:GetService('RunService')
--Items
local items = game:GetService("Workspace").Items
local npc = game:GetService("Workspace").NPCs

local function createEsp(item)
    for _,val in pairs(item:GetChildren()) do
        if val.Name == "ESPBILLBOARD" then
            val:Destroy()
        end
           
    end
    local bill = Instance.new('BillboardGui')
	local text = Instance.new("TextLabel")
	text.Parent = bill
    bill.Name = "ESPBILLBOARD"
	bill.AlwaysOnTop = true
	bill.Size = UDim2.new(1,150,1,30);
	bill.ExtentsOffset = Vector3.new(0,1,0)
	bill.ZIndexBehavior = 'Global';
	text.Text = item.Name
	text.Size = UDim2.new(0,150,0,30)
	text.BackgroundTransparency = 1
	text.RichText = true
	text.TextScaled = true
	if item then
		if item.Name == 'Rokakaka Fruit' or item.Name == 'Stand Arrow' then
			text.TextColor = BrickColor.new('White')
		elseif item.Name == 'Requiem Arrow' then
			text.TextColor = BrickColor.new('Deep orange')
		elseif item.Name == 'Hamon Breather' then
			text.TextColor = BrickColor.new('Bright yellow')
		elseif item.Name == 'Vampire Mask' then
			text.TextColor = BrickColor.new('Maroon')
		elseif item.Name == 'Steel Ball' then
			text.TextColor = BrickColor.new('Sea green')
		elseif item.Name == 'Stone Rokakaka' then
			text.TextColor = BrickColor.new('Dark stone grey')
		elseif item.Name == 'Aja Mask' then
			text.TextColor = BrickColor.new('Royal purple')
		elseif item.Name == 'Corpse Part' then
			text.TextColor = BrickColor.new('Gold')
		elseif item.Name == 'New Rokakaka' then
			text.TextColor = BrickColor.new('Bright red')
		elseif item.Name == 'Dio Bone' or item.Name == "Dio Diary" then
			text.TextColor = BrickColor.new('Really blue');
		elseif item.Name == 'Sinner Soul' or item.Name == 'Sinners Soul' then
			text.TextColor = BrickColor.new('New Yeller');
		elseif item.Name == 'Cash Sack' then
			text.TextColor = BrickColor.new('Lime green');
		else
            print('Error Index')
			text.TextColor = BrickColor.new('White')
		end
	end
	bill.Parent = item
    wait(0.1)
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
local function createEsp1(item,name, part)
    for _,val in pairs(item:GetChildren()) do
        if val.Name == "ESPBILLBOARD" then
            val:Destroy()
        end    
    end
	local bill = Instance.new('BillboardGui')
	local text = Instance.new("TextLabel")
	text.Parent = bill
    bill.Name = "ESPBILLBOARD"
	bill.AlwaysOnTop = true
	bill.Size = UDim2.new(1,150,1,30);
	bill.ExtentsOffset = Vector3.new(0,1,0)
	bill.ZIndexBehavior = 'Global';
	text.Text = name
	text.Size = UDim2.new(0,150,0,30)
	text.BackgroundTransparency = 1
	text.RichText = true
	text.TextScaled = true
	text.TextColor = BrickColor.new('Cyan')
	bill.Parent = item
end
--[[
]]

local Window = Fluent:CreateWindow({
    Title = "Project Jojo 2",
    SubTitle = "by me",
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 360),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

local Options = Fluent.Options

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "box" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "boxes" })
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local espItem = Tabs.Main:AddToggle("espItems", {Title = "Esp Items", Default = false })


espItem:OnChanged(function()
    if Options.espItems.Value then
      for _,item in pairs(workspace.Items:GetChildren()) do
	      createEsp(item)
      end
      espItemLoops = workspace.Items.ChildAdded:Connect(createEsp)
    else
        if espItemLoops then
            espItemLoops:Disconnect()
            print("Item Disconnect")
        end
        for _,item in pairs(workspace.Items:GetDescendants()) do
	        if item1.Name == "ESPBILLBOARD" then
                item1:Destroy()
            end
      end
    end
end)
Tabs.Main:AddButton({
    Title = "Esp Quest Items";
    Description = "Esp Quest Items",
    Callback = function()
        for _,item in pairs(npc["Quest Ajas"]:GetDescendants()) do
           if item.Name == "ESPBILLBOARD" then
                item:Destroy()
	        end
        end
        for _,item in pairs(npc["Quest Beetles"]:GetDescendants()) do
           if item.Name == "ESPBILLBOARD" then
                item:Destroy()
	        end
        end
        for _,item in pairs(npc["Quest Guitars"]:GetDescendants()) do
           if item.Name == "ESPBILLBOARD" then
                item:Destroy()
	        end
        end
        wait(0.5)
        for _,item in pairs(npc["Quest Ajas"]:GetChildren()) do
	        if item["Handle"].Transparency ~= 1 then
		        createEsp1(item, "Aja Gem", "Handle")
            end
        end
        for _,item in pairs(npc["Quest Beetles"]:GetChildren()) do
	        if item["Quest Beetle"].Transparency ~= 1 then
		        createEsp1(item,"Beetles", "Quest Beetle")
            end
        end
        for _,item in pairs(npc["Quest Guitars"]:GetChildren()) do
	        if item["Cube"].Transparency ~= 1 then
		        createEsp1(item,"Guitar", "Cube")
	        end
        end
    end
    
})

Tabs.Misc:AddButton({
    Title = "Dex",
    Description = "Execute Dex Explorer",
    Callback = function()
    if not dex then
        loadstring(game:HttpGet("https://github.com/RONALDARIUS/Testment/raw/refs/heads/main/Dex.lua"))()
        Fluent:Notify({
            Title = 'Executing Dex..'
            Content = "Loading Dex..."
            Duration = 5
        })
    else
            Fluent:Notify({
            Title = 'Executed'
            Content = "Dex Already Been Executed"
            Duration = 5
        })
    end
})

Tabs.Misc:AddButton({
    Title = "Infinite Yield",
    Description = "Execute Infinite Yield",
    Callback = function()
    if not infyld then
        loadstring(game:HttpGet("https://github.com/RONALDARIUS/Testment/raw/refs/heads/main/InfiniteYield.lua"))()
        Fluent:Notify({
            Title = 'Executing Infinite Yield..'
            Content = "Loading Infinite Yield..."
            Duration = 5
        })
    else
            Fluent:Notify({
            Title = 'Executed'
            Content = "Infinite Yield Already Been Executed"
            Duration = 5
        })
    end
})

Options.espItems:SetValue(false)
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
