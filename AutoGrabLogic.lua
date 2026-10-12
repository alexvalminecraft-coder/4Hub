-- Copyright 4Hub 2026
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Stats = game:GetService("Stats")
local LP = Players.LocalPlayer
local pg = LP:WaitForChild("PlayerGui")

local getconnections = getconnections or (getgenv and getgenv().getconnections)

local Steal = {
	AutoStealEnabled = true,
	StealRadius = 60,
	StealDuration = 1.3,
	Mode = 4, -- 75% like VOID.VS mode 4
	Data = {},
}
local STEAL_MODE_CFG = {
	[1] = { threshold = 0.90, nearDist = 14 },
	[2] = { threshold = 0.85, nearDist = 12 },
	[3] = { threshold = 0.80, nearDist = 11 },
	[4] = { threshold = 0.75, nearDist = 10 },
}
local isStealing = false
local isLocked = true
local uiScale = 1.0
local stealConn = nil

local progressFill, progressPct, statusLbl, uiScaleObj, main

local function getStealHRP()
	local c = LP.Character
	return c and (c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("UpperTorso"))
end

local function isMyPlotByName(plotName)
	local plots = workspace:FindFirstChild("Plots")
	local plot = plots and plots:FindFirstChild(plotName)
	if not plot then return false end
	local sign = plot:FindFirstChild("PlotSign")
	local yb = sign and sign:FindFirstChild("YourBase")
	return yb and yb:IsA("BillboardGui") and yb.Enabled
end

local function getPromptPosition(prompt)
	if not prompt then return nil end
	local p = prompt.Parent
	while p and p ~= workspace do
		if p:IsA("BasePart") then return p.Position end
		p = p.Parent
	end
	return nil
end

local function findNearestPrompt()
	local hrp = getStealHRP()
	if not hrp then return nil end
	local plots = workspace:FindFirstChild("Plots")
	if not plots then return nil end
	local nearest, dist = nil, math.huge
	for _, plot in ipairs(plots:GetChildren()) do
		if isMyPlotByName(plot.Name) then continue end
		local pods = plot:FindFirstChild("AnimalPodiums")
		if not pods then continue end
		for _, pod in ipairs(pods:GetChildren()) do
			local base = pod:FindFirstChild("Base")
			if not base then continue end
			local spawn = base:FindFirstChild("Spawn")
			if not spawn then continue end
			local d = (spawn.Position - hrp.Position).Magnitude
			if d <= Steal.StealRadius and d < dist then
				local att = spawn:FindFirstChild("PromptAttachment")
				if att then
					for _, p in ipairs(att:GetChildren()) do
						if p:IsA("ProximityPrompt") and p.ActionText and p.ActionText:find("Steal") then
							nearest, dist = p, d
						end
					end
				end
			end
		end
	end
	return nearest
end

local function setBar(p)
	p = math.clamp(p or 0, 0, 1)
	if progressFill then progressFill.Size = UDim2.new(p, 0, 1, 0) end
	if progressPct then progressPct.Text = math.floor(p * 100) .. "%" end
end

-- VOID.VS executeSteal (mode 4 = 75%)
local function executeSteal(prompt)
	if isStealing or not Steal.AutoStealEnabled then return end
	if not Steal.Data[prompt] then
		Steal.Data[prompt] = { hold = {}, trigger = {}, ready = true }
		if getconnections then
			for _, c in ipairs(getconnections(prompt.PromptButtonHoldBegan) or {}) do
				if c.Function then table.insert(Steal.Data[prompt].hold, c.Function) end
			end
			for _, c in ipairs(getconnections(prompt.Triggered) or {}) do
				if c.Function then table.insert(Steal.Data[prompt].trigger, c.Function) end
			end
		end
	end
	local data = Steal.Data[prompt]
	if not data.ready then return end
	data.ready = false
	isStealing = true
	task.spawn(function()
		for _, f in ipairs(data.hold) do pcall(f) end
	end)
	local cfg = STEAL_MODE_CFG[Steal.Mode] or STEAL_MODE_CFG[4]
	local threshold = cfg.threshold
	local nearDist = cfg.nearDist
	local totalTime = tonumber(Steal.StealDuration) or 1.3
	local timeToThreshold = totalTime * threshold
	local timeAfterThreshold = totalTime - timeToThreshold
	local startTime = tick()
	-- Phase 1: charge to 75%
	while tick() - startTime < timeToThreshold do
		if not Steal.AutoStealEnabled then
			isStealing = false; data.ready = true; setBar(0); return
		end
		setBar(math.clamp((tick() - startTime) / totalTime, 0, threshold))
		task.wait()
	end
	setBar(threshold)
	-- Phase 2: wait until near (max 4s)
	local stillNear = false
	local hrp = getStealHRP()
	if hrp then
		local targetPos = getPromptPosition(prompt)
		if targetPos and (targetPos - hrp.Position).Magnitude <= nearDist then
			stillNear = true
		end
	end
	if not stillNear then
		local holdStart = tick()
		while tick() - holdStart < 4 do
			if not Steal.AutoStealEnabled then
				isStealing = false; data.ready = true; setBar(0); return
			end
			setBar(threshold)
			local hrp2 = getStealHRP()
			if hrp2 then
				local tp = getPromptPosition(prompt)
				if tp and (tp - hrp2.Position).Magnitude <= nearDist then
					stillNear = true
					break
				end
			end
			task.wait()
		end
		if not stillNear then
			isStealing = false; data.ready = true; setBar(0); return
		end
	end
	-- Phase 3: finish remaining then trigger
	local resumeTime = tick()
	while tick() - resumeTime < timeAfterThreshold do
		if not Steal.AutoStealEnabled then
			isStealing = false; data.ready = true; setBar(0); return
		end
		local fin = (tick() - resumeTime) / math.max(timeAfterThreshold, 0.01)
		setBar(threshold + fin * (1 - threshold))
		task.wait()
	end
	setBar(1)
	for _, f in ipairs(data.trigger) do pcall(f) end
	task.wait(0.05)
	data.ready = true
	isStealing = false
	setBar(0)
end

local function startAutoSteal()
	if stealConn then return end
	stealConn = RunService.Heartbeat:Connect(function()
		if isStealing or not Steal.AutoStealEnabled then return end
		local ok, prompt = pcall(findNearestPrompt)
		if ok and prompt then
			pcall(executeSteal, prompt)
		end
	end)
end

-- UI (screenshot style)
pcall(function()
	local old = pg:FindFirstChild("4HubAutoStealUI")
	if old then old:Destroy() end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "4HubAutoStealUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.DisplayOrder = 200
gui.Parent = pg

main = Instance.new("Frame")
main.Name = "StealProgressGui"
main.Active = true
main.AnchorPoint = Vector2.new(0.5, 1)
main.Position = UDim2.new(0.5, 0, 1, -100)
main.Size = UDim2.new(0, 340, 0, 58)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.BorderSizePixel = 0
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)
uiScaleObj = Instance.new("UIScale", main)
uiScaleObj.Scale = uiScale

local title = Instance.new("TextLabel", main)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 12, 0, 6)
title.Size = UDim2.new(0, 110, 0, 18)
title.Text = "4Hub Auto Steal"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 12
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 3

progressPct = Instance.new("TextLabel", main)
progressPct.BackgroundTransparency = 1
progressPct.Position = UDim2.new(0, 120, 0, 5)
progressPct.Size = UDim2.new(0, 40, 0, 18)
progressPct.Text = "0%"
progressPct.TextColor3 = Color3.fromRGB(255, 255, 255)
progressPct.TextSize = 14
progressPct.Font = Enum.Font.GothamBlack
progressPct.ZIndex = 6

local colLbl = Instance.new("TextLabel", main)
colLbl.BackgroundTransparency = 1
colLbl.Position = UDim2.new(0, 165, 0, 6)
colLbl.Size = UDim2.new(0, 48, 0, 16)
colLbl.Text = "Colours:"
colLbl.TextColor3 = Color3.fromRGB(170, 175, 185)
colLbl.TextSize = 10
colLbl.Font = Enum.Font.GothamBold
colLbl.TextXAlignment = Enum.TextXAlignment.Right
colLbl.ZIndex = 5

local colors = {
	Color3.fromRGB(160, 50, 255),
	Color3.fromRGB(45, 136, 255),
	Color3.fromRGB(255, 50, 50),
	Color3.fromRGB(90, 90, 100),
	Color3.fromRGB(255, 255, 255),
}
for i, col in ipairs(colors) do
	local b = Instance.new("TextButton", main)
	b.Position = UDim2.new(0, 216 + (i - 1) * 14, 0, 9)
	b.Size = UDim2.new(0, 11, 0, 11)
	b.BackgroundColor3 = col
	b.Text = ""
	b.ZIndex = 5
	Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)
	b.MouseButton1Click:Connect(function()
		if progressFill then progressFill.BackgroundColor3 = col end
	end)
end

local plusBtn = Instance.new("TextButton", main)
plusBtn.Position = UDim2.new(1, -40, 0, 7)
plusBtn.Size = UDim2.new(0, 14, 0, 14)
plusBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
plusBtn.Text = "+"
plusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
plusBtn.Font = Enum.Font.GothamBold
plusBtn.TextSize = 12
plusBtn.ZIndex = 5
Instance.new("UICorner", plusBtn).CornerRadius = UDim.new(0, 4)

local minusBtn = Instance.new("TextButton", main)
minusBtn.Position = UDim2.new(1, -22, 0, 7)
minusBtn.Size = UDim2.new(0, 14, 0, 14)
minusBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
minusBtn.Text = "-"
minusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minusBtn.Font = Enum.Font.GothamBold
minusBtn.TextSize = 12
minusBtn.ZIndex = 5
Instance.new("UICorner", minusBtn).CornerRadius = UDim.new(0, 4)

local lockBtn = Instance.new("TextButton", main)
lockBtn.Position = UDim2.new(1, -58, 0, 7)
lockBtn.Size = UDim2.new(0, 14, 0, 14)
lockBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
lockBtn.Text = "🔒"
lockBtn.TextSize = 8
lockBtn.ZIndex = 5
Instance.new("UICorner", lockBtn).CornerRadius = UDim.new(0, 4)

local barBg = Instance.new("Frame", main)
barBg.Position = UDim2.new(0, 12, 0, 28)
barBg.Size = UDim2.new(1, -24, 0, 10)
barBg.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
barBg.BorderSizePixel = 0
barBg.ClipsDescendants = true
barBg.ZIndex = 3
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

progressFill = Instance.new("Frame", barBg)
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(45, 136, 255)
progressFill.BorderSizePixel = 0
progressFill.ZIndex = 4
Instance.new("UICorner", progressFill).CornerRadius = UDim.new(1, 0)

statusLbl = Instance.new("TextLabel", main)
statusLbl.BackgroundTransparency = 1
statusLbl.Position = UDim2.new(0, 12, 0, 40)
statusLbl.Size = UDim2.new(1, -24, 0, 14)
statusLbl.Text = "https://discord.gg/8tj64FtMHR | Ping: -- | FPS: --"
statusLbl.TextColor3 = Color3.fromRGB(150, 150, 160)
statusLbl.Font = Enum.Font.Gotham
statusLbl.TextSize = 11
statusLbl.ZIndex = 3

local dragging, dragStart, startPos
main.InputBegan:Connect(function(input)
	if isLocked then return end
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = main.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)
UIS.InputChanged:Connect(function(input)
	if not dragging or isLocked then return end
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		local d = input.Position - dragStart
		main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
	end
end)

lockBtn.MouseButton1Click:Connect(function()
	isLocked = not isLocked
	lockBtn.Text = isLocked and "🔒" or "🔓"
end)
plusBtn.MouseButton1Click:Connect(function()
	uiScale = math.min(2.0, uiScale + 0.1)
	uiScaleObj.Scale = uiScale
end)
minusBtn.MouseButton1Click:Connect(function()
	uiScale = math.max(0.5, uiScale - 0.1)
	uiScaleObj.Scale = uiScale
end)

startAutoSteal()

task.spawn(function()
	local fps = 0
	RunService.RenderStepped:Connect(function() fps += 1 end)
	while main.Parent do
		task.wait(1)
		local ping = 0
		pcall(function()
			ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
		end)
		statusLbl.Text = string.format("https://discord.gg/UhDAKxHEFM | Ping: %dms | FPS: %d", ping, fps)
		fps = 0
	end
end)
