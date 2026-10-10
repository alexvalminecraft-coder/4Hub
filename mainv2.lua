if not game:IsLoaded() then
	game.Loaded:Wait()
end
local effectProtection
local TweenService, userInputService, Workspace, localPlayer1, themeColors, gothamMedium, gothamBold, HttpService, savedConfig
local saveConfig, saveToggle, getSavedToggle, saveWindowPosition, restoreWindowPosition, saveNumber, getSavedNumber, saveChoice, getSavedChoice, enabled1
local value3, 4HubLocked, createUICorner, createUIStroke, screenGui, RunService, udim2, frame, uiStroke, frame2
local instance, frame3, textButton, tabRegistry, selectTab, createSection, createToggle, createKeybindToggle, createTextButton, createTextBox
local createSlider, createLabel, service1, Keybinds, ap, Settings, Config_, frame4, enabled2, handleAction
local handleAction1, handleAction2, handleAction3, number, number1, enabled3, enabled4, text3, folder, folder2
local number2, overlayConnections, disconnectOverlayConnections, resetOverlayFolders, setOverlayCollision, getBaseBounds, createBaseOverlay
do
	local players, Main, Misc, handleAction4
	do
		local UserInputService, gotham, value4, options, RunService2, tweenInfo, TweenService2, frame5, localPlayer6, udim22
		local handleAction5
		do
			local handleAction6, handleAction7, value5, createUIPadding, frame6
			do
				local playerGui_, service5, handleAction8
				players = game:GetService("Players")
				TweenService = game:GetService("TweenService")
				userInputService = game:GetService("UserInputService")
				Workspace = game:GetService("Workspace")
				localPlayer1 = players.LocalPlayer
				themeColors = {
					Black = Color3.fromRGB(6, 8, 14),
					BgDark = Color3.fromRGB(9, 13, 24),
					BgPanel = Color3.fromRGB(13, 20, 38),
					Sidebar = Color3.fromRGB(7, 10, 20),
					Stroke = Color3.fromRGB(30, 46, 82),
					DarkBlue = Color3.fromRGB(18, 38, 78),
					LightBlue = Color3.fromRGB(92, 165, 255),
					BlueLine = Color3.fromRGB(60, 120, 220),
					RedBox = Color3.fromRGB(150, 26, 34),
					DarkRedBox = Color3.fromRGB(70, 16, 22),
					LightRed = Color3.fromRGB(255, 118, 118),
					RedLine = Color3.fromRGB(190, 45, 55),
					White = Color3.fromRGB(255, 255, 255),
					TextDim = Color3.fromRGB(150, 165, 195),
					Dim = Color3.fromRGB(120, 135, 165),
					ToggleOff = Color3.fromRGB(40, 52, 82),
					Purple = Color3.fromRGB(180, 130, 255),
					Green = Color3.fromRGB(46, 190, 110),
					Red = Color3.fromRGB(210, 60, 70),
				}
				gothamMedium = Enum.Font.GothamMedium
				gothamBold = Enum.Font.GothamBold
				game:GetService("TextService")
				HttpService = game:GetService("HttpService")
				savedConfig = {
					toggles = {},
					positions = {},
					keys = {},
					numbers = {},
					choices = {},
				}
				do
					local function handleAction9()
						return typeof(readfile) == "function" and typeof(writefile) == "function" and typeof(isfile) == "function"
					end
					if handleAction9() then
						pcall(function()
							if isfile("rifthub_config.json") then
								local data = HttpService:JSONDecode(readfile("rifthub_config.json"))
								if type(data) == "table" then
									savedConfig.toggles = data.toggles or {}
									savedConfig.positions = data.positions or {}
									savedConfig.keys = data.keys or {}
									savedConfig.numbers = data.numbers or {}
									savedConfig.choices = data.choices or {}
								end
							end
						end)
					end
					saveConfig = function()
						if not handleAction9() then
							return
						end
						pcall(function()
							writefile("rifthub_config.json", HttpService:JSONEncode(savedConfig))
						end)
					end
				end
				saveToggle = function(settingName, isEnabled)
					savedConfig.toggles[settingName] = isEnabled and true or nil
					saveConfig()
				end
				getSavedToggle = function(settingName1)
					return savedConfig.toggles[settingName1] == true
				end
				saveWindowPosition = function(windowKey, position1)
					savedConfig.positions[windowKey] = { xs = position1.X.Scale, xo = position1.X.Offset, ys = position1.Y.Scale, yo = position1.Y.Offset }
					saveConfig()
				end
				restoreWindowPosition = function(windowKey1, window1)
					local entry = savedConfig.positions[windowKey1]
					if entry then
						window1.Position = UDim2.new(entry.xs or 0, entry.xo or 0, entry.ys or 0, entry.yo or 0)
					end
				end
				handleAction6 = function(argument, argument1)
					savedConfig.keys[argument] = argument1 and argument1.Name or nil
					saveConfig()
				end
				handleAction7 = function(argument2)
					local entry1 = savedConfig.keys[argument2]
					if entry1 and Enum.KeyCode[entry1] then
						return Enum.KeyCode[entry1]
					end
					return nil
				end
				saveNumber = function(settingName2, value1)
					savedConfig.numbers[settingName2] = value1
					saveConfig()
				end
				getSavedNumber = function(settingName3)
					return savedConfig.numbers[settingName3]
				end
				saveChoice = function(settingName4, choice)
					savedConfig.choices[settingName4] = choice
					saveConfig()
				end
				getSavedChoice = function(settingName5)
					return savedConfig.choices[settingName5]
				end
				_G.__4HubBlacklist = _G.__4HubBlacklist or {}
				do
					local APBlacklist = getSavedChoice("APBlacklist")
					if type(APBlacklist) == "string" and APBlacklist ~= "" then
						pcall(function()
							local data = HttpService:JSONDecode(APBlacklist)
							if type(data) == "table" then
								_G.__4HubBlacklist = data
							end
						end)
					end
				end
				do
					local TweenService3, color, color2, screenGui2
					do
						local function handleAction10()
							pcall(function()
								saveChoice("APBlacklist", HttpService:JSONEncode(_G.__4HubBlacklist))
								return
							end)
						end
						_G.__4HubBlAdd = function(argument3, argument4, argument5)
							_G.__4HubBlacklist[tostring(argument3)] = { name = argument4, display = argument5 }
							handleAction10()
							if _G.__4HubBlChanged then
								pcall(_G.__4HubBlChanged)
							end
							return
						end
						_G.__4HubBlRemove = function(argument6)
							_G.__4HubBlacklist[tostring(argument6)] = nil
							handleAction10()
							if _G.__4HubBlChanged then
								pcall(_G.__4HubBlChanged)
							end
						end
					end
					_G.__4HubIsBlacklisted = function(argument7)
						if not argument7 then
							return false
						end
						local userId = typeof(argument7) == "Instance" and argument7.UserId or type(argument7) == "number" and argument7 or tonumber(argument7)
						if not userId then
							return false
						end
						return _G.__4HubBlacklist[tostring(userId)] ~= nil
					end
					enabled1 = false
					value5 = nil
					value3 = nil
					4HubLocked = false
					_G.__4HubLocked = false
					_G.__4HubUIRegistry = _G.__4HubUIRegistry or {}
					_G.__4HubRegisterDrag = function(argument8, argument9, argument10, argument11)
						local UserInputService2 = game:GetService("UserInputService")
						if argument10 then
							restoreWindowPosition(argument10, argument8)
						end
						argument8.Active = true
						local options1 = { window = argument8, key = argument10, home = argument11 }
						table.insert(_G.__4HubUIRegistry, options1)
						local enabled5 = nil
						local position = nil
						local position2 = nil
						local connection_ = nil
						local connection_2 = nil
						argument9.Active = true
						argument9.InputBegan:Connect(function(input)
							if _G.__4HubLocked then
								return
							end
							if _G.__4HubSliderDragging then
								return
							end
							if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
								return
							end
							enabled5 = true
							position = input.Position
							position2 = argument8.Position
							if connection_ then
								connection_:Disconnect()
							end
							if connection_2 then
								connection_2:Disconnect()
							end
							connection_ = UserInputService2.InputChanged:Connect(function(input2)
								if not enabled5 then
									return
								end
								if input2.UserInputType == Enum.UserInputType.MouseMovement or input2.UserInputType == Enum.UserInputType.Touch then
									local number3 = input2.Position - position
									argument8.Position = UDim2.new(position2.X.Scale, position2.X.Offset + number3.X, position2.Y.Scale, position2.Y.Offset + number3.Y)
								end
							end)
							connection_2 = UserInputService2.InputEnded:Connect(function(input2)
								if input2.UserInputType == Enum.UserInputType.MouseButton1 or input2.UserInputType == Enum.UserInputType.Touch then
									if enabled5 and argument10 then
										saveWindowPosition(argument10, argument8.Position)
									end
									enabled5 = false
									if connection_ then
										connection_:Disconnect()
										connection_ = nil
									end
									if connection_2 then
										connection_2:Disconnect()
										connection_2 = nil
									end
								end
							end)
						end)
						return options1
					end
					_G.__4HubResetUIs = function()
						for _, value6 in ipairs(_G.__4HubUIRegistry) do
							if value6.window and value6.window.Parent then
								if value6.key then
									savedConfig.positions[value6.key] = nil
									saveConfig()
								end
								if value6.home then
									value6.window.Position = value6.home
								end
							end
						end
					end
					_G.__4HubSetLocked = function(argument12)
						_G.__4HubLocked = argument12 and true or false
					end
					_G.__4HubGuiScaleCur = _G.__4HubGuiScaleCur or 100
					_G.__4HubScaleExtra = _G.__4HubScaleExtra or {}
					_G.__4HubScaleExclude = _G.__4HubScaleExclude or setmetatable({}, { __mode = "k" })
					_G.__4HubExcludeScale = function(argument13)
						if not argument13 then
							return
						end
						_G.__4HubScaleExclude[argument13] = true
						local 4HubUIScale = argument13:FindFirstChild("4HubUIScale")
						if 4HubUIScale then
							4HubUIScale.Scale = 1
						end
					end
					_G.__4HubMobileFactor = function()
						local ok, result = pcall(function()
							return game:GetService("UserInputService")
						end)
						if ok and result and result.TouchEnabled and not result.KeyboardEnabled and not result.MouseEnabled then
							return 0.75
						end
						return 1
					end
					do
						local function handleAction11(parent, scale)
							if not parent then
								return
							end
							if _G.__4HubScaleExclude and _G.__4HubScaleExclude[parent] then
								local 4HubUIScale = parent:FindFirstChild("4HubUIScale")
								if 4HubUIScale then
									4HubUIScale.Scale = 1
								end
								return
							end
							local 4HubUIScale = parent:FindFirstChild("4HubUIScale")
							if not 4HubUIScale then
								4HubUIScale = Instance.new("UIScale")
								4HubUIScale.Name = "4HubUIScale"
								4HubUIScale.Parent = parent
							end
							4HubUIScale.Scale = scale
						end
						_G.__4HubRegisterScale = function(argument14)
							if not argument14 then
								return
							end
							table.insert(_G.__4HubScaleExtra, argument14)
							handleAction11(argument14, math.clamp((_G.__4HubGuiScaleCur or 100) / 100, 0.5, 1.05) * _G.__4HubMobileFactor())
						end
						_G.__4HubSetGuiScale = function(argument15)
							_G.__4HubGuiScaleCur = tonumber(argument15) or 100
							local number4 = math.clamp((tonumber(argument15) or 100) / 100, 0.5, 1.05) * _G.__4HubMobileFactor()
							handleAction11(_G.__4HubMainWindow, number4)
							local value7 = ipairs
							local 4HubUIRegistry = _G.__4HubUIRegistry or {}
							for _, value8 in value7(4HubUIRegistry) do
								handleAction11(value8.window, number4)
							end
							local value9 = ipairs
							local 4HubScaleExtra = _G.__4HubScaleExtra or {}
							for _, value10 in value9(4HubScaleExtra) do
								handleAction11(value10, number4)
							end
						end
					end
					_G.__4HubGuiTranspOrig = _G.__4HubGuiTranspOrig or setmetatable({}, { __mode = "k" })
					_G.__4HubSetGuiTransparency = function(argument16)
						local number5 = 1 - math.clamp((tonumber(argument16) or 100) / 100, 0.15, 1)
						local 4HubTranspExclude = _G.__4HubTranspExclude or {}
						local value11 = ipairs
						local 4HubUIRegistry = _G.__4HubUIRegistry or {}
						for _, value12 in value11(4HubUIRegistry) do
							local window = value12.window
							if window and not 4HubTranspExclude[window] then
								local backgroundTransparency = _G.__4HubGuiTranspOrig[window]
								if backgroundTransparency == nil then
									backgroundTransparency = window.BackgroundTransparency
									_G.__4HubGuiTranspOrig[window] = backgroundTransparency
								end
								pcall(function()
									window.BackgroundTransparency = backgroundTransparency + (1 - backgroundTransparency) * number5
								end)
								local body = window:FindFirstChild("Body")
								if body and body:IsA("GuiObject") then
									local backgroundTransparency2 = _G.__4HubGuiTranspOrig[body]
									if backgroundTransparency2 == nil then
										backgroundTransparency2 = body.BackgroundTransparency
										_G.__4HubGuiTranspOrig[body] = backgroundTransparency2
									end
									pcall(function()
										body.BackgroundTransparency = backgroundTransparency2 + (1 - backgroundTransparency2) * number5
									end)
								end
							end
						end
					end
					createUICorner = function(parent, argument17)
						local uiCorner = Instance.new("UICorner")
						uiCorner.CornerRadius = UDim.new(0, argument17 or 8)
						uiCorner.Parent = parent
						return uiCorner
					end
					createUIStroke = function(parent, color3, thickness)
						local uiStroke2 = Instance.new("UIStroke")
						uiStroke2.Color = color3 or themeColors.Stroke
						uiStroke2.Thickness = thickness or 1
						uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
						uiStroke2.Parent = parent
						return uiStroke2
					end
					createUIPadding = function(parent, argument18)
						local uiPadding = Instance.new("UIPadding")
						uiPadding.PaddingTop = UDim.new(0, argument18)
						uiPadding.PaddingBottom = UDim.new(0, argument18)
						uiPadding.PaddingLeft = UDim.new(0, argument18)
						uiPadding.PaddingRight = UDim.new(0, argument18)
						uiPadding.Parent = parent
						return uiPadding
					end
					do
						local cleanUI = localPlayer1:FindFirstChild("PlayerGui") and localPlayer1.PlayerGui:FindFirstChild("CleanUI")
						if cleanUI then
							cleanUI:Destroy()
						end
					end
					screenGui = Instance.new("ScreenGui")
					screenGui.Name = "CleanUI"
					screenGui.ResetOnSpawn = false
					screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
					screenGui.IgnoreGuiInset = true
					screenGui.DisplayOrder = 100000
					screenGui.Parent = localPlayer1:WaitForChild("PlayerGui")
					RunService = game:GetService("RunService")
					_G.__4HubDead = false
					_G.__4HubLeaveConns = _G.__4HubLeaveConns or {}
					_G.__4HubOwnConns = _G.__4HubOwnConns or {}
					_G.__4HubOnLeave = function(argument19)
						if type(argument19) == "function" then
							_G.__4HubLeaveConns[#_G.__4HubLeaveConns + 1] = argument19
						end
					end
					_G.__4HubKill = function()
					end
					do
						local localPlayer7 = game:GetService("Players").LocalPlayer
						_G.__4HubLocalChar = localPlayer7.Character
						localPlayer7.CharacterAdded:Connect(function(character)
							_G.__4HubLocalChar = character
						end)
						localPlayer7.CharacterRemoving:Connect(function()
							_G.__4HubLocalChar = nil
						end)
					end
					TweenService3 = game:GetService("TweenService")
					do
						local function handleAction12()
							local ok, result = pcall(function()
								return gethui()
							end)
							if ok and result then
								return result
							end
							return game:GetService("CoreGui")
						end
						if _G.__4HubNotifEnabled == nil then
							_G.__4HubNotifEnabled = true
						end
						color = Color3.fromRGB(92, 165, 255)
						color2 = Color3.fromRGB(10, 14, 24)
						local 4HubNotifs = handleAction12():FindFirstChild("4HubNotifs")
						if 4HubNotifs then
							pcall(function()
								4HubNotifs:Destroy()
							end)
						end
						screenGui2 = Instance.new("ScreenGui")
						screenGui2.Name = "4HubNotifs"
						screenGui2.ResetOnSpawn = false
						screenGui2.IgnoreGuiInset = true
						screenGui2.DisplayOrder = 2000000
						screenGui2.Parent = handleAction12()
					end
					do
						local frame7
						frame7 = Instance.new("Frame")
						frame7.Name = "Holder"
						frame7.AnchorPoint = Vector2.new(0, 1)
						frame7.Position = UDim2.new(0, 16, 1, -16)
						frame7.Size = UDim2.new(0, 280, 1, -32)
						frame7.BackgroundTransparency = 1
						frame7.Parent = screenGui2
						do
							local uiListLayout = Instance.new("UIListLayout")
							uiListLayout.FillDirection = Enum.FillDirection.Vertical
							uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
							uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
							uiListLayout.Padding = UDim.new(0, 8)
							uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
							uiListLayout.Parent = frame7
						end
						local layoutOrder = 0
						local tweenInfo2 = TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
						local tweenInfo3 = TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
						_G.__4HubNotify = function(argument20, argument21)
							if not _G.__4HubNotifEnabled then
								return
							end
							layoutOrder += 1
							local canvasGroup = Instance.new("CanvasGroup")
							canvasGroup.Name = "Toast" .. layoutOrder
							canvasGroup.Size = UDim2.new(0, 266, 0, 44)
							canvasGroup.BackgroundColor3 = color2
							canvasGroup.BorderSizePixel = 0
							canvasGroup.LayoutOrder = layoutOrder
							canvasGroup.GroupTransparency = 1
							canvasGroup.Position = UDim2.new(-0.55, 0, 0, 0)
							canvasGroup.Parent = frame7
							local uiCorner = Instance.new("UICorner")
							uiCorner.CornerRadius = UDim.new(0, 9)
							uiCorner.Parent = canvasGroup
							local instance2 = Instance.new("UIStroke")
							instance2.Color = color
							instance2.Thickness = 1.2
							instance2.Transparency = 0.2
							instance2.Parent = canvasGroup
							local instance3 = Instance.new("Frame")
							instance3.Size = UDim2.new(0, 3, 1, -14)
							instance3.Position = UDim2.new(0, 8, 0, 7)
							instance3.BackgroundColor3 = color
							instance3.BorderSizePixel = 0
							instance3.Parent = canvasGroup
							local uiCorner2 = Instance.new("UICorner")
							uiCorner2.CornerRadius = UDim.new(1, 0)
							uiCorner2.Parent = instance3
							local argument211 = argument21 and argument21 ~= ""
							local textLabel = Instance.new("TextLabel")
							textLabel.BackgroundTransparency = 1
							textLabel.Position = UDim2.new(0, 20, 0, argument211 and 6 or 0)
							textLabel.Size = UDim2.new(1, -28, 0, argument211 and 18 or 44)
							textLabel.Font = Enum.Font.GothamBold
							textLabel.Text = tostring(argument20 or "")
							textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
							textLabel.TextSize = 13
							textLabel.TextXAlignment = Enum.TextXAlignment.Left
							textLabel.TextYAlignment = argument211 and Enum.TextYAlignment.Center or Enum.TextYAlignment.Center
							textLabel.TextTruncate = Enum.TextTruncate.AtEnd
							textLabel.Parent = canvasGroup
							if argument211 then
								local textLabel2 = Instance.new("TextLabel")
								textLabel2.BackgroundTransparency = 1
								textLabel2.Position = UDim2.new(0, 20, 0, 23)
								textLabel2.Size = UDim2.new(1, -28, 0, 14)
								textLabel2.Font = Enum.Font.Gotham
								textLabel2.Text = tostring(argument21)
								textLabel2.TextColor3 = Color3.fromRGB(180, 205, 255)
								textLabel2.TextSize = 11
								textLabel2.TextXAlignment = Enum.TextXAlignment.Left
								textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
								textLabel2.Parent = canvasGroup
							end
							local frame8 = Instance.new("Frame")
							frame8.AnchorPoint = Vector2.new(0, 1)
							frame8.Position = UDim2.new(0, 0, 1, 0)
							frame8.Size = UDim2.new(1, 0, 0, 2)
							frame8.BackgroundColor3 = color
							frame8.BorderSizePixel = 0
							local uiCorner3 = Instance.new("UICorner")
							uiCorner3.CornerRadius = UDim.new(0, 1)
							uiCorner3.Parent = frame8
							frame8.Parent = canvasGroup
							local uiScale = Instance.new("UIScale")
							uiScale.Scale = 0.9
							uiScale.Parent = canvasGroup
							TweenService3:Create(canvasGroup, tweenInfo2, { Position = UDim2.new(0, 0, 0, 0), GroupTransparency = 0 }):Play()
							TweenService3:Create(uiScale, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
							TweenService3:Create(frame8, TweenInfo.new(3, Enum.EasingStyle.Linear), { Size = UDim2.new(0, 0, 0, 2) }):Play()
							task.delay(2.6, function()
								TweenService3:Create(uiScale, TweenInfo.new(0.3, Enum.EasingStyle.Quad), { Scale = 0.92 }):Play()
								local tween = TweenService3:Create(canvasGroup, tweenInfo3, { Position = UDim2.new(-0.55, 0, 0, 0), GroupTransparency = 1 })
								tween:Play()
								tween.Completed:Once(function()
									pcall(function()
										canvasGroup:Destroy()
									end)
								end)
							end)
						end
					end
				end
				_G.__4HubGetMover = function(parent)
					if not parent then
						return nil
					end
					local 4HubMover = parent:FindFirstChild("4HubMover")
					if 4HubMover and 4HubMover:IsA("LinearVelocity") then
						return 4HubMover
					end
					local attachment = parent:FindFirstChild("4HubMoverAttachment")
					if not (attachment and attachment:IsA("Attachment")) then
						attachment = Instance.new("Attachment")
						attachment.Name = "4HubMoverAttachment"
						attachment.Parent = parent
					end
					local linearVelocity = Instance.new("LinearVelocity")
					linearVelocity.Name = "4HubMover"
					linearVelocity.Attachment0 = attachment
					pcall(function()
						linearVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
					end)
					pcall(function()
						linearVelocity.ForceLimitsEnabled = true
					end)
					linearVelocity.MaxForce = math.huge
					local text4 = "Vector"
					if pcall(function()
						linearVelocity.VelocityConstraintMode = Enum.VelocityConstraintMode.Plane
						linearVelocity.PrimaryTangentAxis = Vector3.new(1, 0, 0)
						linearVelocity.SecondaryTangentAxis = Vector3.new(0, 0, 1)
						linearVelocity.PlaneVelocity = Vector2.new(0, 0)
					end) then
						local entry2 = false
						pcall(function()
							entry2 = linearVelocity.VelocityConstraintMode == Enum.VelocityConstraintMode.Plane
						end)
						if entry2 then
							text4 = "Plane"
						end
					end
					if text4 ~= "Plane" then
						pcall(function()
							linearVelocity.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
						end)
						pcall(function()
							linearVelocity.VectorVelocity = Vector3.zero
						end)
					end
					linearVelocity:SetAttribute("Mode", text4)
					linearVelocity.Enabled = false
					linearVelocity.Parent = parent
					return linearVelocity
				end
				_G.__4HubMove = function(argument22, argument23, argument24)
					local value13 = _G.__4HubGetMover(argument22)
					if not value13 then
						return
					end
					value13.Enabled = true
					if value13:GetAttribute("4HubMode") == "Plane" then
						pcall(function()
							value13.PlaneVelocity = Vector2.new(argument23, argument24)
						end)
					else
						pcall(function()
							value13.VectorVelocity = Vector3.new(argument23, argument22.AssemblyLinearVelocity.Y, argument24)
						end)
					end
				end
				_G.__4HubMoveStop = function(argument25, argument26)
					if not argument25 then
						return
					end
					local 4HubMover = argument25:FindFirstChild("4HubMover")
					if 4HubMover and 4HubMover:IsA("LinearVelocity") then
						if 4HubMover:GetAttribute("Mode") == "Plane" then
							pcall(function()
								4HubMover.PlaneVelocity = Vector2.new(0, 0)
							end)
						else
							pcall(function()
								4HubMover.VectorVelocity = Vector3.new(0, argument25.AssemblyLinearVelocity.Y, 0)
							end)
						end
						if not argument26 then
							4HubMover.Enabled = false
						end
					end
					if not argument26 then
						pcall(function()
							argument25.AssemblyLinearVelocity = Vector3.new(0, argument25.AssemblyLinearVelocity.Y, 0)
						end)
						pcall(function()
							local parent = argument25.Parent
							parent = parent and parent:FindFirstChildOfClass("Humanoid")
							if parent then
								parent:Move(Vector3.zero, false)
							end
						end)
					end
				end
				_G.__4HubAnimSpins = _G.__4HubAnimSpins or {}
				_G.__4HubAnimPulses = _G.__4HubAnimPulses or {}
				_G.__4HubSpin = function(argument27, argument28, argument29)
					if argument27 then
						_G.__4HubAnimSpins[#_G.__4HubAnimSpins + 1] = { g = argument27, s = argument28 or 90, guard = argument29 }
					end
				end
				_G.__4HubPulse = function(argument30)
					if argument30 then
						_G.__4HubAnimPulses[#_G.__4HubAnimPulses + 1] = argument30
					end
				end
				if not _G.__4HubAnimStarted then
					_G.__4HubAnimStarted = true
					do
						local entry3 = 0
						RunService.RenderStepped:Connect(function(deltaTime)
							if _G.__4HubDead then
								return
							end
							entry3 += deltaTime or 0
							if entry3 < (_G.__4HubBoostActive and 0.016666666666666666 or 0.0333) then
								return
							end
							entry3 = 0
							local now2 = tick()
							local 4HubAnimSpins = _G.__4HubAnimSpins
							for i = 1, #4HubAnimSpins do
								local entry4 = 4HubAnimSpins[i]
								if entry4.g and entry4.g.Parent and (not entry4.guard or entry4.guard()) then
									entry4.g.Rotation = now2 * entry4.s % 360
								end
							end
							local 4HubAnimPulses = _G.__4HubAnimPulses
							for i = 1, #4HubAnimPulses do
								pcall(4HubAnimPulses[i], now2)
							end
						end)
					end
				end
				playerGui_ = localPlayer1:WaitForChild("PlayerGui")
				service5 = nil
				pcall(function()
					service5 = game:GetService("CoreGui")
				end)
				do
					local options2 = {
						CleanUI = true,
						SemiInvisibilityUI = true,
						JobJoinerUI = true,
						MynxxInvisSteal = true,
						StealTargetUI = true,
						TargetControlsUI = true,
						AdminPlayerListUI = true,
						RiftBrainrotNotif = true,
						4HubCustomPanel = true,
						NineP_GriefDetector = true,
						ActionsPanelUI = true,
						CommandCooldownUI = true,
						FormegaStealBar = true,
						GhostHub_UnlockBase = true,
						RiftStatusHUD = true,
					}
					handleAction8 = function(parent1)
						for i = 1, 40 do
							if not parent1 then
								return false
							end
							if parent1:IsA("ScreenGui") then
								local name = parent1.Name
								local entry5 = options2[name] or name:sub(1, 4) == "4Hub"
								if not entry5 then
									local entry6 = "Rift"
									entry5 = name:sub(1, 4) == entry6
								end
								entry5 = entry5 or name:sub(1, 5) == "Clean"
								local entry51
								if entry5 then
									entry51 = entry5
								else
									local entry7 = "Ghost"
									entry51 = name:sub(1, 5) == entry7
								end
								return entry51
							end
							parent1 = parent1.Parent
							if parent1 == playerGui_ or parent1 == service5 or parent1 == game then
								return false
							end
						end
						return false
					end
				end
				do
					local items, 4HubAccentOrig, items1, 4HubAccentCur, handleAction13, handleAction14
					do
						local handleAction15
						items = {
							"LightBlue",
							"DarkBlue",
							"BlueLine",
							"Stroke",
							"BlueBtn",
							"HudLBlue",
							"HudSBlue",
							"HudDBlue",
						}
						4HubAccentOrig = {
							LightBlue = Color3.fromRGB(92, 165, 255),
							DarkBlue = Color3.fromRGB(18, 38, 78),
							BlueLine = Color3.fromRGB(60, 120, 220),
							Stroke = Color3.fromRGB(30, 46, 82),
							BlueBtn = Color3.fromRGB(34, 110, 255),
							HudLBlue = Color3.fromRGB(120, 200, 255),
							HudSBlue = Color3.fromRGB(150, 215, 255),
							HudDBlue = Color3.fromRGB(16, 44, 96),
						}
						items1 = {}
						4HubAccentCur = {}
						for _, value14 in ipairs(items) do
							do
								local color, value15, value16 = Color3.toHSV(4HubAccentOrig[value14])
								items1[value14] = { s = value15, v = value16 }
							end
							4HubAccentCur[value14] = 4HubAccentOrig[value14]
						end
						_G.__4HubAccentOrig = 4HubAccentOrig
						_G.__4HubAccentCur = 4HubAccentCur
						_G.__4HubEspTint = function(argument31)
							local lightBlue = _G.__4HubAccentCur and _G.__4HubAccentCur.LightBlue
							if not lightBlue then
								return argument31
							end
							local color, value17, value18 = Color3.toHSV(argument31)
							local value = select(1, Color3.toHSV(lightBlue))
							return Color3.fromHSV(value, value17, value18)
						end
						handleAction13 = function(argument32, argument33)
							local entry8 = 0.012
							return math.abs(argument32.R - argument33.R) < entry8 and math.abs(argument32.G - argument33.G) < 0.012 and math.abs(argument32.B - argument33.B) < 0.012
						end
						handleAction15 = function(argument34, argument35)
							pcall(function()
								if argument34:IsA("UIGradient") then
									local items2 = {}
									local enabled6 = false
									for _, keypoint in ipairs(argument34.Color.Keypoints) do
										local value19 = argument35(keypoint.Value)
										items2[#items2 + 1] = ColorSequenceKeypoint.new(keypoint.Time, value19 or keypoint.Value)
										if value19 then
											enabled6 = true
										end
									end
									if enabled6 then
										argument34.Color = ColorSequence.new(items2)
									end
									return
								end
								if argument34:IsA("UIStroke") then
									local value20 = argument35(argument34.Color)
									if value20 then
										argument34.Color = value20
									end
									return
								end
								if argument34:IsA("GuiObject") then
									local value21 = argument35(argument34.BackgroundColor3)
									if value21 then
										argument34.BackgroundColor3 = value21
									end
								end
								if argument34:IsA("ImageLabel") or argument34:IsA("ImageButton") then
									local value22 = argument35(argument34.ImageColor3)
									if value22 then
										argument34.ImageColor3 = value22
									end
								end
								if argument34:IsA("ScrollingFrame") then
									local value23 = argument35(argument34.ScrollBarImageColor3)
									if value23 then
										argument34.ScrollBarImageColor3 = value23
									end
								end
							end)
						end
						do
							local function handleAction16()
								local items3 = { playerGui_ }
								if service5 then
									items3[#items3 + 1] = service5
								end
								return items3
							end
							handleAction14 = function(argument36)
								for _, value24 in ipairs(handleAction16()) do
									pcall(function()
										for _, child in ipairs(value24:GetChildren()) do
											if child:IsA("ScreenGui") and handleAction8(child) then
												handleAction15(child, argument36)
												for _, descendant in ipairs(child:GetDescendants()) do
													handleAction15(descendant, argument36)
												end
											end
										end
									end)
								end
							end
						end
						do
							local function handleAction17(argument37)
								for _, value25 in ipairs(items) do
									if handleAction13(argument37, 4HubAccentOrig[value25]) or handleAction13(argument37, 4HubAccentCur[value25]) then
										return 4HubAccentCur[value25]
									end
								end
								return nil
							end
							playerGui_.DescendantAdded:Connect(function(descendant)
								if handleAction8(descendant) then
									task.defer(handleAction15, descendant, handleAction17)
								end
							end)
						end
					end
					_G.__4HubThemeFollowers = _G.__4HubThemeFollowers or {}
					_G.__4HubOnTheme = function(argument38)
						if type(argument38) ~= "function" then
							return
						end
						_G.__4HubThemeFollowers[#_G.__4HubThemeFollowers + 1] = argument38
						pcall(argument38, 4HubAccentCur)
					end
					do
						local function handleAction18()
							for _, 4HubThemeFollower in ipairs(_G.__4HubThemeFollowers) do
								pcall(4HubThemeFollower, 4HubAccentCur)
							end
						end
						_G.__4HubEspItems = _G.__4HubEspItems or {}
						_G.__4HubEspBind = function(argument39, argument40, argument41, argument42)
							if not argument39 then
								return
							end
							local function handleAction19()
								local value26 = _G.__4HubEspTint(argument41)
								pcall(function()
									if argument42 == "seq" then
										argument39[argument40] = ColorSequence.new(value26)
									else
										argument39[argument40] = value26
									end
								end)
							end
							handleAction19()
							_G.__4HubEspItems[#_G.__4HubEspItems + 1] = { inst = argument39, apply = handleAction19 }
						end
						_G.__4HubOnTheme(function()
							local 4HubEspItems = _G.__4HubEspItems
							local number6 = #4HubEspItems
							local entry9 = 0
							for i = 1, number6 do
								local entry10 = 4HubEspItems[i]
								if entry10.inst and entry10.inst.Parent then
									entry9 += 1
									4HubEspItems[entry9] = entry10
									pcall(entry10.apply)
								end
							end
							for i = entry9 + 1, number6 do
								4HubEspItems[i] = nil
							end
						end)
						local lightBlue = 4HubAccentOrig.LightBlue
						local darkBlue = 4HubAccentOrig.DarkBlue
						local value27 = _G
						_G.__4HubPrimary = lightBlue
						value27.__4HubSecondary = darkBlue
						_G.__4HubApplyColors = function(4HubPrimary, 4HubSecondary)
							4HubPrimary = 4HubPrimary or lightBlue
							4HubSecondary = 4HubSecondary or darkBlue
							local value = select(1, Color3.toHSV(4HubPrimary))
							local items4 = {}
							for _, value28 in ipairs(items) do
								if value28 == "LightBlue" then
									items4[value28] = 4HubPrimary
								elseif value28 == "DarkBlue" then
									items4[value28] = 4HubSecondary
								else
									items4[value28] = Color3.fromHSV(value, items1[value28].s, items1[value28].v)
								end
							end
							handleAction14(function(argument43)
								for _, value29 in ipairs(items) do
									if handleAction13(argument43, 4HubAccentOrig[value29]) or handleAction13(argument43, 4HubAccentCur[value29]) then
										return items4[value29]
									end
								end
								return nil
							end)
							for _, value30 in ipairs(items) do
								4HubAccentCur[value30] = items4[value30]
							end
							themeColors.LightBlue = 4HubAccentCur.LightBlue
							themeColors.DarkBlue = 4HubAccentCur.DarkBlue
							themeColors.BlueLine = 4HubAccentCur.BlueLine
							lightBlue = 4HubPrimary
							darkBlue = 4HubSecondary
							local value31 = _G
							_G.__4HubPrimary = 4HubPrimary
							value31.__4HubSecondary = 4HubSecondary
							handleAction18()
						end
						_G.__4HubApplyHue = function(argument44)
							local 4HubThemeHue = argument44 % 1
							local color = Color3.fromHSV
							local s = items1.DarkBlue.s
							local v1 = items1.DarkBlue.v
							_G.__4HubApplyColors(Color3.fromHSV(4HubThemeHue, items1.LightBlue.s, items1.LightBlue.v), color(4HubThemeHue, s, v1))
							_G.__4HubThemeHue = 4HubThemeHue
						end
						_G.__4HubGetPrimary = function()
							return lightBlue
						end
						_G.__4HubGetSecondary = function()
							return darkBlue
						end
					end
					_G.__4HubGetHue = function()
						return _G.__4HubThemeHue or select(1, Color3.toHSV(4HubAccentOrig.LightBlue))
					end
				end
				udim2 = UDim2.fromOffset(660, 452)
				frame = Instance.new("Frame")
				frame.Name = "Window"
				frame.AnchorPoint = Vector2.new(0.5, 0.5)
				frame.Size = udim2
				frame.Position = UDim2.new(0.5, 0, 0.5, 0)
				frame.BackgroundColor3 = themeColors.BgDark
				frame.BorderSizePixel = 0
				frame.ClipsDescendants = true
				frame.Parent = screenGui
				createUICorner(frame, 12)
				do
					local uiGradient = Instance.new("UIGradient")
					uiGradient.Rotation = 90
					local new = ColorSequenceKeypoint.new
					local bgDark = themeColors.BgDark
					uiGradient.Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, themeColors.Black),
						new(1, bgDark),
					})
					uiGradient.Parent = frame
				end
			end
			uiStroke = Instance.new("UIStroke")
			uiStroke.Thickness = 1.5
			uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uiStroke.Parent = frame
			do
				local uiGradient = Instance.new("UIGradient")
				local colorSequence = ColorSequence.new
				local items5 = {}
				local value32 = ColorSequenceKeypoint.new(0, themeColors.DarkBlue)
				local value33 = ColorSequenceKeypoint.new(0.5, themeColors.LightBlue)
				local new = ColorSequenceKeypoint.new
				local darkBlue = themeColors.DarkBlue
				items5[1] = value32
				items5[2] = value33
				do
					local values = table.pack(new(1, darkBlue))
					table.move(values, 1, values.n, 3, items5)
				end
				uiGradient.Color = colorSequence(items5)
				uiGradient.Parent = uiStroke
				_G.__4HubSpin(uiGradient, 90)
			end
			frame2 = Instance.new("Frame")
			frame2.Name = "Sidebar"
			frame2.Size = UDim2.new(0, 138, 1, 0)
			frame2.BackgroundColor3 = themeColors.Sidebar
			frame2.BorderSizePixel = 0
			frame2.Parent = frame
			createUICorner(frame2, 12)
			do
				local frame7 = Instance.new("Frame")
				frame7.Size = UDim2.new(0, 14, 1, 0)
				frame7.Position = UDim2.new(1, -14, 0, 0)
				frame7.BackgroundColor3 = themeColors.Sidebar
				frame7.BorderSizePixel = 0
				frame7.Parent = frame2
			end
			do
				local frame7 = Instance.new("Frame")
				frame7.Size = UDim2.new(0, 1, 1, 0)
				frame7.Position = UDim2.new(1, 0, 0, 0)
				frame7.BackgroundColor3 = themeColors.Stroke
				frame7.BorderSizePixel = 0
				frame7.ZIndex = 3
				frame7.Parent = frame2
			end
			do
				local instance2
				do
					local frame7 = Instance.new("Frame")
					frame7.Name = "ServerIcon"
					frame7.Size = UDim2.fromOffset(46, 46)
					frame7.Position = UDim2.fromOffset(12, 12)
					frame7.BackgroundColor3 = themeColors.DarkBlue
					frame7.BorderSizePixel = 0
					frame7.ZIndex = 4
					frame7.Parent = frame2
					createUICorner(frame7, 10)
					createUIStroke(frame7, themeColors.LightBlue, 1)
					instance2 = Instance.new("ImageLabel")
					instance2.Name = "RMark"
					instance2.Size = UDim2.new(1, -6, 1, -6)
					instance2.Position = UDim2.new(0, 3, 0, 3)
					instance2.BackgroundTransparency = 1
					instance2.Image = "rbxassetid://84149277273810"
					instance2.ResampleMode = Enum.ResamplerMode.Default
					instance2.ScaleType = Enum.ScaleType.Fit
					instance2.ZIndex = 5
					instance2.Parent = frame7
				end
				local uiCorner = Instance.new("UICorner")
				uiCorner.CornerRadius = UDim.new(0, 8)
				uiCorner.Parent = instance2
			end
			do
				local instance2 = Instance.new("TextLabel")
				instance2.Size = UDim2.new(1, -68, 0, 20)
				instance2.Position = UDim2.fromOffset(66, 16)
				instance2.BackgroundTransparency = 1
				instance2.Font = gothamBold
				instance2.Text = "4Hub HUB"
				instance2.TextColor3 = themeColors.White
				instance2.TextSize = 15
				instance2.TextXAlignment = Enum.TextXAlignment.Left
				instance2.ZIndex = 4
				instance2.Parent = frame2
			end
			do
				local textLabel = Instance.new("TextLabel")
				textLabel.Size = UDim2.new(1, -68, 0, 14)
				textLabel.Position = UDim2.fromOffset(68, 34)
				textLabel.BackgroundTransparency = 1
				textLabel.Font = gothamMedium
				textLabel.Text = "Roblox"
				textLabel.TextColor3 = themeColors.LightBlue
				textLabel.TextSize = 11
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.ZIndex = 4
				textLabel.Parent = frame2
			end
			do
				local frame7 = Instance.new("Frame")
				frame7.Name = "TabPanel"
				frame7.Size = UDim2.new(1, -16, 1, -142)
				frame7.Position = UDim2.fromOffset(8, 68)
				frame7.BackgroundColor3 = themeColors.BgDark
				frame7.BackgroundTransparency = 0.35
				frame7.BorderSizePixel = 0
				frame7.Parent = frame2
				createUICorner(frame7, 10)
				createUIStroke(frame7, themeColors.Stroke, 1)
				local textLabel = Instance.new("TextLabel")
				textLabel.Size = UDim2.new(1, -20, 0, 14)
				textLabel.Position = UDim2.fromOffset(14, 8)
				textLabel.BackgroundTransparency = 1
				textLabel.Font = gothamBold
				textLabel.Text = "FEATURES"
				textLabel.TextColor3 = themeColors.LightBlue
				textLabel.TextSize = 10
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.Parent = frame7
				frame6 = Instance.new("Frame")
				frame6.Size = UDim2.new(1, -12, 1, -34)
				frame6.Position = UDim2.fromOffset(6, 26)
				frame6.BackgroundTransparency = 1
				frame6.Parent = frame7
			end
			do
				local uiListLayout = Instance.new("UIListLayout")
				uiListLayout.Padding = UDim.new(0, 6)
				uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				uiListLayout.Parent = frame6
			end
			local textButton2, textButton3, number7, handleAction20, handleAction21
			do
				local frame7
				do
					local frame8
					do
						local frame9
						frame9 = Instance.new("Frame")
						frame9.Name = "UserCard"
						frame9.AnchorPoint = Vector2.new(0, 1)
						frame9.Size = UDim2.new(1, -20, 0, 52)
						frame9.Position = UDim2.new(0, 10, 1, -10)
						frame9.BackgroundColor3 = themeColors.BgDark
						frame9.BorderSizePixel = 0
						frame9.ZIndex = 4
						frame9.Parent = frame2
						createUICorner(frame9, 10)
						createUIStroke(frame9, themeColors.Stroke, 1)
						do
							local frame10 = Instance.new("Frame")
							frame10.Size = UDim2.fromOffset(38, 38)
							frame10.Position = UDim2.fromOffset(7, 7)
							frame10.BackgroundColor3 = themeColors.DarkBlue
							frame10.BorderSizePixel = 0
							frame10.ZIndex = 5
							frame10.Parent = frame9
							createUICorner(frame10, 8)
							createUIStroke(frame10, themeColors.LightBlue, 1)
							local instance2 = Instance.new("ImageLabel")
							instance2.Size = UDim2.new(1, -4, 1, -4)
							instance2.Position = UDim2.fromOffset(2, 2)
							instance2.BackgroundTransparency = 1
							instance2.ZIndex = 6
							instance2.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(localPlayer1.UserId) .. "&w=150&h=150"
							instance2.Parent = frame10
							createUICorner(instance2, 6)
						end
						do
							local textLabel = Instance.new("TextLabel")
							textLabel.Size = UDim2.new(1, -56, 0, 18)
							textLabel.Position = UDim2.fromOffset(52, 8)
							textLabel.BackgroundTransparency = 1
							textLabel.Font = gothamBold
							textLabel.Text = localPlayer1.DisplayName
							textLabel.TextColor3 = themeColors.White
							textLabel.TextSize = 14
							textLabel.TextXAlignment = Enum.TextXAlignment.Left
							textLabel.TextTruncate = Enum.TextTruncate.AtEnd
							textLabel.ZIndex = 5
							textLabel.Parent = frame9
						end
						local textLabel = Instance.new("TextLabel")
						textLabel.Size = UDim2.new(1, -56, 0, 14)
						textLabel.Position = UDim2.fromOffset(52, 26)
						textLabel.BackgroundTransparency = 1
						textLabel.Font = gothamMedium
						textLabel.Text = "@" .. localPlayer1.Name
						textLabel.TextColor3 = themeColors.TextDim
						textLabel.TextSize = 11
						textLabel.TextXAlignment = Enum.TextXAlignment.Left
						textLabel.TextTruncate = Enum.TextTruncate.AtEnd
						textLabel.ZIndex = 5
						textLabel.Parent = frame9
					end
					instance = Instance.new("Frame")
					instance.Name = "Content"
					instance.Size = UDim2.new(1, -138, 1, 0)
					instance.Position = UDim2.fromOffset(138, 0)
					instance.BackgroundColor3 = themeColors.BgPanel
					instance.BorderSizePixel = 0
					instance.Parent = frame
					createUICorner(instance, 12)
					do
						local frame9 = Instance.new("Frame")
						frame9.Size = UDim2.new(0, 14, 1, 0)
						frame9.BackgroundColor3 = themeColors.BgPanel
						frame9.BorderSizePixel = 0
						frame9.Parent = instance
					end
					do
						local frame9 = Instance.new("Frame")
						frame9.Name = "Header"
						frame9.Size = UDim2.new(1, -20, 0, 32)
						frame9.Position = UDim2.fromOffset(10, 10)
						frame9.BackgroundColor3 = themeColors.BgDark
						frame9.BackgroundTransparency = 0.25
						frame9.BorderSizePixel = 0
						frame9.Parent = instance
						createUICorner(frame9, 10)
						createUIStroke(frame9, themeColors.Stroke, 1)
						local textLabel = Instance.new("TextLabel")
						textLabel.BackgroundTransparency = 1
						textLabel.Position = UDim2.fromOffset(14, 0)
						textLabel.Size = UDim2.new(1, -50, 1, 0)
						textLabel.Font = gothamBold
						textLabel.Text = "4Hub HUB"
						textLabel.TextColor3 = themeColors.White
						textLabel.TextSize = 13
						textLabel.TextXAlignment = Enum.TextXAlignment.Left
						textLabel.Parent = frame9
						frame3 = Instance.new("Frame")
						frame3.Name = "ContentPanel"
						frame3.Size = UDim2.new(1, -20, 1, -54)
						frame3.Position = UDim2.fromOffset(10, 48)
						frame3.BackgroundColor3 = themeColors.BgDark
						frame3.BackgroundTransparency = 0.25
						frame3.BorderSizePixel = 0
						frame3.Parent = instance
						createUICorner(frame3, 10)
						createUIStroke(frame3, themeColors.Stroke, 1)
						textButton = Instance.new("TextButton")
						textButton.Name = "Close"
						textButton.AnchorPoint = Vector2.new(1, 0.5)
						textButton.Position = UDim2.new(1, -8, 0.5, 0)
						textButton.Size = UDim2.fromOffset(24, 24)
						textButton.BackgroundTransparency = 1
						textButton.Font = gothamBold
						textButton.Text = "X"
						textButton.TextColor3 = themeColors.White
						textButton.TextSize = 16
						textButton.ZIndex = 10
						textButton.Parent = frame9
						textButton.MouseEnter:Connect(function()
							local options3 = { TextColor3 = themeColors.Black }
							TweenService:Create(textButton, TweenInfo.new(0.12), options3):Play()
						end)
						textButton.MouseLeave:Connect(function()
							local options4 = { TextColor3 = themeColors.White }
							TweenService:Create(textButton, TweenInfo.new(0.12), options4):Play()
						end)
						textButton2 = Instance.new("TextButton")
						textButton2.Name = "ThemeDotDark"
						textButton2.AnchorPoint = Vector2.new(1, 0.5)
						textButton2.Position = UDim2.new(1, -38, 0.5, 0)
						textButton2.Size = UDim2.fromOffset(15, 15)
						textButton2.AutoButtonColor = false
						textButton2.Text = ""
						textButton2.BackgroundColor3 = themeColors.DarkBlue
						textButton2.ZIndex = 10
						textButton2.Parent = frame9
						textButton2.Visible = false
						createUICorner(textButton2, 8)
						createUIStroke(textButton2, themeColors.LightBlue, 1)
						textButton3 = Instance.new("TextButton")
						textButton3.Name = "ThemeDotLight"
						textButton3.AnchorPoint = Vector2.new(1, 0.5)
						textButton3.Position = UDim2.new(1, -54, 0.5, 0)
						textButton3.Size = UDim2.fromOffset(15, 15)
						textButton3.AutoButtonColor = false
						textButton3.Text = ""
						textButton3.BackgroundColor3 = themeColors.LightBlue
						textButton3.ZIndex = 10
						textButton3.Parent = frame9
					end
					textButton3.Visible = false
					createUICorner(textButton3, 8)
					createUIStroke(textButton3, themeColors.White, 1)
					frame8 = Instance.new("Frame")
					frame8.Name = "ThemeColorPopup"
					frame8.AnchorPoint = Vector2.new(1, 0)
					frame8.Position = UDim2.new(1, -14, 0, 50)
					frame8.Size = UDim2.fromOffset(214, 92)
					frame8.BackgroundColor3 = themeColors.BgPanel
					frame8.BorderSizePixel = 0
					frame8.Visible = false
					frame8.ZIndex = 40
					frame8.Active = true
					frame8.Parent = frame
					createUICorner(frame8, 10)
					createUIStroke(frame8, themeColors.Stroke, 1)
					do
						local textLabel = Instance.new("TextLabel")
						textLabel.BackgroundTransparency = 1
						textLabel.Position = UDim2.fromOffset(12, 8)
						textLabel.Size = UDim2.new(1, -24, 0, 16)
						textLabel.Font = gothamBold
						textLabel.Text = "Theme Colour"
						textLabel.TextColor3 = themeColors.White
						textLabel.TextSize = 12
						textLabel.TextXAlignment = Enum.TextXAlignment.Left
						textLabel.ZIndex = 41
						textLabel.Parent = frame8
					end
					local frame9
					frame9 = Instance.new("Frame")
					frame9.AnchorPoint = Vector2.new(1, 0)
					frame9.Position = UDim2.new(1, -12, 0, 8)
					frame9.Size = UDim2.fromOffset(16, 16)
					frame9.BackgroundColor3 = themeColors.LightBlue
					frame9.BorderSizePixel = 0
					frame9.ZIndex = 41
					frame9.Parent = frame8
					createUICorner(frame9, 8)
					createUIStroke(frame9, themeColors.White, 1)
					frame7 = Instance.new("Frame")
					frame7.Position = UDim2.fromOffset(12, 34)
					frame7.Size = UDim2.new(1, -24, 0, 16)
					frame7.BorderSizePixel = 0
					frame7.BackgroundColor3 = themeColors.White
					frame7.ZIndex = 41
					frame7.Active = true
					frame7.Parent = frame8
					createUICorner(frame7, 8)
					do
						local instance2 = Instance.new("UIGradient")
						local colorSequence = ColorSequence.new
						local items6 = {}
						local value34 = ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0))
						local value35 = ColorSequenceKeypoint.new(0.05, Color3.fromRGB(0, 0, 0))
						local value36 = ColorSequenceKeypoint.new(0.18, Color3.fromRGB(255, 0, 0))
						local value37 = ColorSequenceKeypoint.new(0.31, Color3.fromRGB(255, 255, 0))
						local value38 = ColorSequenceKeypoint.new(0.45, Color3.fromRGB(0, 255, 0))
						local value39 = ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 255, 255))
						local value40 = ColorSequenceKeypoint.new(0.73, Color3.fromRGB(0, 0, 255))
						local value41 = ColorSequenceKeypoint.new(0.87, Color3.fromRGB(255, 0, 255))
						local new = ColorSequenceKeypoint.new
						local color = Color3.fromRGB
						items6[1] = value34
						items6[2] = value35
						items6[3] = value36
						items6[4] = value37
						items6[5] = value38
						items6[6] = value39
						items6[7] = value40
						items6[8] = value41
						do
							local values = table.pack(new(1, color(255, 0, 0)))
							table.move(values, 1, values.n, 9, items6)
						end
						instance2.Color = colorSequence(items6)
						instance2.Parent = frame7
					end
					do
						local frame10, color, color2
						frame10 = Instance.new("Frame")
						frame10.AnchorPoint = Vector2.new(0.5, 0.5)
						frame10.Size = UDim2.fromOffset(4, 22)
						frame10.Position = UDim2.new(0, 0, 0.5, 0)
						frame10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						frame10.BorderSizePixel = 0
						frame10.ZIndex = 42
						frame10.Parent = frame7
						createUICorner(frame10, 2)
						createUIStroke(frame10, Color3.fromRGB(0, 0, 0), 1)
						do
							local textLabel = Instance.new("TextLabel")
							textLabel.BackgroundTransparency = 1
							textLabel.Position = UDim2.fromOffset(12, 56)
							textLabel.Size = UDim2.new(1, -24, 0, 28)
							textLabel.Font = gothamMedium
							textLabel.Text = "Drag to recolour • far left = black • double-click a circle to reset"
							textLabel.TextColor3 = themeColors.TextDim
							textLabel.TextSize = 10
							textLabel.TextWrapped = true
							textLabel.TextXAlignment = Enum.TextXAlignment.Left
							textLabel.TextYAlignment = Enum.TextYAlignment.Top
							textLabel.ZIndex = 41
							textLabel.Parent = frame8
						end
						color = Color3.fromRGB(165, 170, 180)
						color2 = Color3.fromRGB(16, 17, 20)
						do
							local color3 = Color3.fromRGB(92, 165, 255)
							Color3.fromRGB(18, 38, 78)
							number7 = 0.1 + select(1, Color3.toHSV(color3)) * 0.9
						end
						local tweenInfo2 = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
						local tweenInfo3 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
						handleAction20 = function(argument45, argument46)
							if argument46 then
								frame10.Position = UDim2.new(argument45, 0, 0.5, 0)
							else
								TweenService:Create(frame10, tweenInfo2, { Position = UDim2.new(argument45, 0, 0.5, 0) }):Play()
							end
						end
						handleAction21 = function(argument47, argument48, argument49)
							local number8 = math.clamp(argument47, 0, 1)
							local color3
							if number8 <= 0.1 then
								if _G.__4HubApplyColors then
									_G.__4HubApplyColors(color, color2)
								end
								color3 = color2
							else
								local number9 = (number8 - 0.1) / 0.9
								if _G.__4HubApplyHue then
									_G.__4HubApplyHue(number9)
								end
								color3 = Color3.fromHSV(number9, 0.85, 1)
							end
							TweenService:Create(frame9, tweenInfo3, { BackgroundColor3 = color3 }):Play()
							handleAction20(number8, argument49)
							if argument48 then
								saveNumber("ThemeSel", number8)
							end
						end
					end
				end
				local enabled7 = false
				local function handleAction22(argument50)
					handleAction21(math.clamp((argument50 - frame7.AbsolutePosition.X) / math.max(frame7.AbsoluteSize.X, 1), 0, 1), true, true)
				end
				frame7.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						enabled7 = true
						handleAction22(input.Position.X)
					end
				end)
				userInputService.InputChanged:Connect(function(input)
					if enabled7 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
						handleAction22(input.Position.X)
					end
				end)
				userInputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						enabled7 = false
					end
				end)
			end
			do
				local players1, Workspace2
				do
					local function handleAction23()
					end
					textButton2.MouseButton1Click:Connect(handleAction23)
					textButton3.MouseButton1Click:Connect(handleAction23)
				end
				task.defer(function()
					local ThemeSel = getSavedNumber("ThemeSel")
					if type(ThemeSel) == "number" then
						handleAction21(ThemeSel, false, true)
					else
						handleAction20(number7, true)
					end
				end)
				tabRegistry = {}
				do
					local value42 = nil
					selectTab = function(tabName)
						for k, value43 in pairs(tabRegistry) do
							local visible = k == tabName
							value43.page.Visible = visible
							TweenService:Create(value43.btn, TweenInfo.new(0.18), {
								BackgroundColor3 = visible and themeColors.DarkBlue or themeColors.Sidebar,
								BackgroundTransparency = visible and 0 or 1,
							}):Play()
							TweenService:Create(value43.label, TweenInfo.new(0.18), { TextColor3 = visible and themeColors.White or themeColors.TextDim }):Play()
							value43.indicator.Visible = visible
						end
						value42 = tabName
					end
					local function createScrollingFrame(name, layoutOrder)
						local textButton4 = Instance.new("TextButton")
						textButton4.Name = name
						textButton4.Size = UDim2.new(1, 0, 0, 34)
						textButton4.BackgroundColor3 = themeColors.Sidebar
						textButton4.BackgroundTransparency = 1
						textButton4.AutoButtonColor = false
						textButton4.Text = ""
						textButton4.LayoutOrder = layoutOrder
						textButton4.Parent = frame6
						createUICorner(textButton4, 8)
						local frame7 = Instance.new("Frame")
						frame7.Size = UDim2.new(0, 3, 0.6, 0)
						frame7.Position = UDim2.new(0, 0, 0.2, 0)
						frame7.BackgroundColor3 = themeColors.LightBlue
						frame7.BorderSizePixel = 0
						frame7.Visible = false
						frame7.Parent = textButton4
						createUICorner(frame7, 2)
						local textLabel = Instance.new("TextLabel")
						textLabel.Size = UDim2.new(1, -24, 1, 0)
						textLabel.Position = UDim2.fromOffset(12, 0)
						textLabel.BackgroundTransparency = 1
						textLabel.Font = gothamMedium
						textLabel.Text = name
						textLabel.TextColor3 = themeColors.TextDim
						textLabel.TextSize = 13
						textLabel.TextXAlignment = Enum.TextXAlignment.Left
						textLabel.Parent = textButton4
						local scrollingFrame = Instance.new("ScrollingFrame")
						scrollingFrame.Name = name .. "Page"
						scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
						scrollingFrame.Position = UDim2.fromOffset(0, 0)
						scrollingFrame.BackgroundTransparency = 1
						scrollingFrame.BorderSizePixel = 0
						scrollingFrame.ScrollBarThickness = 3
						scrollingFrame.ScrollBarImageColor3 = themeColors.LightBlue
						scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
						scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
						scrollingFrame.Visible = false
						scrollingFrame.Parent = frame3
						createUIPadding(scrollingFrame, 14)
						local uiListLayout = Instance.new("UIListLayout")
						uiListLayout.Padding = UDim.new(0, 10)
						uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
						uiListLayout.Parent = scrollingFrame
						textButton4.MouseEnter:Connect(function()
							if value42 ~= name then
								local options5 = { TextColor3 = themeColors.White }
								TweenService:Create(textLabel, TweenInfo.new(0.15), options5):Play()
							end
						end)
						textButton4.MouseLeave:Connect(function()
							if value42 ~= name then
								local options6 = { TextColor3 = themeColors.TextDim }
								TweenService:Create(textLabel, TweenInfo.new(0.15), options6):Play()
							end
						end)
						textButton4.MouseButton1Click:Connect(function()
							selectTab(name)
						end)
						tabRegistry[name] = { btn = textButton4, label = textLabel, page = scrollingFrame, indicator = frame7 }
						return scrollingFrame
					end
					createSection = function(parent, title, textColor3, backgroundColor3, backgroundColor32, layoutOrder)
						local instance2 = Instance.new("Frame")
						instance2.Size = UDim2.new(1, 0, 0, 30)
						instance2.BackgroundTransparency = 1
						instance2.LayoutOrder = layoutOrder
						instance2.Parent = parent
						local textLabel = Instance.new("TextLabel")
						textLabel.AutomaticSize = Enum.AutomaticSize.X
						textLabel.Size = UDim2.new(0, 0, 0, 24)
						textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
						textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
						textLabel.BackgroundColor3 = backgroundColor3
						textLabel.Font = gothamBold
						textLabel.Text = "   " .. title .. "   "
						textLabel.TextColor3 = textColor3
						textLabel.TextSize = 13
						textLabel.ZIndex = 3
						textLabel.Parent = instance2
						createUICorner(textLabel, 6)
						local frame7 = Instance.new("Frame")
						frame7.AnchorPoint = Vector2.new(1, 0.5)
						frame7.Size = UDim2.new(0.5, -60, 0, 2)
						frame7.Position = UDim2.new(0.5, -46, 0.5, 0)
						frame7.BackgroundColor3 = backgroundColor32
						frame7.BorderSizePixel = 0
						frame7.Parent = instance2
						createUICorner(frame7, 1)
						local uiGradient = Instance.new("UIGradient")
						uiGradient.Color = ColorSequence.new(backgroundColor32)
						local new = NumberSequenceKeypoint.new
						uiGradient.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), new(1, 0) })
						uiGradient.Parent = frame7
						local frame8 = Instance.new("Frame")
						frame8.AnchorPoint = Vector2.new(0, 0.5)
						frame8.Size = UDim2.new(0.5, -60, 0, 2)
						frame8.Position = UDim2.new(0.5, 46, 0.5, 0)
						frame8.BackgroundColor3 = backgroundColor32
						frame8.BorderSizePixel = 0
						frame8.Parent = instance2
						createUICorner(frame8, 1)
						local uiGradient2 = Instance.new("UIGradient")
						uiGradient2.Color = ColorSequence.new(backgroundColor32)
						local new2 = NumberSequenceKeypoint.new
						uiGradient2.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), new2(1, 1) })
						uiGradient2.Parent = frame8
						return instance2
					end
					createToggle = function(parent, text, layoutOrder, defaultEnabled, onChanged, shortcutKey, onShortcut)
						local defaultEnabled2 = getSavedToggle(text) or defaultEnabled or false
						local frame7 = Instance.new("Frame")
						frame7.Size = UDim2.new(1, 0, 0, 38)
						frame7.BackgroundColor3 = themeColors.BgDark
						frame7.BorderSizePixel = 0
						frame7.LayoutOrder = layoutOrder
						frame7.Parent = parent
						createUICorner(frame7, 8)
						local value44 = createUIStroke(frame7, themeColors.Stroke, 1)
						local instance2 = Instance.new("Frame")
						instance2.Size = UDim2.new(0, 3, 0.55, 0)
						instance2.Position = UDim2.new(0, 0, 0.225, 0)
						instance2.BackgroundColor3 = themeColors.DarkBlue
						instance2.BorderSizePixel = 0
						instance2.Parent = frame7
						createUICorner(instance2, 2)
						local textButton4 = Instance.new("TextButton")
						textButton4.Size = UDim2.new(1, 0, 1, 0)
						textButton4.BackgroundTransparency = 1
						textButton4.Text = ""
						textButton4.ZIndex = 0
						textButton4.Parent = frame7
						textButton4.MouseEnter:Connect(function()
							if enabled1 then
								return
							end
							local options7 = { Color = themeColors.LightBlue }
							TweenService:Create(value44, TweenInfo.new(0.15), options7):Play()
							local options8 = { BackgroundColor3 = themeColors.LightBlue }
							TweenService:Create(instance2, TweenInfo.new(0.15), options8):Play()
						end)
						textButton4.MouseLeave:Connect(function()
							local options9 = { Color = themeColors.Stroke }
							TweenService:Create(value44, TweenInfo.new(0.15), options9):Play()
							local options10 = { BackgroundColor3 = themeColors.DarkBlue }
							TweenService:Create(instance2, TweenInfo.new(0.15), options10):Play()
						end)
						local instance3 = Instance.new("TextLabel")
						instance3.Size = shortcutKey and UDim2.new(1, -70, 1, 0) or UDim2.new(1, -70, 1, 0)
						instance3.Position = shortcutKey and UDim2.fromOffset(64, 0) or UDim2.fromOffset(14, 0)
						instance3.BackgroundTransparency = 1
						instance3.Font = gothamMedium
						instance3.Text = text
						instance3.TextColor3 = themeColors.White
						instance3.TextSize = 13
						instance3.TextXAlignment = Enum.TextXAlignment.Left
						instance3.Parent = frame7
						local textButton5 = Instance.new("TextButton")
						textButton5.AnchorPoint = shortcutKey and Vector2.new(0, 0.5) or Vector2.new(1, 0.5)
						textButton5.Position = shortcutKey and UDim2.new(0, 14, 0.5, 0) or UDim2.new(1, -12, 0.5, 0)
						textButton5.Size = UDim2.fromOffset(40, 20)
						textButton5.BackgroundColor3 = defaultEnabled2 and themeColors.LightBlue or themeColors.ToggleOff
						textButton5.AutoButtonColor = false
						textButton5.Text = ""
						textButton5.Parent = frame7
						createUICorner(textButton5, 10)
						local frame8 = Instance.new("Frame")
						frame8.Size = UDim2.fromOffset(14, 14)
						frame8.Position = defaultEnabled2 and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
						frame8.BackgroundColor3 = themeColors.White
						frame8.BorderSizePixel = 0
						frame8.Parent = textButton5
						createUICorner(frame8, 7)
						if onShortcut then
							local textButton6 = Instance.new("TextButton")
							textButton6.AnchorPoint = Vector2.new(1, 0.5)
							textButton6.Position = UDim2.new(1, -54, 0.5, 0)
							textButton6.Size = UDim2.fromOffset(16, 24)
							textButton6.BackgroundTransparency = 1
							textButton6.Text = ""
							textButton6.Parent = frame7
							for i = 1, 3 do
								local frame9 = Instance.new("Frame")
								frame9.AnchorPoint = Vector2.new(0.5, 0.5)
								frame9.Size = UDim2.fromOffset(3, 3)
								frame9.Position = UDim2.new(0.5, 0, 0.5, (i - 2) * 6)
								frame9.BackgroundColor3 = themeColors.TextDim
								frame9.BorderSizePixel = 0
								frame9.Parent = textButton6
								createUICorner(frame9, 2)
							end
							textButton6.MouseButton1Click:Connect(function()
								task.spawn(onShortcut)
							end)
						end
						local function handleAction24()
							local lightBlue = _G.__4HubAccentCur and _G.__4HubAccentCur.LightBlue or themeColors.LightBlue
							local value45 = TweenService
							local create = value45.Create
							local tweenInfo2 = TweenInfo.new(0.18)
							local items7 = {}
							local defaultEnabled21 = defaultEnabled2
							if not defaultEnabled2 then
								lightBlue = defaultEnabled21
							end
							items7.BackgroundColor3 = lightBlue or themeColors.ToggleOff
							create(value45, textButton5, tweenInfo2, items7):Play()
							TweenService:Create(frame8, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {
								Position = defaultEnabled2 and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7),
							}):Play()
						end
						if _G.__4HubOnTheme then
							_G.__4HubOnTheme(function()
								handleAction24()
							end)
						end
						textButton5.MouseButton1Click:Connect(function()
							defaultEnabled2 = not defaultEnabled2
							handleAction24()
							saveToggle(text, defaultEnabled2)
							if _G.__4HubNotify then
								_G.__4HubNotify(text, defaultEnabled2 and "Enabled" or "Disabled")
							end
							if onChanged then
								task.spawn(onChanged, defaultEnabled2)
							end
						end)
						if defaultEnabled2 and onChanged then
							task.defer(function()
								handleAction24()
								task.spawn(onChanged, true)
							end)
						end
						local options11 = {
							Set = function(argument51)
								defaultEnabled2 = argument51
								handleAction24()
								saveToggle(text, argument51)
								if onChanged then
									task.spawn(onChanged, argument51)
								end
							end,
							SetSilent = function(argument52)
								if defaultEnabled2 == argument52 then
									return
								end
								defaultEnabled2 = argument52
								handleAction24()
								saveToggle(text, argument52)
							end,
							Get = function()
								return defaultEnabled2
							end,
						}
						_G.__4HubToggles = _G.__4HubToggles or {}
						_G.__4HubToggles[text] = options11
						return options11
					end
					createKeybindToggle = function(parent, text, layoutOrder, showShortcut, shortcutKey1, onChanged1, onShortcut1, defaultEnabled1)
						shortcutKey1 = handleAction7(text) or shortcutKey1
						local enabled8 = false
						local frame7 = Instance.new("Frame")
						frame7.Size = UDim2.new(1, 0, 0, 38)
						frame7.BackgroundColor3 = themeColors.BgDark
						frame7.BorderSizePixel = 0
						frame7.LayoutOrder = layoutOrder
						frame7.Parent = parent
						createUICorner(frame7, 8)
						createUIStroke(frame7, themeColors.Stroke, 1)
						local frame8 = Instance.new("Frame")
						frame8.Size = UDim2.new(0, 3, 0.55, 0)
						frame8.Position = UDim2.new(0, 0, 0.225, 0)
						frame8.BackgroundColor3 = themeColors.DarkBlue
						frame8.BorderSizePixel = 0
						frame8.Parent = frame7
						createUICorner(frame8, 2)
						local textLabel = Instance.new("TextLabel")
						textLabel.Size = UDim2.new(1, -130, 1, 0)
						textLabel.Position = UDim2.fromOffset(14, 0)
						textLabel.BackgroundTransparency = 1
						textLabel.Font = gothamMedium
						textLabel.Text = text
						textLabel.TextColor3 = themeColors.White
						textLabel.TextSize = 13
						textLabel.TextXAlignment = Enum.TextXAlignment.Left
						textLabel.Parent = frame7
						local instance2 = nil
						if showShortcut then
							instance2 = Instance.new("TextButton")
							instance2.AnchorPoint = Vector2.new(1, 0.5)
							instance2.Position = UDim2.new(1, -12, 0.5, 0)
							instance2.Size = UDim2.fromOffset(16, 16)
							instance2.BackgroundTransparency = 1
							instance2.Font = gothamBold
							instance2.Text = "X"
							instance2.TextColor3 = themeColors.TextDim
							instance2.TextSize = 13
							instance2.Parent = frame7
							instance2.MouseEnter:Connect(function()
								local options12 = { TextColor3 = themeColors.White }
								TweenService:Create(instance2, TweenInfo.new(0.1), options12):Play()
							end)
							instance2.MouseLeave:Connect(function()
								local options13 = { TextColor3 = themeColors.TextDim }
								TweenService:Create(instance2, TweenInfo.new(0.1), options13):Play()
							end)
						end
						local textButton4 = Instance.new("TextButton")
						textButton4.AnchorPoint = Vector2.new(1, 0.5)
						textButton4.Position = UDim2.new(1, -34, 0.5, 0)
						textButton4.Size = UDim2.fromOffset(78, 24)
						textButton4.BackgroundColor3 = Color3.fromRGB(58, 64, 78)
						textButton4.AutoButtonColor = false
						textButton4.Font = gothamBold
						textButton4.Text = "None"
						textButton4.TextColor3 = themeColors.TextDim
						textButton4.TextSize = 12
						textButton4.Parent = frame7
						createUICorner(textButton4, 6)
						local value46 = createUIStroke(textButton4, themeColors.Stroke, 1)
						if defaultEnabled1 then
							local textButton5 = Instance.new("TextButton")
							textButton5.Name = "ShortcutButton"
							textButton5.AnchorPoint = Vector2.new(1, 0.5)
							textButton5.Position = UDim2.new(1, -118, 0.5, 0)
							textButton5.Size = UDim2.fromOffset(16, 24)
							textButton5.BackgroundTransparency = 1
							textButton5.AutoButtonColor = false
							textButton5.Text = ""
							textButton5.Parent = frame7
							local items8 = {}
							for i = 1, 3 do
								local instance3 = Instance.new("Frame")
								instance3.AnchorPoint = Vector2.new(0.5, 0.5)
								instance3.Size = UDim2.fromOffset(3, 3)
								instance3.Position = UDim2.new(0.5, 0, 0.5, (i - 2) * 6)
								instance3.BackgroundColor3 = themeColors.TextDim
								instance3.BorderSizePixel = 0
								instance3.Parent = textButton5
								createUICorner(instance3, 2)
								items8[i] = instance3
							end
							textButton5.MouseEnter:Connect(function()
								for _, value47 in ipairs(items8) do
									local options14 = { BackgroundColor3 = themeColors.LightBlue }
									TweenService:Create(value47, TweenInfo.new(0.1), options14):Play()
								end
							end)
							textButton5.MouseLeave:Connect(function()
								for _, value48 in ipairs(items8) do
									local options15 = { BackgroundColor3 = themeColors.TextDim }
									TweenService:Create(value48, TweenInfo.new(0.1), options15):Play()
								end
							end)
							task.defer(defaultEnabled1, textButton5, frame7)
						end
						local function handleAction25()
							if enabled8 then
								textButton4.Text = "..."
								textButton4.TextColor3 = themeColors.White
								value46.Color = themeColors.LightBlue
							elseif shortcutKey1 then
								textButton4.Text = shortcutKey1.Name
								textButton4.TextColor3 = themeColors.LightBlue
								value46.Color = themeColors.Stroke
							else
								textButton4.Text = "None"
								textButton4.TextColor3 = themeColors.TextDim
								value46.Color = themeColors.Stroke
							end
						end
						local handleAction26 = nil
						handleAction26 = function()
							enabled8 = false
							if value5 == handleAction26 then
								value5 = nil
							end
							handleAction25()
						end
						local function handleAction27()
							if value5 then
								value5()
							end
							value5 = handleAction26
							enabled8 = true
							handleAction25()
						end
						textButton4.MouseButton1Click:Connect(function()
							if enabled8 then
								handleAction26()
							else
								handleAction27()
							end
						end)
						if instance2 then
							instance2.MouseButton1Click:Connect(function()
								shortcutKey1 = nil
								enabled8 = false
								if value5 == handleAction26 then
									value5 = nil
								end
								handleAction25()
								handleAction6(text, nil)
								if onShortcut1 then
									task.spawn(onShortcut1, nil)
								end
							end)
						end
						userInputService.InputBegan:Connect(function(input, gameProcessed)
							if input.UserInputType ~= Enum.UserInputType.Keyboard then
								return
							end
							if enabled8 then
								shortcutKey1 = input.KeyCode
								enabled8 = false
								if value5 == handleAction26 then
									value5 = nil
								end
								handleAction25()
								handleAction6(text, shortcutKey1)
								if onShortcut1 then
									task.spawn(onShortcut1, shortcutKey1)
								end
							elseif shortcutKey1 and not gameProcessed and input.KeyCode == shortcutKey1 and onChanged1 then
								task.spawn(onChanged1)
							end
						end)
						handleAction25()
						if onShortcut1 then
							task.defer(onShortcut1, shortcutKey1)
						end
						return {
							Set = function(argument53)
								shortcutKey1 = argument53
								handleAction25()
								handleAction6(text, argument53)
								if onShortcut1 then
									task.spawn(onShortcut1, argument53)
								end
							end,
							Get = function()
								return shortcutKey1
							end,
						}
					end
					createTextButton = function(parent, text, layoutOrder, text2, backgroundColor3, argument54)
						local frame7 = Instance.new("Frame")
						frame7.Size = UDim2.new(1, 0, 0, 38)
						frame7.BackgroundColor3 = themeColors.BgDark
						frame7.BorderSizePixel = 0
						frame7.LayoutOrder = layoutOrder
						frame7.Parent = parent
						createUICorner(frame7, 8)
						createUIStroke(frame7, themeColors.Stroke, 1)
						local frame8 = Instance.new("Frame")
						frame8.Size = UDim2.new(0, 3, 0.55, 0)
						frame8.Position = UDim2.new(0, 0, 0.225, 0)
						frame8.BackgroundColor3 = themeColors.DarkBlue
						frame8.BorderSizePixel = 0
						frame8.Parent = frame7
						createUICorner(frame8, 2)
						local textLabel = Instance.new("TextLabel")
						textLabel.Size = UDim2.new(1, -110, 1, 0)
						textLabel.Position = UDim2.fromOffset(14, 0)
						textLabel.BackgroundTransparency = 1
						textLabel.Font = gothamMedium
						textLabel.Text = text
						textLabel.TextColor3 = themeColors.White
						textLabel.TextSize = 13
						textLabel.TextXAlignment = Enum.TextXAlignment.Left
						textLabel.Parent = frame7
						local textButton4 = Instance.new("TextButton")
						textButton4.AnchorPoint = Vector2.new(1, 0.5)
						textButton4.Position = UDim2.new(1, -12, 0.5, 0)
						textButton4.Size = UDim2.fromOffset(78, 24)
						textButton4.BackgroundColor3 = backgroundColor3 or themeColors.DarkBlue
						textButton4.AutoButtonColor = false
						textButton4.Font = gothamBold
						textButton4.Text = text2 or "Run"
						textButton4.TextColor3 = themeColors.White
						textButton4.TextSize = 12
						textButton4.Parent = frame7
						createUICorner(textButton4, 6)
						createUIStroke(textButton4, themeColors.LightBlue, 1).Transparency = 0.4
						textButton4.MouseButton1Click:Connect(function()
							if _G.__4HubNotify then
								_G.__4HubNotify(text, (text2 or "Run") .. " pressed")
							end
							if argument54 then
								argument54()
							end
						end)
						textButton4.MouseEnter:Connect(function()
							local value49 = TweenService
							local create = value49.Create
							local tweenInfo2 = TweenInfo.new(0.1)
							local items9 = {}
							local value50 = backgroundColor3
							local darkBlue
							if backgroundColor3 then
								darkBlue = value50
							else
								darkBlue = themeColors.DarkBlue
							end
							items9.BackgroundColor3 = darkBlue:Lerp(themeColors.White, 0.15)
							create(value49, textButton4, tweenInfo2, items9):Play()
						end)
						textButton4.MouseLeave:Connect(function()
							local value51 = TweenService
							local create = value51.Create
							local tweenInfo2 = TweenInfo.new(0.1)
							local items10 = {}
							local value52 = backgroundColor3
							local darkBlue
							if backgroundColor3 then
								darkBlue = value52
							else
								darkBlue = themeColors.DarkBlue
							end
							items10.BackgroundColor3 = darkBlue
							create(value51, textButton4, tweenInfo2, items10):Play()
						end)
						return textButton4
					end
					createTextBox = function(parent, text, layoutOrder, placeholderText, argument55, argument56)
						local frame7 = Instance.new("Frame")
						frame7.Size = UDim2.new(1, 0, 0, 38)
						frame7.BackgroundColor3 = themeColors.BgDark
						frame7.BorderSizePixel = 0
						frame7.LayoutOrder = layoutOrder
						frame7.Parent = parent
						createUICorner(frame7, 8)
						createUIStroke(frame7, themeColors.Stroke, 1)
						local frame8 = Instance.new("Frame")
						frame8.Size = UDim2.new(0, 3, 0.55, 0)
						frame8.Position = UDim2.new(0, 0, 0.225, 0)
						frame8.BackgroundColor3 = themeColors.DarkBlue
						frame8.BorderSizePixel = 0
						frame8.Parent = frame7
						createUICorner(frame8, 2)
						local textLabel = Instance.new("TextLabel")
						textLabel.Size = UDim2.new(1, -140, 1, 0)
						textLabel.Position = UDim2.fromOffset(14, 0)
						textLabel.BackgroundTransparency = 1
						textLabel.Font = gothamMedium
						textLabel.Text = text
						textLabel.TextColor3 = themeColors.White
						textLabel.TextSize = 13
						textLabel.TextXAlignment = Enum.TextXAlignment.Left
						textLabel.Parent = frame7
						local textBox = Instance.new("TextBox")
						textBox.AnchorPoint = Vector2.new(1, 0.5)
						textBox.Position = UDim2.new(1, -12, 0.5, 0)
						textBox.Size = UDim2.fromOffset(112, 24)
						textBox.BackgroundColor3 = Color3.fromRGB(54, 64, 78)
						textBox.Font = gothamMedium
						textBox.PlaceholderText = placeholderText or ""
						textBox.PlaceholderColor3 = themeColors.TextDim
						textBox.Text = ""
						textBox.TextColor3 = themeColors.White
						textBox.TextSize = 12
						textBox.ClearTextOnFocus = false
						textBox.Parent = frame7
						createUICorner(textBox, 6)
						local value53 = createUIStroke(textBox, themeColors.Stroke, 1)
						if argument55 then
							textBox:GetPropertyChangedSignal("Text"):Connect(function()
								local text2 = textBox.Text:gsub("%D", "")
								if text2 ~= textBox.Text then
									textBox.Text = text2
								end
							end)
						end
						textBox.Focused:Connect(function()
							local options16 = { Color = themeColors.LightBlue }
							TweenService:Create(value53, TweenInfo.new(0.1), options16):Play()
						end)
						textBox.FocusLost:Connect(function()
							local options17 = { Color = themeColors.Stroke }
							TweenService:Create(value53, TweenInfo.new(0.1), options17):Play()
							if argument56 then
								task.spawn(argument56, textBox.Text)
							end
						end)
						return textBox
					end
					createSlider = function(parent, slider, layoutOrder, sliderOptions, onChanged2)
						sliderOptions = sliderOptions or {}
						local min = sliderOptions.min or 0
						local max = sliderOptions.max or 100
						local text5 = "slider:" .. slider
						local default = getSavedNumber(text5) or sliderOptions.default or min
						local suffix = sliderOptions.suffix or ""
						local decimals = sliderOptions.decimals or 0
						local function handleAction28(argument57)
							local number10 = 10 ^ decimals
							return math.floor(math.clamp(argument57, min, max) * number10 + 0.5) / number10
						end
						local function handleAction29(argument58)
							if decimals > 0 then
								return string.format("%." .. decimals .. "f", argument58) .. suffix
							end
							return tostring(math.floor(argument58)) .. suffix
						end
						local value54 = handleAction28(default)
						local instance2 = Instance.new("Frame")
						instance2.Size = UDim2.new(1, 0, 0, 52)
						instance2.BackgroundColor3 = themeColors.BgDark
						instance2.BorderSizePixel = 0
						instance2.LayoutOrder = layoutOrder
						instance2.Parent = parent
						createUICorner(instance2, 8)
						createUIStroke(instance2, themeColors.Stroke, 1)
						local frame7 = Instance.new("Frame")
						frame7.Size = UDim2.new(0, 3, 0.55, 0)
						frame7.Position = UDim2.new(0, 0, 0.225, 0)
						frame7.BackgroundColor3 = themeColors.DarkBlue
						frame7.BorderSizePixel = 0
						frame7.Parent = instance2
						createUICorner(frame7, 2)
						local textLabel = Instance.new("TextLabel")
						textLabel.Size = UDim2.new(1, -80, 0, 18)
						textLabel.Position = UDim2.fromOffset(14, 8)
						textLabel.BackgroundTransparency = 1
						textLabel.Font = gothamMedium
						textLabel.Text = slider
						textLabel.TextColor3 = themeColors.White
						textLabel.TextSize = 13
						textLabel.TextXAlignment = Enum.TextXAlignment.Left
						textLabel.Parent = instance2
						local textLabel2 = Instance.new("TextLabel")
						textLabel2.AnchorPoint = Vector2.new(1, 0)
						textLabel2.Size = UDim2.new(0, 70, 0, 18)
						textLabel2.Position = UDim2.new(1, -14, 0, 8)
						textLabel2.BackgroundTransparency = 1
						textLabel2.Font = gothamBold
						textLabel2.Text = handleAction29(value54)
						textLabel2.TextColor3 = themeColors.LightBlue
						textLabel2.TextSize = 13
						textLabel2.TextXAlignment = Enum.TextXAlignment.Right
						textLabel2.Parent = instance2
						local instance3 = Instance.new("TextButton")
						instance3.Size = UDim2.new(1, -28, 0, 6)
						instance3.Position = UDim2.new(0, 14, 1, -16)
						instance3.BackgroundColor3 = themeColors.ToggleOff
						instance3.AutoButtonColor = false
						instance3.Text = ""
						instance3.Parent = instance2
						createUICorner(instance3, 3)
						local frame8 = Instance.new("Frame")
						frame8.Size = UDim2.new(0, 0, 1, 0)
						frame8.BackgroundColor3 = themeColors.LightBlue
						frame8.BorderSizePixel = 0
						frame8.Parent = instance3
						createUICorner(frame8, 3)
						local frame9 = Instance.new("Frame")
						frame9.AnchorPoint = Vector2.new(0.5, 0.5)
						frame9.Size = UDim2.fromOffset(14, 14)
						frame9.Position = UDim2.new(0, 0, 0.5, 0)
						frame9.BackgroundColor3 = themeColors.White
						frame9.BorderSizePixel = 0
						frame9.ZIndex = 3
						frame9.Parent = instance3
						createUICorner(frame9, 7)
						createUIStroke(frame9, themeColors.LightBlue, 1)
						local function handleAction30(argument59, argument60, argument61)
							value54 = handleAction28(argument59)
							local number11 = (value54 - min) / (max - min)
							textLabel2.Text = handleAction29(value54)
							if argument60 then
								TweenService:Create(frame8, TweenInfo.new(0.08), { Size = UDim2.new(number11, 0, 1, 0) }):Play()
								TweenService:Create(frame9, TweenInfo.new(0.08), { Position = UDim2.new(number11, 0, 0.5, 0) }):Play()
							else
								frame8.Size = UDim2.new(number11, 0, 1, 0)
								frame9.Position = UDim2.new(number11, 0, 0.5, 0)
							end
							if not argument61 then
								saveNumber(text5, value54)
							end
							if onChanged2 then
								task.spawn(onChanged2, value54)
							end
						end
						handleAction30(value54, false, true)
						local enabled9 = false
						local function handleAction31(argument62)
							local number12 = max - min
							handleAction30(min + math.clamp((argument62 - instance3.AbsolutePosition.X) / math.max(instance3.AbsoluteSize.X, 1), 0, 1) * number12, true)
						end
						instance3.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								enabled9 = true
								_G.__4HubSliderDragging = true
								TweenService:Create(frame9, TweenInfo.new(0.1), { Size = UDim2.fromOffset(18, 18) }):Play()
								handleAction31(input.Position.X)
							end
						end)
						userInputService.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								if enabled9 then
									enabled9 = false
									_G.__4HubSliderDragging = false
									TweenService:Create(frame9, TweenInfo.new(0.1), { Size = UDim2.fromOffset(14, 14) }):Play()
									if _G.__4HubNotify then
										_G.__4HubNotify(slider, "Set to " .. handleAction29(value54))
									end
								end
							end
						end)
						userInputService.InputChanged:Connect(function(input)
							if enabled9 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
								handleAction31(input.Position.X)
							end
						end)
						local options18 = {
							Set = function(argument63)
								handleAction30(argument63, true)
							end,
							Get = function()
								return value54
							end,
						}
						_G.__4HubSliders = _G.__4HubSliders or {}
						_G.__4HubSliders[slider] = options18
						return options18
					end
					createLabel = function(parent, text1, layoutOrder)
						local frame7 = Instance.new("Frame")
						frame7.Size = UDim2.new(1, 0, 0, text1)
						frame7.BackgroundTransparency = 1
						frame7.LayoutOrder = layoutOrder
						frame7.Parent = parent
					end
					Main = createScrollingFrame("Main", 1)
					Misc = createScrollingFrame("Misc", 2)
					service1 = createScrollingFrame("Player", 3)
					Keybinds = createScrollingFrame("Keybinds", 4)
					ap = createScrollingFrame("AP", 5)
					Settings = createScrollingFrame("Settings", 6)
					Config_ = createScrollingFrame("Config", 7)
				end
				players1 = game:GetService("Players")
				UserInputService = game:GetService("UserInputService")
				TweenService2 = game:GetService("TweenService")
				RunService2 = game:GetService("RunService")
				Workspace2 = game:GetService("Workspace")
				localPlayer6 = players1.LocalPlayer
				do
					local playerGui_ = localPlayer6:WaitForChild("PlayerGui")
					for _, child in ipairs(playerGui_:GetChildren()) do
						if child.Name == "GhostHub_UnlockBase" then
							child:Destroy()
						end
					end
				end
				local handleAction32
				frame5 = nil
				value4 = nil
				udim22 = UDim2.new(0.5, -77, 0, 230)
				tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				options = {
					Black = Color3.fromRGB(6, 8, 14),
					BgDark = Color3.fromRGB(9, 13, 24),
					BgPanel = Color3.fromRGB(13, 20, 38),
					Stroke = Color3.fromRGB(30, 46, 82),
					DarkBlue = Color3.fromRGB(18, 38, 78),
					LightBlue = Color3.fromRGB(92, 165, 255),
					BlueLine = Color3.fromRGB(60, 120, 220),
					White = Color3.fromRGB(255, 255, 255),
				}
				gotham = Enum.Font.Gotham
				do
					local items11 = { "friend", "allow", "disallow" }
					handleAction32 = function(argument64)
						local text6 = (argument64.ActionText or ""):lower()
						local value55
						local text7 = (value55.ObjectText or ""):lower()
						for _, value56 in ipairs(items11) do
							if text6:find(value56, 1, true) or text7:find(value56, 1, true) then
								return true
							end
						end
						return false
					end
				end
				do
					local function handleAction33(argument65)
						local plots = Workspace2:FindFirstChild("Plots")
						if not plots then
							return false
						end
						for _, child in ipairs(plots:GetChildren()) do
							local enabled10 = false
							if child.Name == localPlayer6.Name then
								enabled10 = true
							end
							if not enabled10 then
								local owner = child:FindFirstChild("Owner")
								if owner then
									local value = owner.Value
									if value == localPlayer6.Name or value == tostring(localPlayer6.UserId) then
										enabled10 = true
									end
								end
							end
							if not enabled10 then
								local plotSign = child:FindFirstChild("PlotSign")
								if plotSign then
									local yourBase = plotSign:FindFirstChild("YourBase")
									if yourBase and yourBase:IsA("BillboardGui") and yourBase.Enabled then
										enabled10 = true
									end
								end
							end
							if enabled10 and argument65:IsDescendantOf(child) then
								return true
							end
						end
						return false
					end
					local function handleAction34(argument66, argument67, argument68)
						for _, player_ in ipairs(players1:GetPlayers()) do
							if player_ ~= localPlayer6 then
								local character = player_.Character
								character = character and character:FindFirstChild("HumanoidRootPart")
								if character then
									if math.abs(character.Position.Y - argument67) <= argument68 and (character.Position - argument66.Position).Magnitude <= 80 then
										return true
									end
								end
							end
						end
						return false
					end
					handleAction5 = function(y1, argument69)
						local character = localPlayer6.Character
						local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
						if not humanoidRootPart then
							return
						end
						y1 = y1 or humanoidRootPart.Position.Y
						local huge = math.huge
						local huge2 = math.huge
						local plots = Workspace2:FindFirstChild("Plots")
						if not plots then
							return
						end
						local value57 = nil
						local value58 = nil
						for _, descendant in ipairs(plots:GetDescendants()) do
							if descendant:IsA("ProximityPrompt") and descendant.Enabled then
								if not handleAction33(descendant) then
									if not handleAction32(descendant) then
										local parent = descendant.Parent
										if parent and parent:IsA("BasePart") then
											if not argument69 or parent.Position.Y <= argument69 then
												local magnitude = (humanoidRootPart.Position - parent.Position).Magnitude
												if math.abs(y1 - parent.Position.Y) <= 10 then
													if handleAction34(parent, y1, 10) then
														if magnitude < huge then
															huge = magnitude
															value57 = descendant
														end
													elseif value57 == nil and magnitude < huge2 then
														huge2 = magnitude
														value58 = descendant
													end
												end
											end
										end
									end
								end
							end
						end
						local value571 = value57 or value58
						if value571 then
							local maxActivationDistance = value571.MaxActivationDistance
							local requiresLineOfSight = value571.RequiresLineOfSight
							pcall(function()
								value571.MaxActivationDistance = 999999
								value571.RequiresLineOfSight = false
							end)
							if fireproximityprompt then
								pcall(fireproximityprompt, value571)
							else
								pcall(function()
									value571:InputHoldBegin()
									task.wait(0.05)
									value571:InputHoldEnd()
								end)
							end
							task.delay(0.6, function()
								if value571 and value571.Parent then
									pcall(function()
										value571.MaxActivationDistance = maxActivationDistance
										value571.RequiresLineOfSight = requiresLineOfSight
									end)
								end
							end)
						end
					end
				end
			end
		end
		local handleAction35
		do
			local items12 = {
				{ yLevel = -2, maxY = 19 },
				[2] = { yLevel = 15 },
				[3] = { yLevel = 32 },
			}
			local options19 = { active = false }
			local function handleAction36(argument70, argument71)
				argument70.InputBegan:Connect(function(input)
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
						return
					end
					local position = input.Position
					local position2 = argument70.Position
					options19.active = true
					local connection_ = nil
					local connection_2 = UserInputService.InputChanged:Connect(function(input2)
						if input2.UserInputType == Enum.UserInputType.MouseMovement or input2.UserInputType == Enum.UserInputType.Touch then
							local number13 = input2.Position - position
							if argument70 and argument70.Parent then
								argument70.Position = UDim2.new(position2.X.Scale, position2.X.Offset + number13.X, position2.Y.Scale, position2.Y.Offset + number13.Y)
							end
						end
					end)
					connection_ = UserInputService.InputEnded:Connect(function(input2)
						if input2 == input or input2.UserInputType == Enum.UserInputType.MouseButton1 or input2.UserInputType == Enum.UserInputType.Touch then
							if connection_2 then
								connection_2:Disconnect()
							end
							if connection_ then
								connection_:Disconnect()
							end
							options19.active = false
							if argument70 and argument70.Parent and argument71 then
								argument71(argument70.Position)
							end
						end
					end)
				end)
			end
			local function handleAction37()
				if frame5 then
					return
				end
				local screenGui2 = Instance.new("ScreenGui")
				screenGui2.Name = "GhostHub_UnlockBase"
				screenGui2.ResetOnSpawn = false
				screenGui2.IgnoreGuiInset = true
				screenGui2.Parent = localPlayer6.PlayerGui
				value4 = screenGui2
				frame5 = Instance.new("Frame")
				frame5.Name = "UnlockBasePanel"
				frame5.Size = UDim2.new(0, 154, 0, 46)
				frame5.Position = udim22
				restoreWindowPosition("UnlockBasePanel", frame5)
				frame5.BackgroundColor3 = options.BgDark
				frame5.BackgroundTransparency = 0
				frame5.Active = true
				frame5.Parent = screenGui2
				local uiCorner = Instance.new("UICorner")
				uiCorner.CornerRadius = UDim.new(0, 12)
				uiCorner.Parent = frame5
				local instance2 = Instance.new("UIGradient")
				instance2.Rotation = 90
				local new = ColorSequenceKeypoint.new
				local bgDark = options.BgDark
				instance2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, options.Black), new(1, bgDark) })
				instance2.Parent = frame5
				local instance3 = Instance.new("UIStroke")
				instance3.Thickness = 2.5
				instance3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				instance3.Parent = frame5
				local uiGradient = Instance.new("UIGradient")
				local colorSequence = ColorSequence.new
				local items13 = {}
				local value59 = ColorSequenceKeypoint.new(0, options.DarkBlue)
				local value60 = ColorSequenceKeypoint.new(0.5, options.LightBlue)
				local new2 = ColorSequenceKeypoint.new
				local darkBlue = options.DarkBlue
				items13[1] = value59
				items13[2] = value60
				do
					local values = table.pack(new2(1, darkBlue))
					table.move(values, 1, values.n, 3, items13)
				end
				uiGradient.Color = colorSequence(items13)
				uiGradient.Parent = instance3
				local connection_ = nil
				connection_ = RunService2.RenderStepped:Connect(function()
					if not (frame5 and frame5.Parent) then
						connection_:Disconnect()
						return
					end
					local entry11 = 90
					uiGradient.Rotation = tick() * entry11 % 360
				end)
				local frame6 = Instance.new("Frame")
				frame6.Size = UDim2.new(1, -12, 1, -12)
				frame6.Position = UDim2.new(0, 6, 0, 6)
				frame6.BackgroundTransparency = 1
				frame6.Parent = frame5
				local uiListLayout = Instance.new("UIListLayout")
				uiListLayout.FillDirection = Enum.FillDirection.Horizontal
				uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				uiListLayout.Padding = UDim.new(0, 6)
				uiListLayout.Parent = frame6
				local function createTextButton2(text)
					local textButton2 = Instance.new("TextButton")
					textButton2.Size = UDim2.new(0, 32, 0, 32)
					textButton2.BackgroundColor3 = options.BgPanel
					textButton2.Text = text
					textButton2.Font = gotham
					textButton2.TextSize = 13
					textButton2.TextColor3 = options.White
					textButton2.AutoButtonColor = false
					textButton2.Selectable = false
					textButton2.Parent = frame6
					local instance4 = Instance.new("UICorner")
					instance4.CornerRadius = UDim.new(0, 8)
					instance4.Parent = textButton2
					local uiStroke2 = Instance.new("UIStroke")
					uiStroke2.Thickness = 1.2
					uiStroke2.Color = options.Stroke
					uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					uiStroke2.Parent = textButton2
					local frame7 = Instance.new("Frame")
					frame7.Size = UDim2.new(0, 3, 0.55, 0)
					frame7.Position = UDim2.new(0, 0, 0.225, 0)
					frame7.BackgroundColor3 = options.DarkBlue
					frame7.BorderSizePixel = 0
					frame7.Parent = textButton2
					local uiCorner2 = Instance.new("UICorner")
					uiCorner2.CornerRadius = UDim.new(0, 2)
					uiCorner2.Parent = frame7
					local number14 = 13
					local number15 = 16
					local number16 = 18
					textButton2.MouseEnter:Connect(function()
						if options19.active then
							return
						end
						TweenService2:Create(textButton2, tweenInfo, { BackgroundColor3 = options.DarkBlue, TextSize = number15 }):Play()
						TweenService2:Create(uiStroke2, tweenInfo, { Color = options.LightBlue }):Play()
						TweenService2:Create(frame7, tweenInfo, { BackgroundColor3 = options.LightBlue }):Play()
					end)
					textButton2.MouseLeave:Connect(function()
						TweenService2:Create(textButton2, tweenInfo, { BackgroundColor3 = options.BgPanel, TextSize = number14 }):Play()
						TweenService2:Create(uiStroke2, tweenInfo, { Color = options.Stroke }):Play()
						TweenService2:Create(frame7, tweenInfo, { BackgroundColor3 = options.DarkBlue }):Play()
					end)
					textButton2.MouseButton1Click:Connect(function()
						local options20 = { TextSize = number16 }
						TweenService2:Create(textButton2, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), options20):Play()
						task.delay(0.13, function()
							TweenService2:Create(textButton2, tweenInfo, { TextSize = number14 }):Play()
						end)
					end)
					return textButton2
				end
				local textControl = createTextButton2("↑")
				local value61 = createTextButton2("1")
				local value62 = createTextButton2("2")
				local value63 = createTextButton2("3")
				local enabled11 = false
				textControl.MouseButton1Click:Connect(function()
					enabled11 = not enabled11
					if enabled11 then
						textControl.Text = "→"
						uiListLayout.FillDirection = Enum.FillDirection.Vertical
						frame5.Size = UDim2.new(0, 50, 0, 154)
					else
						textControl.Text = "↑"
						uiListLayout.FillDirection = Enum.FillDirection.Horizontal
						frame5.Size = UDim2.new(0, 154, 0, 46)
					end
				end)
				value61.MouseButton1Click:Connect(function()
					handleAction5(items12[1].yLevel, items12[1].maxY)
				end)
				value62.MouseButton1Click:Connect(function()
					handleAction5(items12[2].yLevel)
				end)
				value63.MouseButton1Click:Connect(function()
					handleAction5(items12[3].yLevel)
				end)
				handleAction36(frame5, function(argument72)
					udim22 = argument72
					saveWindowPosition("UnlockPanel", frame5)
				end)
			end
			handleAction35 = function(argument73)
				if argument73 then
					handleAction37()
				else
					if value4 then
						value4:Destroy()
					end
					value4 = nil
					frame5 = nil
				end
			end
		end
		do
			local number17 = 0
			handleAction4 = function()
				number17 += 1
				return number17
			end
		end
		do
			local entry12 = "Unlock"
			local lightBlue = themeColors.LightBlue
			local darkBlue = themeColors.DarkBlue
			local blueLine = themeColors.BlueLine
			local value64 = handleAction4()
			createSection(Main, entry12, lightBlue, darkBlue, blueLine, value64)
		end
		createToggle(Main, "Auto Unlock On Steal", handleAction4(), false, function(argument74)
			_G.__4HubAutoUnlock = argument74 and true or false
		end)
		createToggle(Main, "Unlock Buttons", handleAction4(), false, function(argument75)
			handleAction35(argument75)
		end)
	end
	local handleAction38, handleAction39
	do
		do
			local Lighting, Workspace2, entry13, connection_, handleAction40, handleAction41
			do
				local lightBlue = themeColors.LightBlue
				local darkBlue = themeColors.DarkBlue
				local blueLine = themeColors.BlueLine
				local value65 = handleAction4()
				createSection(Main, "Auto Steal", lightBlue, darkBlue, blueLine, value65)
			end
			do
				local items14 = {}
				local enabled12 = false
				local items15 = {
					["Default To Nearest"] = "Nearest",
					["Default To Highest"] = "Highest",
					["Default To Priority"] = "Priority",
				}
				_G.__4HubSetGrabMode = function(4HubGrabMode)
					if 4HubGrabMode ~= "Nearest" and 4HubGrabMode ~= "Highest" and 4HubGrabMode ~= "Priority" then
						return
					end
					_G.__4HubGrabMode = 4HubGrabMode
					saveChoice("GrabMode", 4HubGrabMode)
					if _G.__4HubTC_ApplyMode then
						pcall(_G.__4HubTC_ApplyMode, 4HubGrabMode)
					end
				end
				local function handleAction42(argument76, argument77)
					local value66 = nil
					local function handleAction43(argument78)
						if argument78 and not enabled12 then
							enabled12 = true
							for _, value67 in ipairs(items14) do
								if value67 ~= value66 then
									value67.Set(false)
								end
							end
							enabled12 = false
							if _G.__4HubReady then
								local entry14 = items15[argument76]
								if entry14 then
									_G.__4HubSetGrabMode(entry14)
								end
							end
						end
					end
					value66 = createToggle
					value66 = value66(Main, argument76, handleAction4(), argument77, handleAction43)
					table.insert(items14, value66)
					return value66
				end
				handleAction42("Default To Nearest", true)
				handleAction42("Default To Highest", false)
				handleAction42("Default To Priority", false)
			end
			_G.__4HubGrabMode = getSavedChoice("GrabMode") or "Nearest"
			do
				local entry15 = 2
				local value68 = handleAction4()
				createLabel(Main, entry15, value68)
			end
			do
				local lightBlue = themeColors.LightBlue
				local darkBlue = themeColors.DarkBlue
				local blueLine = themeColors.BlueLine
				local value69 = handleAction4()
				createSection(Main, "Auto", lightBlue, darkBlue, blueLine, value69)
			end
			do
				local playerGui_, entry16, items16, handleAction44
				playerGui_ = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
				entry16 = false
				items16 = {}
				do
					local function handleAction45(argument79)
						if typeof(argument79) ~= "string" then
							return false
						end
						return string.find(string.lower(argument79), "you stole") ~= nil
					end
					local function handleAction46()
						if not entry16 then
							return
						end
						if _G.__4HubKick then
							pcall(_G.__4HubKick)
						end
					end
					handleAction44 = function(argument80)
						if not (argument80:IsA("TextLabel") or argument80:IsA("TextButton") or argument80:IsA("TextBox")) then
							return
						end
						if handleAction45(argument80.Text) then
							handleAction46()
						end
						table.insert(items16, argument80:GetPropertyChangedSignal("Text"):Connect(function()
							if handleAction45(argument80.Text) then
								handleAction46()
							end
						end))
					end
				end
				local handleAction47, handleAction48
				do
					local function handleAction49(argument81)
						for _, descendant in ipairs(argument81:GetDescendants()) do
							handleAction44(descendant)
						end
					end
					handleAction47 = function()
						for _, connection1 in ipairs(items16) do
							pcall(function()
								connection1:Disconnect()
							end)
						end
						items16 = {}
					end
					handleAction48 = function()
						if entry16 then
							return
						end
						entry16 = true
						handleAction47()
						for _, child in ipairs(playerGui_:GetChildren()) do
							handleAction49(child)
						end
						table.insert(items16, playerGui_.DescendantAdded:Connect(function(descendant)
							if entry16 then
								handleAction44(descendant)
							end
						end))
					end
				end
				do
					local function handleAction50()
						entry16 = false
						handleAction47()
					end
					_G.__4HubSetAutoKick = function(argument82)
						if argument82 then
							handleAction48()
						else
							handleAction50()
						end
					end
				end
			end
			do
				local entry17 = false
				createToggle(Main, "Auto Invis On Steal", handleAction4(), entry17, function(argument83)
					if _G.__4HubSetAutoInvis then
						_G.__4HubSetAutoInvis(argument83)
					end
				end)
			end
			_G.__4HubAutoKickMainToggle = createToggle(Main, "Auto Kick On Steal", handleAction4(), false, function(argument84)
				if _G.__4HubSetAutoKick then
					_G.__4HubSetAutoKick(argument84)
				end
			end)
			handleAction38 = nil
			do
				local entry18 = 0
				handleAction39 = function()
					entry18 += 1
					return entry18
				end
			end
			do
				local lightBlue = themeColors.LightBlue
				local darkBlue = themeColors.DarkBlue
				local blueLine = themeColors.BlueLine
				local value70 = handleAction39()
				createSection(Misc, "Misc", lightBlue, darkBlue, blueLine, value70)
			end
			Lighting = game:GetService("Lighting")
			Workspace2 = game:GetService("Workspace")
			do
				local service6 = game:GetService("Players")
				local terrain = Workspace2:FindFirstChildOfClass("Terrain")
				entry13 = 0
				connection_ = nil
				handleAction40 = function(argument85)
					local localPlayer8 = service6.LocalPlayer
					if localPlayer8.Character and argument85:IsDescendantOf(localPlayer8.Character) then
						return true
					end
					for _, player_ in ipairs(service6:GetPlayers()) do
						if player_.Character and argument85:IsDescendantOf(player_.Character) then
							return true
						end
						if player_.Name ~= "" and argument85:FindFirstAncestor(player_.Name) then
							return true
						end
					end
					local ok, result = pcall(function()
						local model = argument85:FindFirstAncestorWhichIsA("Model")
						while model do
							if model:FindFirstChildOfClass("Humanoid") then
								return true
							end
							model = model.Parent and model.Parent:FindFirstAncestorWhichIsA("Model")
						end
						return false
					end)
					if ok and result then
						return true
					end
					return false
				end
				handleAction41 = function()
					pcall(function()
						Lighting.GlobalShadows = false
						Lighting.FogEnd = 9e9
						Lighting.FogStart = 9e9
						Lighting.ShadowSoftness = 0
						Lighting.EnvironmentDiffuseScale = 0
						Lighting.EnvironmentSpecularScale = 0
					end)
					pcall(function()
						local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
						if atmosphere then
							atmosphere.Density = 0
							atmosphere.Glare = 0
							atmosphere.Haze = 0
						end
						local terrain2 = Workspace2:FindFirstChildOfClass("Terrain")
						if terrain2 then
							local clouds = terrain2:FindFirstChildOfClass("Clouds")
							if clouds then
								clouds.Enabled = false
							end
						end
					end)
					for _, child in ipairs(Lighting:GetChildren()) do
						if child:IsA("BlurEffect") or child:IsA("BloomEffect") or child:IsA("SunRaysEffect") or child:IsA("DepthOfFieldEffect") or child:IsA("ColorCorrectionEffect") then
							pcall(function()
								child.Enabled = false
							end)
						end
					end
					if terrain then
						pcall(function()
							terrain.WaterWaveSize = 0
							terrain.WaterWaveSpeed = 0
							terrain.WaterReflectance = 0
							terrain.WaterTransparency = 0
							terrain.Decoration = false
						end)
					end
					pcall(function()
						sethiddenproperty(settings().Rendering, "QualityLevel", 1)
					end)
					pcall(function()
						local level01 = Enum.QualityLevel.Level01
						settings().Rendering.QualityLevel = level01
					end)
					pcall(function()
						local qualityLevel1 = Enum.SavedQualitySetting.QualityLevel1
						UserSettings():GetService("UserGameSettings").SavedQualityLevel = qualityLevel1
					end)
					pcall(function()
						if setfpscap then
							_G.__4HubOldFpsCap = _G.__4HubOldFpsCap or getfpscap and getfpscap() or 60
							setfpscap(240)
						end
					end)
					pcall(function()
						Lighting.Technology = Enum.Technology.Compatibility
					end)
					pcall(function()
						Lighting.Brightness = 2
						Lighting.ExposureCompensation = 0
						Lighting.OutdoorAmbient = Color3.fromRGB(150, 150, 150)
					end)
					pcall(function()
						for _, descendant in ipairs(Lighting:GetDescendants()) do
							if descendant:IsA("PostEffect") then
								descendant.Enabled = false
							end
						end
						local currentCamera = Workspace2.CurrentCamera
						if currentCamera then
							for _, child in ipairs(currentCamera:GetChildren()) do
								if child:IsA("PostEffect") then
									child.Enabled = false
								end
							end
						end
					end)
					pcall(function()
						sethiddenproperty(settings().Rendering, "QualityLevel", 1)
					end)
					pcall(function()
						settings().Rendering.ExportMergeByMaterial = true
					end)
					pcall(function()
						setfpscap(240)
					end)
				end
			end
			do
				local handleAction51, handleAction52, handleAction53
				handleAction51 = function()
					pcall(function()
						if setfpscap and _G.__4HubOldFpsCap then
							setfpscap(_G.__4HubOldFpsCap)
						end
					end)
					pcall(function()
						Lighting.GlobalShadows = true
					end)
					for _, child in ipairs(Lighting:GetChildren()) do
						if child:IsA("BlurEffect") or child:IsA("BloomEffect") or child:IsA("SunRaysEffect") or child:IsA("DepthOfFieldEffect") or child:IsA("ColorCorrectionEffect") then
							pcall(function()
								child.Enabled = true
							end)
						end
					end
				end
				handleAction52 = function(argument86)
					if _G.__4HubLocalChar and argument86:IsDescendantOf(_G.__4HubLocalChar) then
						return
					end
					if argument86:FindFirstAncestor("AnimalPodiums") then
						return
					end
					if argument86:IsA("BasePart") then
						if handleAction40(argument86) then
							return
						end
						pcall(function()
							argument86.Material = Enum.Material.SmoothPlastic
							argument86.Reflectance = 0
							argument86.CastShadow = false
						end)
					elseif argument86:IsA("Decal") or argument86:IsA("Texture") then
						if handleAction40(argument86) then
							return
						end
						pcall(function()
							argument86.Transparency = 1
						end)
					elseif argument86:IsA("ParticleEmitter") or argument86:IsA("Trail") or argument86:IsA("Beam") or argument86:IsA("Smoke") or argument86:IsA("Fire") or argument86:IsA("Sparkles") then
						pcall(function()
							argument86.Enabled = false
						end)
					elseif argument86:IsA("Light") then
						if handleAction40(argument86) then
							return
						end
						pcall(function()
							argument86.Enabled = false
						end)
					elseif argument86:IsA("Decal") then
						pcall(function()
							argument86.Visible = false
						end)
					elseif argument86:IsA("SurfaceAppearance") then
						if handleAction40(argument86) then
							return
						end
						pcall(function()
							argument86:Destroy()
						end)
					elseif argument86:IsA("MeshPart") then
						if handleAction40(argument86) then
							return
						end
						pcall(function()
							argument86.Material = Enum.Material.SmoothPlastic
							argument86.Reflectance = 0
							argument86.RenderFidelity = Enum.RenderFidelity.Performance
							argument86.CastShadow = false
						end)
					elseif argument86:IsA("SpecialMesh") then
						if handleAction40(argument86) then
							return
						end
						pcall(function()
							argument86.TextureId = ""
						end)
					end
				end
				Color3.fromRGB(235, 238, 245)
				do
					local function handleAction54(argument87)
						for _, descendant in ipairs(argument87:GetDescendants()) do
							if descendant:IsA("BasePart") then
								pcall(function()
									descendant.Reflectance = 0
									descendant.CastShadow = false
								end)
							elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") or descendant:IsA("Beam") or descendant:IsA("Fire") or descendant:IsA("Smoke") or descendant:IsA("Sparkles") or descendant:IsA("Light") then
								pcall(function()
									descendant.Enabled = false
								end)
							end
						end
					end
					handleAction53 = function()
						local plots = Workspace2:FindFirstChild("Plots")
						if plots then
							for _, child in ipairs(plots:GetChildren()) do
								local animalPodiums = child:FindFirstChild("AnimalPodiums")
								if animalPodiums then
									for _, child2 in ipairs(animalPodiums:GetChildren()) do
										for _, child3 in ipairs(child2:GetChildren()) do
											if child3:IsA("Model") and child3.Name ~= "Base" and child3.Name ~= "Claim" and child3.Name ~= "Decorations" then
												handleAction54(child3)
											end
										end
									end
								end
							end
						end
						local renderedMovingAnimals = Workspace2:FindFirstChild("RenderedMovingAnimals")
						if renderedMovingAnimals then
							for _, child in ipairs(renderedMovingAnimals:GetChildren()) do
								if child:IsA("Model") then
									handleAction54(child)
								end
							end
						end
					end
				end
				local function 4HubSetFpsBoost(argument88)
					entry13 += 1
					_G.__4HubBoostActive = argument88 and true or false
					if connection_ then
						connection_:Disconnect()
						connection_ = nil
					end
					if not argument88 then
						handleAction51()
						return
					end
					local entry131 = entry13
					handleAction41()
					for _, descendant in ipairs(Workspace2:GetDescendants()) do
						handleAction52(descendant)
					end
					pcall(handleAction53)
					connection_ = Workspace2.DescendantAdded:Connect(function(descendant)
						if entry131 ~= entry13 then
							if connection_ then
								connection_:Disconnect()
							end
							return
						end
						task.defer(handleAction52, descendant)
					end)
					task.spawn(function()
						for i = 1, 12 do
							if entry131 ~= entry13 then
								return
							end
							handleAction41()
							pcall(handleAction53)
							task.wait(1.5)
						end
					end)
				end
				_G.__4HubSetFpsBoost = 4HubSetFpsBoost
				createToggle(Misc, "FPS Boost", handleAction39(), false, function(argument89)
					4HubSetFpsBoost(argument89)
				end)
			end
			do
				local service7, touchEnabled
				do
					local service8 = game:GetService("UserInputService")
					service7 = game:GetService("Lighting")
					game:GetService("Workspace")
					touchEnabled = service8.TouchEnabled and not service8.KeyboardEnabled and not service8.MouseEnabled
				end
				do
					local function 4HubCrazyOptimize(argument90)
						if _G.__4HubSetFpsBoost then
							pcall(function()
								_G.__4HubSetFpsBoost(argument90)
							end)
						end
						if not argument90 then
							return
						end
						pcall(function()
							local level01 = Enum.QualityLevel.Level01
							settings().Rendering.QualityLevel = level01
						end)
						pcall(function()
							local entry19 = "QualityLevel"
							local entry20 = 1
							sethiddenproperty(settings().Rendering, entry19, entry20)
						end)
						pcall(function()
							local qualityLevel1 = Enum.SavedQualitySetting.QualityLevel1
							UserSettings():GetService("UserGameSettings").SavedQualityLevel = qualityLevel1
						end)
						pcall(function()
							if setfpscap then
								setfpscap(touchEnabled and 60 or 120)
							end
						end)
						pcall(function()
							service7.GlobalShadows = false
							service7.Technology = Enum.Technology.Compatibility
						end)
						pcall(function()
							for _, descendant in ipairs(service7:GetDescendants()) do
								if descendant:IsA("PostEffect") then
									descendant.Enabled = false
								end
							end
						end)
					end
					_G.__4HubCrazyOptimize = 4HubCrazyOptimize
					_G.__4HubCrazyOptToggle = createToggle(Misc, "Crazy Optimize (max FPS)", handleAction39(), false, function(argument91)
						4HubCrazyOptimize(argument91)
					end)
				end
			end
			do
				local entry21, enabled13
				entry21 = 70
				enabled13 = false
				do
					local function handleAction55()
						if _G.__4HubDead then
							return
						end
						if not enabled13 then
							return
						end
						local currentCamera = Workspace.CurrentCamera
						if currentCamera then
							pcall(function()
								currentCamera.FieldOfView = entry21
							end)
						end
					end
					RunService.RenderStepped:Connect(handleAction55)
					RunService.Heartbeat:Connect(handleAction55)
					pcall(function()
						RunService:BindToRenderStep("RiftFOVLock", Enum.RenderPriority.Camera.Value + 1, handleAction55)
					end)
				end
				local options21 = {
					min = 40,
					max = 120,
					default = 70,
					suffix = "",
				}
				createSlider(Misc, "FOV Changer", handleAction39(), options21, function(fieldOfView)
					entry21 = fieldOfView
					enabled13 = fieldOfView ~= 70
					local currentCamera = Workspace.CurrentCamera
					if currentCamera then
						currentCamera.FieldOfView = fieldOfView
					end
				end)
			end
		end
		local setXRay, handleAction56
		do
			local enabled14, number18
			do
				local Workspace2, obj, items17, entry22, handleAction57
				enabled14 = false
				number18 = 0.5
				Workspace2 = game:GetService("Workspace")
				do
					local items18 = {
						"Base",
						"PlotSign",
						"FriendPanel",
						"Cash",
						"Laser",
						"Decorations",
						"Skin",
						"Unlock",
						"Purchases",
					}
					obj = setmetatable({}, { __mode = "k" })
					items17 = {}
					entry22 = 0
					local function handleAction58(argument92, argument93, argument94)
						if not argument92 then
							return
						end
						if argument94 and argument94 ~= entry22 then
							return
						end
						local function handleAction59(argument95)
							if argument95:IsA("BasePart") then
								if obj[argument95] == nil then
									if argument95.Transparency == argument93 then
										obj[argument95] = 0
									else
										obj[argument95] = argument95.Transparency
									end
								end
								local entry23 = obj[argument95]
								if entry23 < 1 then
									local transparency = entry23 + (1 - entry23) * argument93
									if 0.001 < math.abs(argument95.Transparency - transparency) then
										argument95.Transparency = transparency
									end
								end
							end
						end
						handleAction59(argument92)
						local descendants = argument92:GetDescendants()
						for i, descendant in ipairs(descendants) do
							handleAction59(descendant)
							if i % 300 == 0 then
								task.wait()
								if argument94 and argument94 ~= entry22 then
									return
								end
							end
						end
					end
					local function handleAction60(argument96, argument97, argument98)
						if not argument96 then
							return
						end
						if argument98 ~= entry22 then
							return
						end
						handleAction58(argument96, argument97, argument98)
						if argument98 ~= entry22 then
							return
						end
						items17[#items17 + 1] = argument96.DescendantAdded:Connect(function(descendant)
							if argument98 ~= entry22 then
								return
							end
							handleAction58(descendant, argument97, argument98)
						end)
					end
					handleAction57 = function(argument99, argument100, argument101)
						if not argument99 then
							return
						end
						if argument101 ~= entry22 then
							return
						end
						for _, value71 in ipairs(items18) do
							if argument101 ~= entry22 then
								return
							end
							handleAction60(argument99:FindFirstChild(value71), argument100, argument101)
						end
						if argument101 ~= entry22 then
							return
						end
						items17[#items17 + 1] = argument99.ChildAdded:Connect(function(child)
							if argument101 ~= entry22 then
								return
							end
							for _, value72 in ipairs(items18) do
								if child.Name == value72 then
									handleAction60(child, argument100, argument101)
									break
								end
							end
						end)
						local animalPodiums = argument99:FindFirstChild("AnimalPodiums")
						if animalPodiums then
							local function handleAction61(argument102)
								for _, child in ipairs(argument102:GetChildren()) do
									if child.Name == "Claim" then
										handleAction60(child, argument100, argument101)
									elseif child.Name == "Base" then
										handleAction60(child:FindFirstChild("Spawn"), argument100, argument101)
									elseif child:IsA("Model") and child.Name ~= "Spawn" then
										handleAction60(child, argument100, argument101)
									end
								end
							end
							for _, child in ipairs(animalPodiums:GetChildren()) do
								handleAction61(child)
							end
							items17[#items17 + 1] = animalPodiums.ChildAdded:Connect(function(child)
								if argument101 ~= entry22 then
									return
								end
								task.wait(0.1)
								if argument101 ~= entry22 then
									return
								end
								handleAction61(child)
							end)
						end
					end
				end
				do
					local function handleAction62(argument103, argument104)
						local plots = Workspace2:FindFirstChild("Plots")
						if not plots then
							return
						end
						for _, child in ipairs(plots:GetChildren()) do
							if argument104 ~= entry22 then
								return
							end
							handleAction57(child, argument103, argument104)
							task.wait()
						end
						items17[#items17 + 1] = plots.ChildAdded:Connect(function(child)
							if argument104 ~= entry22 then
								return
							end
							task.wait(0.2)
							handleAction57(child, argument103, argument104)
						end)
					end
					local function handleAction63(argument105)
						for k, value73 in pairs(argument105) do
							pcall(function()
								if k:IsA("BasePart") then
									k.Transparency = value73
								end
							end)
						end
					end
					setXRay = function(argument106)
						enabled14 = argument106
						entry22 += 1
						for _, connection2 in ipairs(items17) do
							pcall(function()
								connection2:Disconnect()
							end)
						end
						items17 = {}
						if argument106 then
							local entry221 = entry22
							local number181 = number18
							task.spawn(function()
								while entry221 == entry22 and not Workspace2:FindFirstChild("Plots") do
									task.wait(0.5)
								end
								if entry221 ~= entry22 then
									return
								end
								pcall(handleAction62, number181, entry221)
							end)
						else
							local value74 = obj
							obj = setmetatable({}, { __mode = "k" })
							handleAction63(value74)
							task.spawn(function()
								for i = 1, 3 do
									task.wait()
									handleAction63(value74)
								end
							end)
						end
					end
				end
			end
			_G.setXRay = setXRay
			handleAction56 = function(argument107)
				number18 = argument107
				if enabled14 then
					setXRay(true)
				end
			end
			frame4 = Instance.new("Frame")
			frame4.Name = "XRayPopup"
			frame4.AnchorPoint = Vector2.new(0.5, 0.5)
			frame4.Position = UDim2.new(0.5, 0, 0.5, 0)
			frame4.Size = UDim2.fromOffset(224, 94)
			frame4.BackgroundColor3 = themeColors.BgPanel
			frame4.BorderSizePixel = 0
			frame4.Visible = false
			frame4.ZIndex = 1
			frame4.Parent = frame
			frame4.ClipsDescendants = true
			frame4.Active = true
			createUICorner(frame4, 10)
			createUIStroke(frame4, themeColors.LightBlue, 1)
			do
				local textLabel = Instance.new("TextLabel")
				textLabel.BackgroundTransparency = 1
				textLabel.Position = UDim2.fromOffset(12, 8)
				textLabel.Size = UDim2.new(1, -44, 0, 18)
				textLabel.Font = gothamBold
				textLabel.Text = "X-Ray Amount"
				textLabel.TextColor3 = themeColors.White
				textLabel.TextSize = 13
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.ZIndex = 61
				textLabel.Parent = frame4
			end
		end
		local textButton2, handleAction64
		textButton2 = Instance.new("TextButton")
		textButton2.AnchorPoint = Vector2.new(1, 0)
		textButton2.Position = UDim2.new(1, -8, 0, 6)
		textButton2.Size = UDim2.fromOffset(20, 20)
		textButton2.BackgroundTransparency = 1
		textButton2.Font = gothamBold
		textButton2.Text = "X"
		textButton2.TextColor3 = themeColors.TextDim
		textButton2.TextSize = 14
		textButton2.ZIndex = 61
		textButton2.Parent = frame4
		handleAction64 = function()
			TweenService:Create(frame4, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.fromOffset(0, 0) }):Play()
			task.delay(0.14, function()
				frame4.Visible = false
			end)
		end
		textButton2.MouseButton1Click:Connect(handleAction64)
		textButton2.MouseEnter:Connect(function()
			textButton2.TextColor3 = themeColors.White
		end)
		textButton2.MouseLeave:Connect(function()
			textButton2.TextColor3 = themeColors.TextDim
		end)
		do
			local frame5 = Instance.new("Frame")
			frame5.BackgroundTransparency = 1
			frame5.Position = UDim2.fromOffset(8, 32)
			frame5.Size = UDim2.new(1, -16, 0, 52)
			frame5.ZIndex = 61
			frame5.Parent = frame4
			createSlider(frame5, "Amount", 1, { min = 0.01, max = 1, default = 0.5, decimals = 2 }, function(argument108)
				handleAction56(argument108)
			end)
		end
		enabled2 = false
		do
			local function handleAction65()
				enabled2 = not enabled2
				if enabled2 then
					frame4.Visible = true
					frame4.Size = UDim2.fromOffset(0, 0)
					TweenService:Create(frame4, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(224, 96) }):Play()
				else
					handleAction64()
				end
			end
			textButton2.MouseButton1Click:Connect(function()
				enabled2 = false
			end)
			createToggle(Misc, "X-Ray", handleAction39(), false, function(argument109)
				setXRay(argument109)
			end, false, handleAction65)
		end
	end
	do
		local entry24 = false
		createToggle(Misc, "Line To Base", handleAction39(), entry24, function(argument110)
			handleAction38(argument110)
		end)
	end
	createToggle(Misc, "Line To Best Brainrot", handleAction39(), false, function(argument111)
		if _G.__4HubSetBrainrotLine then
			_G.__4HubSetBrainrotLine(argument111)
		end
	end)
	createToggle(Misc, "Anti Player Collision", handleAction39(), false, function(argument112)
		if _G.__4HubSetAntiCollision then
			_G.__4HubSetAntiCollision(argument112)
		end
	end)
	do
		local players2 = game:GetService("Players")
		local RunService2 = game:GetService("RunService")
		local localPlayer9 = players2.LocalPlayer
		local enabled15 = false
		local connection_ = nil
		local function handleAction66(argument113)
			if not argument113 then
				return
			end
			for _, child in ipairs(argument113:GetChildren()) do
				if child:IsA("BasePart") and child.CanCollide then
					pcall(function()
						child.CanCollide = false
					end)
				end
			end
		end
		_G.__4HubSetAntiCollision = function(argument114)
			local argument1141 = argument114 and true or false
			if argument1141 == enabled15 then
				return
			end
			enabled15 = argument1141
			if enabled15 then
				if connection_ then
					connection_:Disconnect()
				end
				local number19 = 0
				connection_ = RunService2.Heartbeat:Connect(function(deltaTime)
					if _G.__4HubDead or not enabled15 then
						return
					end
					number19 += deltaTime or 0
					if number19 < 0.2 then
						return
					end
					number19 = 0
					for _, player_ in ipairs(players2:GetPlayers()) do
						if player_ ~= localPlayer9 and player_.Character then
							handleAction66(player_.Character)
						end
					end
				end)
				_G.__4HubOnLeave(function()
					if connection_ then
						pcall(function()
							connection_:Disconnect()
						end)
					end
				end)
			elseif connection_ then
				connection_:Disconnect()
				connection_ = nil
			end
		end
	end
	do
		local value75 = handleAction39()
		createLabel(Misc, 2, value75)
	end
	do
		local lightBlue = themeColors.LightBlue
		local darkBlue = themeColors.DarkBlue
		local blueLine = themeColors.BlueLine
		local value76 = handleAction39()
		createSection(Misc, "Hide GUIs", lightBlue, darkBlue, blueLine, value76)
	end
	do
		local entry25 = false
		createToggle(Misc, "Hide Admin Panel GUI", handleAction39(), entry25, function(4HubAdminHidden)
			_G.__4HubAdminHidden = 4HubAdminHidden
			if _G.setAdminPanelHidden then
				_G.setAdminPanelHidden(4HubAdminHidden)
			end
		end)
	end
	createToggle(Misc, "Hide Target Control GUI", handleAction39(), false, function(argument115)
		if _G.setTargetControlsHidden then
			_G.setTargetControlsHidden(argument115)
		end
	end)
	createToggle(Misc, "Hide Invis Steal GUI", handleAction39(), false, function(argument116)
		if _G.setInvisStealHidden then
			_G.setInvisStealHidden(argument116)
		end
	end)
	do
		local entry26 = false
		createToggle(Misc, "Hide Steal Target GUI", handleAction39(), entry26, function(argument117)
			if _G.setStealTargetHidden then
				_G.setStealTargetHidden(argument117)
			end
		end)
	end
	do
		local entry27 = false
		createToggle(Misc, "Hide Auto Grab GUI", handleAction39(), entry27, function(argument118)
			if _G.setAutoGrabHidden then
				_G.setAutoGrabHidden(argument118)
			end
		end)
	end
	createToggle(Misc, "Hide Command Cooldowns", handleAction39(), false, function(argument119)
		if _G.setCmdCooldownHidden then
			_G.setCmdCooldownHidden(argument119)
		end
	end)
	do
		local entry28 = false
		createToggle(Misc, "Hide Grief Detector", handleAction39(), entry28, function(argument120)
			if _G.setGriefHidden then
				_G.setGriefHidden(argument120)
			end
		end)
	end
	do
		local RunService2, localPlayer10
		createToggle(Misc, "Hide Actions Panel", handleAction39(), false, function(argument121)
			if _G.setActionsPanelHidden then
				_G.setActionsPanelHidden(argument121)
			end
		end)
		do
			local value77 = handleAction39()
			createLabel(Misc, 2, value77)
		end
		do
			local lightBlue = themeColors.LightBlue
			local darkBlue = themeColors.DarkBlue
			local blueLine = themeColors.BlueLine
			local value78 = handleAction39()
			createSection(Misc, "Mobile Helpers", lightBlue, darkBlue, blueLine, value78)
		end
		createToggle(Misc, "Custom Panel", handleAction39(), false, function(argument122)
			if _G.__4HubShowCustomPanel then
				_G.__4HubShowCustomPanel(argument122)
			end
		end)
		handleAction = function(parent, text, layoutOrder, backgroundColor3, argument123)
			local instance2 = Instance.new("TextButton")
			instance2.Size = UDim2.new(1, 0, 0, 46)
			instance2.BackgroundColor3 = backgroundColor3
			instance2.AutoButtonColor = false
			instance2.Font = gothamBold
			instance2.Text = text
			instance2.TextColor3 = themeColors.White
			instance2.TextSize = 18
			instance2.LayoutOrder = layoutOrder
			instance2.Parent = parent
			createUICorner(instance2, 10)
			createUIStroke(instance2, themeColors.White, 1).Transparency = 0.65
			instance2.MouseButton1Click:Connect(function()
				if _G.__4HubNotify then
					_G.__4HubNotify(tostring(instance2.Text):gsub("^%s+", ""), "Activated")
				end
				if argument123 then
					argument123()
				end
			end)
			return instance2
		end
		do
			local players3 = game:GetService("Players")
			RunService2 = game:GetService("RunService")
			localPlayer10 = players3.LocalPlayer
		end
		do
			local enabled16 = false
			local connection_ = nil
			local function handleAction67(argument124)
				local humanoid = argument124:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart = argument124:FindFirstChild("HumanoidRootPart")
				if not humanoid or not humanoidRootPart or humanoid.Health <= 0 then
					return
				end
				pcall(function()
					humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
					humanoid:ChangeState(Enum.HumanoidStateType.Running)
					humanoidRootPart.Velocity = Vector3.zero
					humanoidRootPart.RotVelocity = Vector3.zero
					humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
					humanoid.PlatformStand = false
					humanoid.Sit = false
					humanoid.AutoRotate = true
					humanoid.JumpPower = humanoid.JumpPower > 0 and humanoid.JumpPower or 50
					humanoid.WalkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
					for _, descendant in ipairs(argument124:GetDescendants()) do
						if descendant:IsA("Motor6D") then
							descendant.Enabled = true
						elseif descendant:IsA("Constraint") or descendant:IsA("BallSocketConstraint") or descendant:IsA("HingeConstraint") then
							descendant.Enabled = true
						elseif descendant:IsA("BasePart") then
							descendant.CanCollide = true
							descendant.AssemblyLinearVelocity = Vector3.zero
							descendant.AssemblyAngularVelocity = Vector3.zero
						end
					end
					workspace.CurrentCamera.CameraSubject = humanoid
					local playerModule = localPlayer10.PlayerScripts:FindFirstChild("PlayerModule")
					if playerModule then
						local value79 = playerModule:FindFirstChild("ControlModule")
						if value79 then
							local ok, result = pcall(require, value79)
							if ok and result and result.Enable then
								result:Enable()
							end
						end
					end
				end)
			end
			local function handleAction68()
				if connection_ then
					return
				end
				connection_ = RunService2.Heartbeat:Connect(function()
					if not enabled16 then
						return
					end
					if _G._FH_LAUNCHING then
						return
					end
					local character = localPlayer10.Character
					if not character then
						return
					end
					local value80 = character:FindFirstChildOfClass("Humanoid")
					if not value80 then
						return
					end
					local state = value80:GetState()
					if state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown or state == Enum.HumanoidStateType.Dead or value80.PlatformStand == true or value80.Sit == true then
						handleAction67(character)
					end
				end)
			end
			localPlayer10.CharacterAdded:Connect(function()
				task.wait(0.5)
				handleAction68()
			end)
			handleAction1 = function(argument125)
				enabled16 = argument125
				if argument125 then
					handleAction68()
				end
			end
		end
	end
	do
		local localPlayer11 = game:GetService("Players").LocalPlayer
		local enabled17 = false
		local items19 = {}
		local function handleAction69(argument126)
			if not argument126 then
				return
			end
			local animate = argument126:FindFirstChild("Animate")
			if animate then
				animate.Disabled = true
			end
			local value81 = argument126:FindFirstChildOfClass("Humanoid")
			if not value81 then
				return
			end
			local animator = value81:FindFirstChildOfClass("Animator")
			if not animator then
				return
			end
			for _, value82 in ipairs(animator:GetPlayingAnimationTracks()) do
				value82:Stop(0)
			end
			table.insert(items19, animator.AnimationPlayed:Connect(function(argument127)
				if enabled17 then
					argument127:Stop(0)
				end
			end))
		end
		local function handleAction70(argument128)
			local character = argument128 or localPlayer11.Character
			if not character then
				return
			end
			local value83 = character:FindFirstChild("Animate")
			if value83 then
				value83.Disabled = false
			end
		end
		handleAction2 = function(argument129)
			enabled17 = argument129
			if argument129 then
				if localPlayer11.Character then
					handleAction69(localPlayer11.Character)
				end
				table.insert(items19, localPlayer11.CharacterAdded:Connect(function(character)
					character:WaitForChild("Humanoid", 5)
					task.wait(0.1)
					if enabled17 then
						handleAction69(character)
					end
				end))
			else
				for _, connection3 in ipairs(items19) do
					if typeof(connection3) == "RBXScriptConnection" then
						connection3:Disconnect()
					end
				end
				items19 = {}
				handleAction70()
			end
		end
	end
	do
		local service9, enabled18, attachment, beam, connection_, handleAction71, handleAction72
		do
			local Workspace2, localPlayer12
			do
				local players4 = game:GetService("Players")
				service9 = game:GetService("RunService")
				Workspace2 = game:GetService("Workspace")
				localPlayer12 = players4.LocalPlayer
			end
			enabled18 = false
			do
				local attachment2 = nil
				attachment = nil
				beam = nil
				connection_ = nil
				handleAction71 = function()
					local plots = Workspace2:FindFirstChild("Plots")
					if not plots then
						return nil
					end
					for _, child in ipairs(plots:GetChildren()) do
						if child:IsA("Model") then
							local plotSign = child:FindFirstChild("PlotSign")
							plotSign = plotSign and plotSign:FindFirstChild("YourBase")
							if plotSign and plotSign:IsA("BillboardGui") and plotSign.Enabled == true then
								local value84 = child:FindFirstChild("Spawn")
								if value84 and value84:IsA("BasePart") then
									return value84
								end
								if child.PrimaryPart then
									return child.PrimaryPart
								end
							end
						end
					end
					return nil
				end
				handleAction72 = function()
					local character = localPlayer12.Character
					character = character and character:FindFirstChild("HumanoidRootPart")
					if not character then
						return
					end
					if not attachment2 or attachment2.Parent ~= character then
						if attachment2 then
							attachment2:Destroy()
						end
						attachment2 = Instance.new("Attachment")
						attachment2.Name = "LineToBase_A0"
						attachment2.Parent = character
					end
					if not beam then
						beam = Instance.new("Beam")
						beam.Name = "LineToBase_Beam"
						if _G.__4HubEspBind then
							_G.__4HubEspBind(beam, "Color", Color3.fromRGB(120, 200, 255), "seq")
						else
							beam.Color = ColorSequence.new(Color3.fromRGB(120, 200, 255))
						end
						beam.Width0 = 0.32
						beam.Width1 = 0.32
						beam.FaceCamera = true
						beam.Transparency = NumberSequence.new(0)
						beam.Attachment0 = attachment2
						beam.Parent = character
					end
				end
			end
		end
		do
			local function handleAction73()
				if beam then
					beam.Enabled = false
				end
			end
			local function handleAction74()
				if not enabled18 then
					handleAction73()
					return
				end
				handleAction72()
				local value85 = handleAction71()
				if not value85 then
					if beam then
						beam.Enabled = false
					end
					return
				end
				if not attachment or attachment.Parent ~= value85 then
					if attachment then
						attachment:Destroy()
					end
					attachment = Instance.new("Attachment")
					attachment.Name = "LineToBase_A1"
					attachment.Parent = value85
				end
				if beam then
					beam.Attachment1 = attachment
					beam.Enabled = true
				end
			end
			handleAction38 = function(argument130)
				enabled18 = argument130
				if argument130 then
					if not connection_ then
						connection_ = service9.Heartbeat:Connect(function()
							if enabled18 then
								handleAction74()
							else
								handleAction73()
							end
						end)
					end
				else
					if connection_ then
						connection_:Disconnect()
						connection_ = nil
					end
					handleAction73()
				end
			end
		end
	end
	_G.__4HubEspGuiHolder = function()
		local 4HubEspGui = _G.__4HubEspGui
		if 4HubEspGui and 4HubEspGui.Parent then
			return 4HubEspGui
		end
		local hui = nil
		if not pcall(function()
			hui = gethui()
		end) or not hui then
			hui = game:GetService("CoreGui")
		end
		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "\5"
		screenGui2.ResetOnSpawn = false
		screenGui2.DisplayOrder = -1
		screenGui2.IgnoreGuiInset = true
		screenGui2.Parent = hui
		_G.__4HubEspGui = screenGui2
		return screenGui2
	end
	_G.__4HubEspWorldHolder = function()
		local currentCamera = workspace.CurrentCamera
		local 4HubEspWorld = _G.__4HubEspWorld
		if 4HubEspWorld and 4HubEspWorld.Parent and 4HubEspWorld.Parent == currentCamera then
			return 4HubEspWorld
		end
		if 4HubEspWorld then
			pcall(function()
				4HubEspWorld:Destroy()
			end)
		end
		local instance2 = Instance.new("Folder")
		instance2.Name = "\5"
		instance2.Parent = currentCamera
		_G.__4HubEspWorld = instance2
		return instance2
	end
	do
		local function handleAction75()
			pcall(function()
				localPlayer1.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
			end)
		end
		handleAction75()
		localPlayer1.CharacterAdded:Connect(function()
			task.wait(0.2)
			handleAction75()
		end)
		task.spawn(function()
			while not _G.__4HubDead do
				task.wait(2)
				if localPlayer1.DevCameraOcclusionMode ~= Enum.DevCameraOcclusionMode.Invisicam then
					handleAction75()
				end
			end
		end)
	end
	do
		local options22 = { papichulo4kk = true, discoduro28 = true, zahjj77 = true }
		local items20 = {}
		local function handleAction76(argument131)
			local entry29 = items20[argument131]
			if entry29 then
				pcall(function()
					entry29:Destroy()
				end)
				items20[argument131] = nil
			end
			local character = argument131.Character
			if character then
				character = character:FindFirstChild("Head") or character:FindFirstChildWhichIsA("BasePart")
			end
			if not character then
				return
			end
			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Name = "\5"
			billboardGui.Adornee = character
			billboardGui.Size = UDim2.fromOffset(200, 40)
			billboardGui.StudsOffset = Vector3.new(0, 3, 0)
			billboardGui.AlwaysOnTop = true
			billboardGui.MaxDistance = 1e9
			billboardGui.Parent = _G.__4HubEspGuiHolder()
			local instance2 = Instance.new("TextLabel")
			instance2.BackgroundTransparency = 1
			instance2.Size = UDim2.fromScale(1, 1)
			instance2.Font = Enum.Font.GothamBlack
			instance2.Text = "4Hub STAFF"
			instance2.TextSize = 22
			instance2.TextColor3 = Color3.fromRGB(255, 210, 45)
			instance2.TextStrokeTransparency = 0.25
			instance2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
			instance2.Parent = billboardGui
			items20[argument131] = billboardGui
		end
		local function handleAction77(player_)
			if player_ == localPlayer1 then
				return
			end
			if not options22[player_.Name:lower()] then
				return
			end
			task.spawn(function()
				task.wait(0.3)
				handleAction76(player_)
			end)
			player_.CharacterAdded:Connect(function()
				task.wait(0.5)
				handleAction76(player_)
			end)
		end
		for _, player_ in ipairs(players:GetPlayers()) do
			handleAction77(player_)
		end
		players.PlayerAdded:Connect(handleAction77)
		players.PlayerRemoving:Connect(function(player_)
			if items20[player_] then
				pcall(function()
					items20[player_]:Destroy()
				end)
				items20[player_] = nil
			end
		end)
	end
end
do
	local RunService2, options23, gothamBold2, gothamBlack, handleAction78, items21
	handleAction3 = nil
	RunService2 = game:GetService("RunService")
	options23 = {
		Black = Color3.fromRGB(6, 8, 14),
		BgDark = Color3.fromRGB(9, 13, 24),
		DarkBlue = Color3.fromRGB(18, 38, 78),
		LightBlue = Color3.fromRGB(92, 165, 255),
		White = Color3.fromRGB(255, 255, 255),
	}
	gothamBold2 = Enum.Font.GothamBold
	gothamBlack = Enum.Font.GothamBlack
	handleAction78 = function(parent, argument132)
		local instance2 = Instance.new("UICorner")
		instance2.CornerRadius = UDim.new(0, argument132 or 8)
		instance2.Parent = parent
		return instance2
	end
	items21 = {}
	do
		local vector = Vector3.new(-342.439, 10.399, 113.107)
		local vector2 = Vector3.new(-342.439, 10.465, 6.107)
		local vector3 = Vector3.new(-476.752, 10.465, 114.107)
		local vector4 = Vector3.new(-476.752, 10.465, 7.107)
		local vector5 = Vector3.new(-342.44, 10.464, 220.107)
		local vector6 = Vector3.new(-476.752, 10.465, 221.107)
		local vector7 = Vector3.new(-342.439, 10.465, -100.893)
		local vector8 = Vector3.new
		items21[1] = vector
		items21[2] = vector2
		items21[3] = vector3
		items21[4] = vector4
		items21[5] = vector5
		items21[6] = vector6
		items21[7] = vector7
		do
			local values = table.pack(vector8(-476.752, 10.465, -99.893))
			table.move(values, 1, values.n, 8, items21)
		end
	end
	do
		local value86 = utf8.char(9733)
		local handleAction79 = nil
		handleAction79 = function()
			if _G.__NextBaseCleanup then
				pcall(_G.__NextBaseCleanup)
			end
			local plots = workspace:FindFirstChild("Plots")
			if not plots then
				task.spawn(function()
					plots = workspace:WaitForChild("Plots", 30)
					if plots and handleAction3 and _G.__NextBaseWanted then
						handleAction79()
					end
				end)
				return
			end
			local function handleAction80(argument133)
				local ok, result = pcall(function()
					return (argument133:GetBoundingBox())
				end)
				if not ok then
					return nil
				end
				local position = result.Position
				local value87 = nil
				local value88 = nil
				for i, value89 in ipairs(items21) do
					local number20 = position.X - value89.X
					local number21 = position.Z - value89.Z
					local value90 = math.sqrt(number20 * number20 + number21 * number21)
					if not value87 or value90 < value87 then
						value87 = value90
						value88 = i
					end
				end
				return value87 and value87 <= 6 and value88 or nil
			end
			local items22 = {}
			local items23 = {}
			local items24 = {}
			local part = Instance.new("Part")
			part.Name = "__NextBaseAnchor"
			local entry30 = false
			local entry31 = false
			part.Anchored = true
			part.CanCollide = entry30
			part.CanQuery = false
			part.CanTouch = entry31
			part.Transparency = 1
			part.Size = Vector3.new(1, 1, 1)
			part.Parent = _G.__4HubEspWorldHolder()
			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Name = "\5"
			billboardGui.Adornee = part
			billboardGui.Size = UDim2.fromScale(34, 15)
			billboardGui.StudsOffset = Vector3.new(0, 10, 0)
			billboardGui.MaxDistance = math.huge
			billboardGui.AlwaysOnTop = true
			billboardGui.LightInfluence = 0
			billboardGui.Enabled = false
			billboardGui.Parent = _G.__4HubEspGuiHolder()
			local frame5 = Instance.new("Frame", billboardGui)
			frame5.Size = UDim2.fromScale(1, 1)
			frame5.BackgroundColor3 = options23.BgDark
			frame5.BackgroundTransparency = 0.15
			frame5.BorderSizePixel = 0
			handleAction78(frame5, 14)
			local uiGradient = Instance.new("UIGradient", frame5)
			uiGradient.Rotation = 90
			local new = ColorSequenceKeypoint.new
			local bgDark = options23.BgDark
			uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, options23.Black), new(1, bgDark) })
			local instance2 = Instance.new("UIStroke", frame5)
			instance2.Thickness = 5
			instance2.Transparency = 0.55
			instance2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			local uiStroke2 = Instance.new("UIStroke", frame5)
			uiStroke2.Thickness = 1.5
			uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			local colorSequence = ColorSequence.new
			local items25 = {}
			local value91 = ColorSequenceKeypoint.new(0, options23.DarkBlue)
			local value92 = ColorSequenceKeypoint.new(0.25, options23.LightBlue)
			local value93 = ColorSequenceKeypoint.new(0.3, Color3.fromRGB(190, 225, 255))
			local value94 = ColorSequenceKeypoint.new(0.35, options23.LightBlue)
			local value95 = ColorSequenceKeypoint.new(0.5, options23.DarkBlue)
			local value96 = ColorSequenceKeypoint.new(0.75, options23.LightBlue)
			local value97 = ColorSequenceKeypoint.new(0.8, Color3.fromRGB(190, 225, 255))
			local value98 = ColorSequenceKeypoint.new(0.85, options23.LightBlue)
			local new2 = ColorSequenceKeypoint.new
			local darkBlue = options23.DarkBlue
			items25[1] = value91
			items25[2] = value92
			items25[3] = value93
			items25[4] = value94
			items25[5] = value95
			items25[6] = value96
			items25[7] = value97
			items25[8] = value98
			do
				local values = table.pack(new2(1, darkBlue))
				table.move(values, 1, values.n, 9, items25)
			end
			local value99 = colorSequence(items25)
			local uiGradient2 = Instance.new("UIGradient", uiStroke2)
			uiGradient2.Color = value99
			local instance3 = Instance.new("UIGradient", instance2)
			instance3.Color = value99
			local textLabel = Instance.new("TextLabel", frame5)
			textLabel.BackgroundTransparency = 1
			textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			textLabel.Position = UDim2.fromScale(0.5, 0.32)
			textLabel.Size = UDim2.fromScale(0.9, 0.44)
			textLabel.Font = gothamBlack
			textLabel.Text = value86 .. " NEXT BASE " .. value86
			textLabel.TextScaled = true
			if _G.__4HubEspBind then
				_G.__4HubEspBind(textLabel, "TextColor3", options23.LightBlue, "color3")
			else
				textLabel.TextColor3 = options23.LightBlue
			end
			textLabel.TextStrokeColor3 = options23.Black
			textLabel.TextStrokeTransparency = 0.2
			local textLabel2 = Instance.new("TextLabel", frame5)
			textLabel2.BackgroundTransparency = 1
			textLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
			textLabel2.Position = UDim2.fromScale(0.5, 0.74)
			textLabel2.Size = UDim2.fromScale(0.9, 0.34)
			textLabel2.Font = gothamBold2
			textLabel2.Text = "EMPTY BASE"
			textLabel2.TextScaled = true
			textLabel2.TextColor3 = options23.White
			textLabel2.TextStrokeColor3 = options23.Black
			textLabel2.TextStrokeTransparency = 0.3
			local function handleAction81(argument134)
				local text8 = argument134.Text:gsub("^%s+", "")
				local entry32 = "Empty Base"
				return text8:gsub("%s+$", "") == entry32
			end
			local function handleAction82()
				local value100 = nil
				for i = 1, #items21 do
					local entry33 = items22[i]
					if entry33 and entry33.label and handleAction81(entry33.label) then
						value100 = i
						break
					else
						value100 = nil
					end
				end
				if value100 then
					part.CFrame = items22[value100].cf
					textLabel2.Text = "EMPTY BASE #" .. value100
					billboardGui.Enabled = true
				else
					billboardGui.Enabled = false
				end
			end
			local function handleAction83(argument135)
				if items23[argument135] then
					return
				end
				items23[argument135] = true
				table.insert(items24, argument135:GetPropertyChangedSignal("Text"):Connect(handleAction82))
			end
			local function handleAction84()
				for _, child in ipairs(plots:GetChildren()) do
					local plotSign = child:FindFirstChild("PlotSign")
					local value101 = plotSign and plotSign:FindFirstChild("Model")
					plotSign = plotSign and plotSign:FindFirstChild("SurfaceGui")
					plotSign = plotSign and plotSign:FindFirstChild("Frame")
					plotSign = plotSign and plotSign:FindFirstChild("TextLabel")
					if value101 and plotSign then
						local value102 = handleAction80(value101)
						if value102 then
							items22[value102] = { label = plotSign, cf = select(1, value101:GetBoundingBox()) }
							handleAction83(plotSign)
						end
					end
				end
				handleAction82()
			end
			handleAction84()
			table.insert(items24, plots.DescendantAdded:Connect(function(descendant)
				if descendant:IsA("TextLabel") then
					task.defer(handleAction84)
				end
			end))
			table.insert(items24, plots.ChildAdded:Connect(function()
				task.defer(handleAction84)
			end))
			table.insert(items24, RunService2.RenderStepped:Connect(function()
				local entry34 = 360
				local rotation = tick() * 100 % entry34
				uiGradient2.Rotation = rotation
				instance3.Rotation = rotation
				local entry35 = 3
				instance2.Transparency = 0.5 + 0.2 * math.sin(tick() * entry35)
			end))
			_G.__NextBaseCleanup = function()
				for _, connection4 in ipairs(items24) do
					pcall(function()
						connection4:Disconnect()
					end)
				end
				if billboardGui then
					pcall(function()
						billboardGui:Destroy()
					end)
				end
				if part then
					part:Destroy()
				end
				_G.__NextBaseCleanup = nil
			end
		end
		handleAction3 = function(nextBaseWanted)
			_G.__NextBaseWanted = nextBaseWanted
			if nextBaseWanted then
				handleAction79()
			elseif _G.__NextBaseCleanup then
				pcall(_G.__NextBaseCleanup)
			end
		end
	end
end
do
	local color = Color3.fromRGB(55, 185, 255)
	number = 8
	number1 = 10
	enabled3 = false
	enabled4 = false
	text3 = "all"
	folder = nil
	folder2 = nil
	number2 = 0
	overlayConnections = {}
	disconnectOverlayConnections = function()
		for _, connection5 in ipairs(overlayConnections) do
			pcall(function()
				connection5:Disconnect()
			end)
		end
		overlayConnections = {}
	end
	resetOverlayFolders = function()
		if folder then
			pcall(function()
				folder:Destroy()
			end)
		end
		folder = Instance.new("Folder")
		folder.Name = "\5"
		folder.Parent = _G.__4HubEspWorldHolder()
		if folder2 then
			pcall(function()
				folder2:Destroy()
			end)
		end
		local value103 = workspace:FindFirstChild("4HubPlotCollision")
		if value103 then
			pcall(function()
				value103:Destroy()
			end)
		end
		folder2 = Instance.new("Folder")
		folder2.Name = "4HubPlotCollision"
		folder2.Parent = workspace
	end
	local function handleAction85(cFrame, size)
		if not folder2 then
			return
		end
		local part = Instance.new("Part")
		part.Anchored = true
		part.CanCollide = not enabled4
		part.CanQuery = false
		part.CanTouch = false
		part.Transparency = 1
		part.Size = size
		part.CFrame = cFrame
		part.Parent = folder2
	end
	setOverlayCollision = function(canCollide)
		if not folder2 then
			return
		end
		for _, child in ipairs(folder2:GetChildren()) do
			if child:IsA("BasePart") then
				pcall(function()
					child.CanCollide = canCollide
				end)
			end
		end
	end
	getBaseBounds = function(baseModel)
		local base = baseModel:FindFirstChild("Base") or baseModel
		if base:IsA("Model") then
			local ok, result, result2 = pcall(function()
				return base:GetBoundingBox()
			end)
			if ok then
				return result, result2
			end
		elseif base:IsA("BasePart") then
			return base.CFrame, base.Size
		end
	end
	createBaseOverlay = function(baseCFrame, baseSize)
		if not folder then
			return
		end
		local cFrame = baseCFrame * CFrame.new(0, -baseSize.Y / 2 + 0.175, 0)
		local vector = Vector3.new(baseSize.X, 0.35, baseSize.Z)
		local part = Instance.new("Part")
		part.Anchored = true
		part.CanCollide = false
		part.CanQuery = false
		part.CanTouch = false
		part.Transparency = 1
		part.Size = vector
		part.CFrame = cFrame
		part.Parent = folder
		local instance2 = Instance.new("SelectionBox")
		instance2.Adornee = part
		if _G.__4HubEspBind then
			_G.__4HubEspBind(instance2, "Color3", color, "color3")
			_G.__4HubEspBind(instance2, "SurfaceColor3", color, "color3")
		else
			instance2.Color3 = color
			instance2.SurfaceColor3 = color
		end
		instance2.LineThickness = 0.05
		instance2.Transparency = 0
		instance2.SurfaceTransparency = 0.8
		instance2.Parent = part
		handleAction85(cFrame, vector)
	end
end
local instance2, enabled19, carpetSpeed, instance3, enabled20, handleAction86, service10, localPlayer13, enabled21, handleAction87
do
	local handleAction88, handleAction89, handleAction90, handleAction91, options24, handleAction92, handleAction93
	do
		local players5, entry36, items26, items27, handleAction94, handleAction95
		do
			local handleAction96
			do
				local function handleAction97(argument136)
					local value104 = nil
					for _, child in ipairs(argument136:GetChildren()) do
						local animalPodiums = child:FindFirstChild("AnimalPodiums")
						if animalPodiums then
							local items28 = {}
							for _, child2 in ipairs(animalPodiums:GetChildren()) do
								local value105 = getBaseBounds(child2)
								if value105 then
									items28[#items28 + 1] = value105.Position.Y
								end
							end
							table.sort(items28)
							local items29 = {}
							for _, value106 in ipairs(items28) do
								local enabled22 = false
								for _, value107 in ipairs(items29) do
									if math.abs(value107 - value106) <= number then
										enabled22 = true
										break
									end
								end
								if not enabled22 then
									items29[#items29 + 1] = value106
								end
							end
							if not value104 or #items29 > #value104 then
								value104 = items29
							end
						end
					end
					local items30 = {}
					if value104 and #value104 >= 2 then
						for i = 2, #value104 do
							items30[#items30 + 1] = value104[i] - value104[1]
						end
					end
					if #items30 < 2 then
						items30 = { 17, 34 }
					end
					return items30
				end
				local function handleAction98(argument137, argument138)
					local animalPodiums = argument137:FindFirstChild("AnimalPodiums")
					if not animalPodiums then
						return
					end
					local items31 = {}
					local items32 = {}
					local huge = math.huge
					for _, child in ipairs(animalPodiums:GetChildren()) do
						local value108, value109 = getBaseBounds(child)
						if value108 then
							items31[#items31 + 1] = { cf = value108, sz = value109 }
							items32[#items32 + 1] = value108.Position
							huge = math.min(huge, value108.Position.Y)
						end
					end
					for _, value110 in ipairs(items31) do
						createBaseOverlay(value110.cf, value110.sz)
					end
					for _, value111 in ipairs(items31) do
						if value111.cf.Position.Y <= huge + number then
							for _, value112 in ipairs(argument138) do
								local number22 = value111.cf + Vector3.new(0, value112, 0)
								local enabled23 = false
								for _, value113 in ipairs(items32) do
									if (value113 - number22.Position).Magnitude <= number1 then
										enabled23 = true
										break
									end
								end
								if not enabled23 then
									createBaseOverlay(number22, value111.sz)
								end
							end
						end
					end
				end
				local function handleAction99(argument139)
					for _, child in ipairs(argument139:GetChildren()) do
						local plotSign = child:FindFirstChild("PlotSign")
						plotSign = plotSign and plotSign:FindFirstChild("SurfaceGui")
						plotSign = plotSign and plotSign:FindFirstChild("Frame")
						plotSign = plotSign and plotSign:FindFirstChild("TextLabel")
						if plotSign then
							if (plotSign.Text or ""):gsub("^%s+", ""):gsub("%s+$", "") == "Empty Base" then
								return child
							end
						end
					end
					return nil
				end
				handleAction96 = function()
					if not enabled3 then
						return
					end
					local value114 = workspace:FindFirstChild("Plots")
					if not value114 then
						return
					end
					resetOverlayFolders()
					local value115 = handleAction97(value114)
					if text3 == "next" then
						local value116 = handleAction99(value114)
						if value116 then
							handleAction98(value116, value115)
						end
					else
						for _, child in ipairs(value114:GetChildren()) do
							handleAction98(child, value115)
						end
					end
				end
			end
			local handleAction100
			do
				local enabled24 = false
				handleAction100 = function()
					if enabled24 or not enabled3 then
						return
					end
					enabled24 = true
					task.delay(0.35, function()
						enabled24 = false
						if enabled3 then
							handleAction96()
						end
					end)
				end
			end
			do
				local function handleAction101()
					number2 += 1
					local number23 = number2
					local plots = workspace:FindFirstChild("Plots") or workspace:WaitForChild("Plots", 30)
					if not plots or not enabled3 then
						return
					end
					handleAction96()
					local function handleAction102(argument140)
						local value117 = argument140:FindFirstChild("AnimalPodiums")
						if value117 then
							overlayConnections[#overlayConnections + 1] = value117.ChildAdded:Connect(handleAction100)
							overlayConnections[#overlayConnections + 1] = value117.ChildRemoved:Connect(handleAction100)
						end
					end
					for _, child in ipairs(plots:GetChildren()) do
						handleAction102(child)
					end
					overlayConnections[#overlayConnections + 1] = plots.ChildAdded:Connect(function(child)
						task.defer(handleAction102, child)
						handleAction100()
					end)
					overlayConnections[#overlayConnections + 1] = plots.ChildRemoved:Connect(handleAction100)
					overlayConnections[#overlayConnections + 1] = localPlayer1.CharacterAdded:Connect(function()
						task.wait(0.3)
						handleAction100()
					end)
					overlayConnections[#overlayConnections + 1] = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(handleAction100)
					local function handleAction103()
						enabled4 = localPlayer1:GetAttribute("Stealing") == true
						setOverlayCollision(not enabled4)
					end
					handleAction103()
					overlayConnections[#overlayConnections + 1] = localPlayer1:GetAttributeChangedSignal("Stealing"):Connect(handleAction103)
					task.spawn(function()
						while true do
							if enabled3 and number23 == number2 then
								task.wait(4)
								if not (not enabled3 or number23 ~= number2) then
									if text3 == "next" then
										handleAction96()
									elseif not folder or not folder.Parent or #folder:GetChildren() == 0 then
										handleAction96()
									end
									continue
								end
							end
							break
						end
					end)
				end
				local function handleAction104()
					enabled3 = false
					number2 += 1
					disconnectOverlayConnections()
					if folder then
						pcall(function()
							folder:Destroy()
						end)
					end
					folder = nil
					if folder2 then
						pcall(function()
							folder2:Destroy()
						end)
					end
					folder2 = nil
				end
				_G.__4HubSetPlotMode = function(argument141)
					text3 = argument141
					if enabled3 then
						handleAction96()
					end
				end
				_G.__4HubSetPlotESP = function(argument142)
					if argument142 then
						if enabled3 then
							return
						end
						enabled3 = true
						handleAction101()
					else
						handleAction104()
					end
				end
			end
		end
		do
			local RunService2, service11, enabled25, items33, connection_, handleAction105
			do
				local players6 = game:GetService("Players")
				RunService2 = game:GetService("RunService")
				service11 = game:GetService("Workspace")
				local color = Color3.fromRGB(92, 165, 255)
				local color2 = Color3.fromRGB(120, 200, 255)
				enabled25 = false
				items33 = {}
				connection_ = nil
				local function handleAction106(argument143)
					local match = argument143:match("SubspaceTripmine(.+)")
					if not match then
						return "Unknown"
					end
					local value118 = players6:FindFirstChild(match)
					return value118 and value118.DisplayName or match
				end
				handleAction105 = function(adornee)
					local value119 = handleAction106(adornee.Name)
					local instance4 = Instance.new("SelectionBox")
					instance4.Name = "\5"
					instance4.Adornee = adornee
					if _G.__4HubEspBind then
						_G.__4HubEspBind(instance4, "Color3", color, "color3")
					else
						instance4.Color3 = color
					end
					instance4.LineThickness = 0.01
					instance4.Parent = _G.__4HubEspWorldHolder()
					local billboardGui = Instance.new("BillboardGui")
					billboardGui.Name = "\5"
					billboardGui.Adornee = adornee
					billboardGui.Size = UDim2.new(0, 250, 0, 50)
					billboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
					billboardGui.AlwaysOnTop = true
					billboardGui.Parent = _G.__4HubEspGuiHolder()
					local textLabel = Instance.new("TextLabel")
					textLabel.Size = UDim2.new(1, 0, 1, 0)
					textLabel.BackgroundTransparency = 1
					textLabel.Text = value119 .. "'s Subspace Mine"
					if _G.__4HubEspBind then
						_G.__4HubEspBind(textLabel, "TextColor3", color2, "color3")
					else
						textLabel.TextColor3 = color2
					end
					textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
					textLabel.TextStrokeTransparency = 0
					textLabel.Font = Enum.Font.GothamBold
					textLabel.TextSize = 16
					textLabel.Parent = billboardGui
					return { selectionBox = instance4, billboardGui = billboardGui, mine = adornee }
				end
			end
			do
				local function handleAction107()
					for _, value120 in pairs(items33) do
						if value120.selectionBox then
							value120.selectionBox:Destroy()
						end
						if value120.billboardGui then
							value120.billboardGui:Destroy()
						end
					end
					table.clear(items33)
				end
				local function handleAction108()
					if not enabled25 then
						handleAction107()
						return
					end
					local value121 = service11:FindFirstChild("Debris")
					if not value121 then
						return
					end
					local items34 = {}
					for _, child in pairs(value121:GetChildren()) do
						if child:IsA("BasePart") and child.Name:match("^SubspaceTripmine") then
							items34[child] = true
							if not items33[child] then
								items33[child] = handleAction105(child)
							end
						end
					end
					for k, value122 in pairs(items33) do
						if not items34[k] or not k.Parent then
							if value122.selectionBox then
								value122.selectionBox:Destroy()
							end
							if value122.billboardGui then
								value122.billboardGui:Destroy()
							end
							items33[k] = nil
						end
					end
				end
				handleAction88 = function(argument144)
					enabled25 = argument144
					if argument144 then
						if not connection_ then
							local entry37 = 0
							connection_ = RunService2.Heartbeat:Connect(function(deltaTime)
								if not enabled25 then
									return
								end
								entry37 += deltaTime
								if entry37 < 0.3 then
									return
								end
								entry37 = 0
								handleAction108()
							end)
						end
					else
						if connection_ then
							connection_:Disconnect()
							connection_ = nil
						end
						handleAction107()
					end
				end
			end
		end
		do
			local RunService2 = game:GetService("RunService")
			local Workspace2 = game:GetService("Workspace")
			local enabled26 = false
			local items35 = {}
			local connection_ = nil
			local function createBillboardGui(argument145, adornee)
				if items35[argument145] then
					items35[argument145]:Destroy()
				end
				local billboardGui = Instance.new("BillboardGui")
				billboardGui.Name = "\5"
				billboardGui.Size = UDim2.new(0, 60, 0, 30)
				billboardGui.StudsOffset = Vector3.new(0, 5, 0)
				billboardGui.AlwaysOnTop = true
				billboardGui.Adornee = adornee
				billboardGui.MaxDistance = 1000
				billboardGui.Parent = _G.__4HubEspGuiHolder()
				local textLabel = Instance.new("TextLabel")
				textLabel.Size = UDim2.new(1, 0, 1, 0)
				textLabel.BackgroundTransparency = 1
				textLabel.TextSize = 17
				textLabel.Font = Enum.Font.GothamBlack
				textLabel.TextColor3 = Color3.fromRGB(120, 200, 255)
				textLabel.TextStrokeTransparency = 0
				textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
				textLabel.Parent = billboardGui
				items35[argument145] = billboardGui
				return billboardGui
			end
			local function handleAction109()
				for _, value123 in pairs(items35) do
					if value123 then
						value123:Destroy()
					end
				end
				table.clear(items35)
			end
			local function handleAction110()
				if not enabled26 then
					handleAction109()
					return
				end
				local plots = Workspace2:FindFirstChild("Plots")
				if not plots then
					return
				end
				for _, child in ipairs(plots:GetChildren()) do
					local purchases = child:FindFirstChild("Purchases")
					purchases = purchases and purchases:FindFirstChild("PlotBlock")
					purchases = purchases and purchases:FindFirstChild("Main")
					local billboardGui = purchases and purchases:FindFirstChild("BillboardGui") and purchases.BillboardGui:FindFirstChild("RemainingTime")
					if billboardGui and purchases then
						local textLabel = (items35[child] or createBillboardGui(child, purchases)):FindFirstChildWhichIsA("TextLabel")
						if textLabel then
							textLabel.Text = billboardGui.Text
						end
					elseif items35[child] then
						items35[child]:Destroy()
						items35[child] = nil
					end
				end
			end
			handleAction89 = function(argument146)
				enabled26 = argument146
				if argument146 then
					if not connection_ then
						local number24 = 0
						connection_ = RunService2.Heartbeat:Connect(function(deltaTime)
							if not enabled26 then
								return
							end
							number24 += deltaTime
							if number24 < 0.25 then
								return
							end
							number24 = 0
							handleAction110()
						end)
					end
				else
					if connection_ then
						connection_:Disconnect()
						connection_ = nil
					end
					handleAction109()
				end
			end
		end
		players5 = game:GetService("Players")
		do
			local localPlayer14 = players5.LocalPlayer
			local color = Color3.fromRGB(20, 60, 80)
			local color2 = Color3.fromRGB(45, 100, 200)
			entry36 = false
			items26 = {}
			items27 = {}
			handleAction94 = function(argument147)
				if not argument147 then
					return
				end
				local entry38 = items27[argument147]
				if entry38 then
					pcall(function()
						entry38:Destroy()
					end)
					items27[argument147] = nil
				end
			end
			local function handleAction111(adornee)
				if not adornee then
					return
				end
				for k, value124 in pairs(items27) do
					if not k.Parent then
						pcall(function()
							value124:Destroy()
						end)
						items27[k] = nil
					end
				end
				handleAction94(adornee)
				local instance4 = Instance.new("Highlight")
				instance4.Name = "\5"
				if _G.__4HubEspBind then
					_G.__4HubEspBind(instance4, "FillColor", color, "color3")
					_G.__4HubEspBind(instance4, "OutlineColor", color2, "color3")
				else
					instance4.FillColor = color
					instance4.OutlineColor = color2
				end
				instance4.FillTransparency = 0.55
				instance4.OutlineTransparency = 0
				instance4.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				instance4.Adornee = adornee
				instance4.Parent = _G.__4HubEspGuiHolder()
				items27[adornee] = instance4
				return
			end
			handleAction95 = function(argument148)
				if argument148 == localPlayer14 then
					return
				end
				if argument148.Character then
					handleAction111(argument148.Character)
				end
				table.insert(items26, argument148.CharacterAdded:Connect(function(character)
					character:WaitForChild("Humanoid", 5)
					task.wait(0.1)
					if entry36 then
						handleAction111(character)
					end
				end))
			end
		end
		local handleAction112
		do
			local function handleAction113()
				for k, value125 in pairs(items27) do
					pcall(function()
						value125:Destroy()
					end)
					items27[k] = nil
				end
			end
			handleAction90 = function(argument149)
				entry36 = argument149
				if argument149 then
					for _, player_ in ipairs(players5:GetPlayers()) do
						handleAction95(player_)
					end
					table.insert(items26, players5.PlayerAdded:Connect(function(player_)
						if entry36 then
							handleAction95(player_)
						end
					end))
					table.insert(items26, players5.PlayerRemoving:Connect(function(player_)
						if player_.Character then
							handleAction94(player_.Character)
						end
					end))
				else
					for _, connection6 in ipairs(items26) do
						if typeof(connection6) == "RBXScriptConnection" then
							connection6:Disconnect()
						end
					end
					items26 = {}
					handleAction113()
				end
			end
		end
		do
			local service12 = game:GetService("UserInputService")
			local service13 = game:GetService("RunService")
			local localPlayer15 = game:GetService("Players").LocalPlayer
			local items36 = {}
			local entry39 = false
			local enabled27 = false
			local entry40 = 0
			local function handleAction114()
				enabled27 = false
				for _, connection7 in ipairs(items36) do
					if typeof(connection7) == "RBXScriptConnection" then
						connection7:Disconnect()
					end
				end
				items36 = {}
				entry39 = false
			end
			local function handleAction115()
				if enabled27 then
					return
				end
				enabled27 = true
				table.insert(items36, service13.Heartbeat:Connect(function(deltaTime)
					entry40 += deltaTime
					if entry40 < 0.016666666666666666 then
						return
					end
					entry40 = 0
					local character = localPlayer15.Character
					if not character then
						return
					end
					local value126 = character:FindFirstChild("HumanoidRootPart")
					if value126 then
						local velocity = value126.Velocity
						if velocity.Y < -50 then
							value126.Velocity = Vector3.new(velocity.X, -28, velocity.Z)
						end
					end
				end))
				table.insert(items36, service12.JumpRequest:Connect(function()
					local character = localPlayer15.Character
					if not character then
						return
					end
					local value127 = character:FindFirstChild("HumanoidRootPart")
					if value127 then
						value127.Velocity = Vector3.new(value127.Velocity.X, 50, value127.Velocity.Z)
					end
				end))
				table.insert(items36, service12.InputBegan:Connect(function(input, gameProcessed)
					if gameProcessed then
						return
					end
					if input.KeyCode == Enum.KeyCode.Space then
						entry39 = true
					end
				end))
				table.insert(items36, service12.InputEnded:Connect(function(input)
					if input.KeyCode == Enum.KeyCode.Space then
						entry39 = false
					end
				end))
				table.insert(items36, service13.Heartbeat:Connect(function()
					if not entry39 then
						return
					end
					if not service12:IsKeyDown(Enum.KeyCode.Space) then
						entry39 = false
						return
					end
					local character = localPlayer15.Character
					if not character then
						return
					end
					local value128 = character:FindFirstChild("HumanoidRootPart")
					if value128 then
						local velocity = value128.Velocity
						if velocity.Y < 45 then
							value128.Velocity = Vector3.new(velocity.X, 45, velocity.Z)
						end
					end
				end))
			end
			handleAction112 = function(argument150)
				if argument150 then
					handleAction115()
				else
					handleAction114()
				end
			end
		end
		do
			local RunService2 = game:GetService("RunService")
			local connection_ = nil
			_G.__4HubSetFloat = function(argument151)
				if argument151 then
					if connection_ then
						return
					end
					connection_ = RunService2.PreSimulation:Connect(function()
						if _G.__4HubDead then
							return
						end
						local character = localPlayer1.Character
						local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
						local humanoid1 = character and character:FindFirstChildOfClass("Humanoid")
						if not humanoidRootPart or not humanoid1 or humanoid1.Health <= 0 then
							return
						end
						pcall(function()
							humanoid1.PlatformStand = false
						end)
						local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
						humanoidRootPart.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X, 34, assemblyLinearVelocity.Z)
					end)
				elseif connection_ then
					connection_:Disconnect()
					connection_ = nil
				end
			end
		end
		do
			local players7 = game:GetService("Players")
			local RunService2 = game:GetService("RunService")
			local Lighting = game:GetService("Lighting")
			local Workspace2 = game:GetService("Workspace")
			local localPlayer16 = players7.LocalPlayer
			effectProtection = {
				running = false,
				connections = {},
				originalMoveFunction = nil,
				controlsProtected = false,
				badLightingNames = {
					Blue = true,
					DiscoEffect = true,
					BeeBlur = true,
					ColorCorrection = true,
				},
				fovConn = nil,
				lockedFOV = 70,
				inverseConn = nil,
				inverseOriginalMove = nil,
				inverseProtected = false,
				nuke = function(argument152)
					if not argument152 or not argument152.Parent then
						return
					end
					if effectProtection.badLightingNames[argument152.Name] then
						pcall(function()
							argument152:Destroy()
						end)
					end
				end,
				disconnectAll = function()
					for _, connection_ in ipairs(effectProtection.connections) do
						if typeof(connection_) == "RBXScriptConnection" then
							connection_:Disconnect()
						end
					end
					effectProtection.connections = {}
					if effectProtection.fovConn then
						effectProtection.fovConn:Disconnect()
						effectProtection.fovConn = nil
					end
				end,
				protectControls = function()
					if effectProtection.controlsProtected then
						return
					end
					pcall(function()
						local playerModule = localPlayer16.PlayerScripts:FindFirstChild("PlayerModule")
						if not playerModule then
							return
						end
						local controls = require(playerModule):GetControls()
						if not controls then
							return
						end
						if not effectProtection.originalMoveFunction then
							effectProtection.originalMoveFunction = controls.moveFunction
						end
						local function moveFunction(argument153, argument154, argument155)
							if effectProtection.originalMoveFunction then
								effectProtection.originalMoveFunction(argument153, argument154, argument155)
							end
						end
						table.insert(effectProtection.connections, RunService2.Heartbeat:Connect(function()
							if not effectProtection.running then
								return
							end
							if controls.moveFunction ~= moveFunction then
								controls.moveFunction = moveFunction
							end
						end))
						controls.moveFunction = moveFunction
						effectProtection.controlsProtected = true
					end)
				end,
				restoreControls = function()
					if not effectProtection.controlsProtected then
						return
					end
					pcall(function()
						local playerModule = localPlayer16.PlayerScripts:FindFirstChild("PlayerModule")
						if not playerModule then
							return
						end
						local controls = require(playerModule):GetControls()
						if controls and effectProtection.originalMoveFunction then
							controls.moveFunction = effectProtection.originalMoveFunction
							effectProtection.controlsProtected = false
						end
					end)
				end,
				protectInverse = function()
					if effectProtection.inverseProtected then
						return
					end
					pcall(function()
						local playerModule = localPlayer16.PlayerScripts:FindFirstChild("PlayerModule")
						if not playerModule then
							return
						end
						local controls = require(playerModule):GetControls()
						if not controls then
							return
						end
						if not effectProtection.inverseOriginalMove then
							effectProtection.inverseOriginalMove = controls.moveFunction
						end
						local function moveFunction(argument156, argument157, argument158)
							if effectProtection.inverseOriginalMove then
								effectProtection.inverseOriginalMove(argument156, argument157, argument158)
							end
						end
						effectProtection.inverseConn = RunService2.Heartbeat:Connect(function()
							if not effectProtection.running then
								return
							end
							if controls.moveFunction ~= moveFunction then
								controls.moveFunction = moveFunction
							end
						end)
						controls.moveFunction = moveFunction
						effectProtection.inverseProtected = true
					end)
				end,
				restoreInverse = function()
					if not effectProtection.inverseProtected then
						return
					end
					if effectProtection.inverseConn then
						effectProtection.inverseConn:Disconnect()
						effectProtection.inverseConn = nil
					end
					pcall(function()
						local playerModule = localPlayer16.PlayerScripts:FindFirstChild("PlayerModule")
						if not playerModule then
							return
						end
						local controls = require(playerModule):GetControls()
						if controls and effectProtection.inverseOriginalMove then
							controls.moveFunction = effectProtection.inverseOriginalMove
						end
					end)
					effectProtection.inverseProtected = false
				end,
				blockBuzzingSound = function()
					pcall(function()
						local bee = localPlayer16.PlayerScripts:FindFirstChild("Bee", true)
						if bee then
							local buzzing = bee:FindFirstChild("Buzzing")
							if buzzing and buzzing:IsA("Sound") then
								buzzing:Stop()
								buzzing.Volume = 0
							end
						end
					end)
				end,
				lockFOV = function()
					local currentCamera = Workspace2.CurrentCamera
					if currentCamera then
						effectProtection.lockedFOV = currentCamera.FieldOfView
					end
					if effectProtection.fovConn then
						effectProtection.fovConn:Disconnect()
						effectProtection.fovConn = nil
					end
					effectProtection.fovConn = RunService2.RenderStepped:Connect(function()
						if not effectProtection.running then
							return
						end
						local currentCamera2 = Workspace2.CurrentCamera
						if currentCamera2 and currentCamera2.FieldOfView ~= effectProtection.lockedFOV then
							currentCamera2.FieldOfView = effectProtection.lockedFOV
						end
					end)
				end,
				Enable = function()
					if effectProtection.running then
						return
					end
					effectProtection.running = true
					for _, descendant in ipairs(Lighting:GetDescendants()) do
						effectProtection.nuke(descendant)
					end
					table.insert(effectProtection.connections, Lighting.DescendantAdded:Connect(function(descendant)
						if not effectProtection.running then
							return
						end
						effectProtection.nuke(descendant)
					end))
					effectProtection.protectControls()
					effectProtection.protectInverse()
					table.insert(effectProtection.connections, RunService2.Heartbeat:Connect(function()
						if not effectProtection.running then
							return
						end
						effectProtection.blockBuzzingSound()
					end))
					effectProtection.lockFOV()
				end,
				Disable = function()
					if not effectProtection.running then
						return
					end
					effectProtection.running = false
					effectProtection.restoreControls()
					effectProtection.restoreInverse()
					effectProtection.disconnectAll()
				end,
			}
		end
		do
			local value129, localPlayer17, handleAction116, handleAction117
			handleAction91 = function(argument159)
				if argument159 then
					effectProtection.Enable()
				else
					effectProtection.Disable()
				end
			end
			options24 = { speed = 175 }
			options24.item = getSavedChoice("CarpetItem") or "Flying Carpet"
			options24.enabled = false
			value129 = game
			localPlayer17 = game:GetService("Players").LocalPlayer
			do
				local function handleAction118(argument160)
					local character = localPlayer17.Character
					local value130 = localPlayer17:FindFirstChildOfClass("Backpack")
					local function handleAction119(argument161)
						if not argument161 then
							return nil
						end
						for _, child in ipairs(argument161:GetChildren()) do
							if child:IsA("Tool") and child.Name == argument160 then
								return child
							end
						end
						return nil
					end
					return handleAction119(character) or handleAction119(value130)
				end
				handleAction116 = function()
					local character = localPlayer17.Character
					if not character then
						return false
					end
					local value131 = character:FindFirstChild(options24.item)
					return value131 and value131:IsA("Tool") or false
				end
				handleAction117 = function()
					local character = localPlayer17.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")
					if not humanoid then
						return
					end
					if handleAction116() then
						return
					end
					local value132 = handleAction118(options24.item)
					if value132 then
						pcall(function()
							humanoid:EquipTool(value132)
						end)
					end
				end
			end
			do
				local function handleAction120()
					local character = localPlayer17.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					if humanoidRootPart then
						pcall(function()
							humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, humanoidRootPart.AssemblyLinearVelocity.Y, 0)
						end)
					end
					_G.__4HubCarpetActive = false
				end
				value129:GetService("RunService").Heartbeat:Connect(function()
					if not options24.enabled then
						_G.__4HubCarpetActive = false
						return
					end
					local character = localPlayer17.Character
					if not character then
						return
					end
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					if not humanoidRootPart or not humanoid then
						return
					end
					if not handleAction116() then
						handleAction117()
						return
					end
					pcall(function()
						humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
						return
					end)
					local moveDirection = humanoid.MoveDirection
					if 0.01 < moveDirection.Magnitude then
						_G.__4HubCarpetActive = true
						pcall(function()
							humanoidRootPart.AssemblyLinearVelocity = Vector3.new(moveDirection.X * options24.speed, humanoidRootPart.AssemblyLinearVelocity.Y, moveDirection.Z * options24.speed)
						end)
					else
						_G.__4HubCarpetActive = false
						pcall(function()
							humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, humanoidRootPart.AssemblyLinearVelocity.Y, 0)
						end)
					end
				end)
				handleAction92 = function(enabled)
					options24.enabled = enabled
					if enabled then
						handleAction117()
					else
						handleAction120()
					end
				end
			end
		end
		do
			local number25 = 0
			handleAction93 = function()
				number25 += 1
				return number25
			end
		end
		do
			local entry41 = "Movement"
			local lightBlue = themeColors.LightBlue
			local darkBlue = themeColors.DarkBlue
			local blueLine = themeColors.BlueLine
			local value133 = handleAction93()
			createSection(service1, entry41, lightBlue, darkBlue, blueLine, value133)
		end
		_G.__4HubInfJumpToggle = createToggle(service1, "Infinite Jump", handleAction93(), false, function(argument162)
			handleAction112(argument162)
		end)
	end
	do
		local textButton2, instance4, handleAction121
		do
			local entry42 = false
			createToggle(service1, "Anti Ragdoll", handleAction93(), entry42, function(argument163)
				handleAction1(argument163)
			end)
		end
		instance2 = Instance.new("Frame")
		instance2.Name = "CarpetPopup"
		instance2.AnchorPoint = Vector2.new(0.5, 0.5)
		instance2.Position = UDim2.new(0.5, 0, 0.5, 0)
		instance2.Size = UDim2.fromOffset(236, 300)
		instance2.BackgroundColor3 = themeColors.BgPanel
		instance2.BorderSizePixel = 0
		instance2.Visible = false
		instance2.ClipsDescendants = true
		instance2.Active = true
		instance2.ZIndex = 1
		instance2.Parent = frame
		createUICorner(instance2, 10)
		createUIStroke(instance2, themeColors.LightBlue, 1)
		do
			local instance5 = Instance.new("TextLabel")
			instance5.BackgroundTransparency = 1
			instance5.Position = UDim2.fromOffset(12, 8)
			instance5.Size = UDim2.new(1, -40, 0, 16)
			instance5.Font = gothamBold
			instance5.Text = "Carpet Speed"
			instance5.TextColor3 = themeColors.White
			instance5.TextSize = 13
			instance5.TextXAlignment = Enum.TextXAlignment.Left
			instance5.Parent = instance2
		end
		textButton2 = Instance.new("TextButton")
		textButton2.AnchorPoint = Vector2.new(1, 0)
		textButton2.Position = UDim2.new(1, -8, 0, 6)
		textButton2.Size = UDim2.fromOffset(18, 18)
		textButton2.BackgroundTransparency = 1
		textButton2.Font = gothamBold
		textButton2.Text = "X"
		textButton2.TextColor3 = themeColors.TextDim
		textButton2.TextSize = 13
		textButton2.Parent = instance2
		textButton2.MouseEnter:Connect(function()
			textButton2.TextColor3 = themeColors.White
		end)
		textButton2.MouseLeave:Connect(function()
			textButton2.TextColor3 = themeColors.TextDim
		end)
		do
			local frame5 = Instance.new("Frame")
			frame5.Position = UDim2.fromOffset(10, 28)
			frame5.Size = UDim2.new(1, -20, 0, 1)
			frame5.BackgroundColor3 = themeColors.Stroke
			frame5.BorderSizePixel = 0
			frame5.Parent = instance2
		end
		instance4 = Instance.new("ScrollingFrame")
		instance4.Position = UDim2.fromOffset(8, 34)
		instance4.Size = UDim2.new(1, -16, 1, -42)
		instance4.BackgroundTransparency = 1
		instance4.BorderSizePixel = 0
		instance4.ScrollBarThickness = 3
		instance4.ScrollBarImageColor3 = themeColors.LightBlue
		instance4.CanvasSize = UDim2.new(0, 0, 0, 0)
		instance4.AutomaticCanvasSize = Enum.AutomaticSize.Y
		instance4.Parent = instance2
		do
			local instance5 = Instance.new("UIListLayout")
			instance5.Padding = UDim.new(0, 6)
			instance5.SortOrder = Enum.SortOrder.LayoutOrder
			instance5.Parent = instance4
		end
		do
			local entry43 = 0
			handleAction121 = function()
				entry43 += 1
				return entry43
			end
		end
		do
			local entry44 = "Speed"
			local lightBlue = themeColors.LightBlue
			local darkBlue = themeColors.DarkBlue
			local blueLine = themeColors.BlueLine
			local value134 = handleAction121()
			createSection(instance4, entry44, lightBlue, darkBlue, blueLine, value134)
		end
		do
			local options25 = {
				min = 60,
				max = 200,
				default = 175,
				decimals = 0,
			}
			createSlider(instance4, "Speed", handleAction121(), options25, function(speed)
				options24.speed = speed
			end)
		end
		do
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, 0, 0, 14)
			textLabel.BackgroundTransparency = 1
			textLabel.Font = gothamMedium
			textLabel.Text = "Speed over 185 can cause lagback."
			textLabel.TextColor3 = themeColors.TextDim
			textLabel.TextSize = 10
			textLabel.TextXAlignment = Enum.TextXAlignment.Center
			textLabel.LayoutOrder = handleAction121()
			textLabel.Parent = instance4
		end
		do
			local lightBlue = themeColors.LightBlue
			local darkBlue = themeColors.DarkBlue
			local blueLine = themeColors.BlueLine
			local value135 = handleAction121()
			createSection(instance4, "Speed Item", lightBlue, darkBlue, blueLine, value135)
		end
		do
			local items37 = {}
			local function handleAction122()
				for k, value136 in pairs(items37) do
					local matchesCondition = options24.item == k
					TweenService:Create(value136.track, TweenInfo.new(0.15), { BackgroundColor3 = matchesCondition and themeColors.LightBlue or themeColors.ToggleOff }):Play()
					TweenService:Create(value136.knob, TweenInfo.new(0.15), {
						Position = matchesCondition and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7),
					}):Play()
				end
			end
			local function handleAction123(text)
				local frame5 = Instance.new("Frame")
				frame5.Size = UDim2.new(1, 0, 0, 30)
				frame5.BackgroundColor3 = themeColors.BgDark
				frame5.BorderSizePixel = 0
				frame5.LayoutOrder = handleAction121()
				frame5.Parent = instance4
				createUICorner(frame5, 6)
				createUIStroke(frame5, themeColors.Stroke, 1)
				local textLabel = Instance.new("TextLabel")
				textLabel.BackgroundTransparency = 1
				textLabel.Position = UDim2.fromOffset(10, 0)
				textLabel.Size = UDim2.new(1, -58, 1, 0)
				textLabel.Font = gothamMedium
				textLabel.Text = text
				textLabel.TextColor3 = themeColors.White
				textLabel.TextSize = 12
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.Parent = frame5
				local textButton3 = Instance.new("TextButton")
				textButton3.AnchorPoint = Vector2.new(1, 0.5)
				textButton3.Position = UDim2.new(1, -8, 0.5, 0)
				textButton3.Size = UDim2.fromOffset(38, 18)
				textButton3.AutoButtonColor = false
				textButton3.Text = ""
				textButton3.BackgroundColor3 = themeColors.ToggleOff
				textButton3.Parent = frame5
				createUICorner(textButton3, 9)
				local frame6 = Instance.new("Frame")
				frame6.Size = UDim2.fromOffset(14, 14)
				frame6.Position = UDim2.new(0, 3, 0.5, -7)
				frame6.BackgroundColor3 = themeColors.White
				frame6.BorderSizePixel = 0
				frame6.Parent = textButton3
				createUICorner(frame6, 7)
				items37[text] = { track = textButton3, knob = frame6 }
				local function handleAction124()
					options24.item = text
					handleAction122()
					saveChoice("CarpetItem", text)
				end
				textButton3.MouseButton1Click:Connect(handleAction124)
				frame5.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						handleAction124()
					end
				end)
			end
			for _, value137 in ipairs({
				"Flying Carpet",
				"Witch's Broom",
				"Santa's Sleigh",
				"Cupid's Wings",
				"Waverider",
				"Flying Bee",
			}) do
				handleAction123(value137)
			end
			handleAction122()
		end
		do
			local handleAction125
			enabled19 = false
			do
				local function handleAction126()
					TweenService:Create(instance2, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.fromOffset(0, 0) }):Play()
					task.delay(0.14, function()
						instance2.Visible = false
					end)
					enabled19 = false
				end
				textButton2.MouseButton1Click:Connect(handleAction126)
				handleAction125 = function()
					enabled19 = not enabled19
					if enabled19 then
						instance2.Visible = true
						instance2.Size = UDim2.fromOffset(0, 0)
						TweenService:Create(instance2, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(236, 300) }):Play()
					else
						handleAction126()
					end
				end
			end
			do
				local entry45 = false
				carpetSpeed = createToggle(service1, "Carpet Speed", handleAction93(), entry45, function(argument164)
					handleAction92(argument164)
				end, false, handleAction125)
			end
		end
	end
	_G.__4HubCarpetToggle = carpetSpeed
	_G.__4HubFloatToggle = createToggle(service1, "Float", handleAction93(), false, function(argument165)
		if _G.__4HubSetFloat then
			_G.__4HubSetFloat(argument165)
		end
	end)
	createToggle(service1, "No Animation", handleAction93(), false, function(argument166)
		handleAction2(argument166)
	end)
	do
		local value138 = handleAction93()
		createLabel(service1, 2, value138)
	end
	do
		local lightBlue = themeColors.LightBlue
		local darkBlue = themeColors.DarkBlue
		local blueLine = themeColors.BlueLine
		local value139 = handleAction93()
		createSection(service1, "Exploit", lightBlue, darkBlue, blueLine, value139)
	end
	do
		local entry46 = false
		createToggle(service1, "Auto Reset On Balloon", handleAction93(), entry46, function(4HubAutoResetBalloon)
			_G.__4HubAutoResetBalloon = 4HubAutoResetBalloon
		end)
	end
	createToggle(service1, "Auto Reset On Morph", handleAction93(), false, function(4HubAutoResetMorph)
		_G.__4HubAutoResetMorph = 4HubAutoResetMorph
	end)
	createToggle(service1, "Anti Effects", handleAction93(), false, function(argument167)
		handleAction91(argument167)
	end)
	do
		local value140 = handleAction93()
		createLabel(service1, 2, value140)
	end
	do
		local entry47 = "Visuals"
		local lightBlue = themeColors.LightBlue
		local darkBlue = themeColors.DarkBlue
		local blueLine = themeColors.BlueLine
		local value141 = handleAction93()
		createSection(service1, entry47, lightBlue, darkBlue, blueLine, value141)
	end
	createToggle(service1, "Player ESP", handleAction93(), false, function(argument168)
		handleAction90(argument168)
	end)
	do
		local entry48 = false
		createToggle(service1, "Brainrot ESP", handleAction93(), entry48, function(argument169)
			if _G.__4HubSetBrainrotESP then
				_G.__4HubSetBrainrotESP(argument169)
			end
		end)
	end
	createToggle(service1, "Mine ESP", handleAction93(), false, function(argument170)
		handleAction88(argument170)
	end)
	do
		local entry49 = false
		createToggle(service1, "Timer ESP", handleAction93(), entry49, function(argument171)
			handleAction89(argument171)
		end)
	end
	do
		local PlotESPMode, textButton2
		PlotESPMode = getSavedChoice("PlotESPMode") or "all"
		instance3 = Instance.new("Frame")
		instance3.Name = "PlotEspPopup"
		instance3.AnchorPoint = Vector2.new(0.5, 0.5)
		instance3.Position = UDim2.new(0.5, 0, 0.5, 0)
		instance3.Size = UDim2.fromOffset(196, 150)
		instance3.BackgroundColor3 = themeColors.BgPanel
		instance3.BorderSizePixel = 0
		instance3.Visible = false
		instance3.ClipsDescendants = true
		instance3.Active = true
		instance3.ZIndex = 1
		instance3.Parent = frame
		createUICorner(instance3, 10)
		createUIStroke(instance3, themeColors.LightBlue, 1)
		do
			local textLabel = Instance.new("TextLabel")
			textLabel.BackgroundTransparency = 1
			textLabel.Position = UDim2.fromOffset(12, 7)
			textLabel.Size = UDim2.new(1, -40, 0, 16)
			textLabel.Font = gothamBold
			textLabel.Text = "Plot ESP"
			textLabel.TextColor3 = themeColors.White
			textLabel.TextSize = 13
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.Parent = instance3
		end
		textButton2 = Instance.new("TextButton")
		textButton2.AnchorPoint = Vector2.new(1, 0)
		textButton2.Position = UDim2.new(1, -8, 0, 5)
		textButton2.Size = UDim2.fromOffset(18, 18)
		textButton2.BackgroundTransparency = 1
		textButton2.Font = gothamBold
		textButton2.Text = "X"
		textButton2.TextColor3 = themeColors.TextDim
		textButton2.TextSize = 13
		textButton2.Parent = instance3
		textButton2.MouseEnter:Connect(function()
			textButton2.TextColor3 = themeColors.White
		end)
		textButton2.MouseLeave:Connect(function()
			textButton2.TextColor3 = themeColors.TextDim
		end)
		do
			local frame5 = Instance.new("Frame")
			frame5.Position = UDim2.fromOffset(10, 28)
			frame5.Size = UDim2.new(1, -20, 0, 1)
			frame5.BackgroundColor3 = themeColors.Stroke
			frame5.BorderSizePixel = 0
			frame5.Parent = instance3
		end
		do
			local items38 = {}
			local function handleAction127()
				for k, value142 in pairs(items38) do
					local matchesCondition1 = PlotESPMode == k
					TweenService:Create(value142.track, TweenInfo.new(0.15), { BackgroundColor3 = matchesCondition1 and themeColors.LightBlue or themeColors.ToggleOff }):Play()
					TweenService:Create(value142.knob, TweenInfo.new(0.15), { Position = matchesCondition1 and UDim2.new(1, -15, 0.5, -6) or UDim2.new(0, 3, 0.5, -6) }):Play()
				end
			end
			local function handleAction128(text, argument172, argument173)
				local frame5 = Instance.new("Frame")
				frame5.Position = UDim2.fromOffset(10, argument173)
				frame5.Size = UDim2.new(1, -20, 0, 28)
				frame5.BackgroundColor3 = themeColors.BgDark
				frame5.BorderSizePixel = 0
				frame5.Parent = instance3
				createUICorner(frame5, 6)
				createUIStroke(frame5, themeColors.Stroke, 1)
				local instance4 = Instance.new("TextLabel")
				instance4.BackgroundTransparency = 1
				instance4.Position = UDim2.fromOffset(10, 0)
				instance4.Size = UDim2.new(1, -50, 1, 0)
				instance4.Font = gothamMedium
				instance4.Text = text
				instance4.TextColor3 = themeColors.White
				instance4.TextSize = 12
				instance4.TextXAlignment = Enum.TextXAlignment.Left
				instance4.Parent = frame5
				local instance5 = Instance.new("TextButton")
				instance5.AnchorPoint = Vector2.new(1, 0.5)
				instance5.Position = UDim2.new(1, -8, 0.5, 0)
				instance5.Size = UDim2.fromOffset(34, 18)
				instance5.AutoButtonColor = false
				instance5.Text = ""
				instance5.BackgroundColor3 = themeColors.ToggleOff
				instance5.Parent = frame5
				createUICorner(instance5, 9)
				local frame6 = Instance.new("Frame")
				frame6.Size = UDim2.fromOffset(12, 12)
				frame6.Position = UDim2.new(0, 3, 0.5, -6)
				frame6.BackgroundColor3 = themeColors.White
				frame6.BorderSizePixel = 0
				frame6.Parent = instance5
				createUICorner(frame6, 6)
				items38[argument172] = { track = instance5, knob = frame6 }
				local function handleAction129()
					PlotESPMode = argument172
					handleAction127()
					saveChoice("PlotESPMode", argument172)
					if _G.__4HubSetPlotMode then
						_G.__4HubSetPlotMode(argument172)
					end
				end
				instance5.MouseButton1Click:Connect(handleAction129)
				frame5.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						handleAction129()
					end
				end)
			end
			handleAction128("Show All Plots", "all", 34)
			handleAction128("Show Next Base Plot", "next", 68)
			handleAction127()
		end
		enabled20 = false
		do
			local function handleAction130()
				TweenService:Create(instance3, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.fromOffset(0, 0) }):Play()
				task.delay(0.14, function()
					instance3.Visible = false
				end)
				enabled20 = false
			end
			textButton2.MouseButton1Click:Connect(handleAction130)
			local function handleAction131()
				enabled20 = not enabled20
				if enabled20 then
					instance3.Visible = true
					instance3.Size = UDim2.fromOffset(0, 0)
					TweenService:Create(instance3, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(196, 150) }):Play()
				else
					handleAction130()
				end
			end
			if _G.__4HubSetPlotMode then
				_G.__4HubSetPlotMode(PlotESPMode)
			end
			createToggle(service1, "Plot ESP", handleAction93(), false, function(argument174)
				if _G.__4HubSetPlotESP then
					_G.__4HubSetPlotESP(argument174)
				end
			end, false, handleAction131)
		end
	end
	do
		local RunService2, enabled28, items39, handleAction132
		createToggle(service1, "Next Base ESP", handleAction93(), false, function(argument175)
			handleAction3(argument175)
		end)
		createToggle(service1, "Disable Brainrot Animations", handleAction93(), false, function(argument176)
			if _G.__4HubSetNoBrainrotAnims then
				_G.__4HubSetNoBrainrotAnims(argument176)
			end
		end)
		createToggle(service1, "Dark Sky", handleAction93(), false, function(argument177)
			if _G.__4HubSetDarkSky then
				_G.__4HubSetDarkSky(argument177)
			end
		end)
		do
			local players8 = game:GetService("Players")
			RunService2 = game:GetService("RunService")
			enabled28 = false
			items39 = {}
			local function handleAction133(argument178)
				if not argument178 then
					return
				end
				for _, child in ipairs(argument178:GetChildren()) do
					if child:IsA("Accessory") then
						local handle = child:FindFirstChild("Handle")
						if handle and handle:IsA("BasePart") then
							if items39[handle] == nil then
								items39[handle] = handle.LocalTransparencyModifier
							end
							handle.LocalTransparencyModifier = 1
						end
					elseif child:IsA("Shirt") or child:IsA("Pants") or child:IsA("ShirtGraphic") or child:IsA("CharacterMesh") then
						pcall(function()
							child:Destroy()
						end)
					end
				end
			end
			handleAction132 = function()
				for _, player_ in ipairs(players8:GetPlayers()) do
					if player_.Character then
						handleAction133(player_.Character)
					end
				end
			end
		end
		local connection_ = nil
		local entry50 = 0
		_G.__4HubSetDisableAccessories = function(argument179)
			enabled28 = argument179 and true or false
			if enabled28 then
				handleAction132()
				if not connection_ then
					connection_ = RunService2.Heartbeat:Connect(function(deltaTime)
						if not enabled28 then
							return
						end
						entry50 += deltaTime
						if entry50 < 0.5 then
							return
						end
						entry50 = 0
						handleAction132()
					end)
				end
			else
				for k, value143 in pairs(items39) do
					if k and k.Parent then
						pcall(function()
							k.LocalTransparencyModifier = value143
						end)
					end
				end
				items39 = {}
				if connection_ then
					connection_:Disconnect()
					connection_ = nil
				end
			end
		end
	end
	do
		local entry52 = false
		createToggle(service1, "Anti Flasher", handleAction93(), entry52, function(argument180)
			if _G.__4HubSetDisableAccessories then
				_G.__4HubSetDisableAccessories(argument180)
			end
		end)
	end
	do
		local entry53 = 0
		handleAction86 = function()
			entry53 += 1
			return entry53
		end
	end
end
do
	local lightBlue = themeColors.LightBlue
	local darkBlue = themeColors.DarkBlue
	local blueLine = themeColors.BlueLine
	local value144 = handleAction86()
	createSection(Keybinds, "Keybinds", lightBlue, darkBlue, blueLine, value144)
end
_G.__4HubKick = function()
	_G.__4HubLeaving = true
	task.wait()
	pcall(function()
		game:Shutdown()
	end)
end
_G.__4HubRejoin = function()
	pcall(function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	end)
end
do
	local players9 = game:GetService("Players")
	service10 = game:GetService("RunService")
	localPlayer13 = players9.LocalPlayer
end
do
	local playerGui_ = localPlayer13:WaitForChild("PlayerGui")
	enabled21 = false
	handleAction87 = function()
		local adminPanel = playerGui_:FindFirstChild("AdminPanel")
		if not adminPanel then
			return nil, nil
		end
		local ok, result = pcall(function()
			return adminPanel.AdminPanel.Content.ScrollingFrame
		end)
		if ok and result then
			local ragdoll = result:FindFirstChild("ragdoll")
			if ragdoll then
				return ragdoll, adminPanel
			end
		end
		for _, descendant in ipairs(adminPanel:GetDescendants()) do
			if descendant.Name == "ragdoll" and descendant:IsA("GuiButton") then
				return descendant, adminPanel
			end
		end
		return nil, adminPanel
	end
end
local handleAction134, handleAction135
do
	local handleAction136, entry54, value145
	do
		local TweenService2, service14, localPlayer18
		do
			local handleAction137
			do
				local service15, localPlayer19
				do
					local function handleAction138()
						local value146 = handleAction87()
						if not value146 then
							return false
						end
						local timer = value146:FindFirstChild("Timer")
						if not timer or not timer.Visible then
							return false
						end
						return (tonumber(tostring(timer.Text):match("%d+")) or 0) > 0
					end
					local function handleAction139(argument181)
						if not argument181 then
							return false
						end
						local enabled29 = false
						local function handleAction140(argument182)
							if not argument182 or not getconnections then
								return
							end
							local ok, result = pcall(getconnections, argument182)
							if ok and result then
								for _, value147 in ipairs(result) do
									if value147.Fire then
										pcall(function()
											value147:Fire()
										end)
										enabled29 = true
									elseif value147.Function then
										pcall(value147.Function)
										enabled29 = true
									end
								end
							end
						end
						pcall(function()
							handleAction140(argument181.Activated)
						end)
						pcall(function()
							handleAction140(argument181.MouseButton1Click)
						end)
						local enabled30 = not enabled29
						if enabled30 then
							local entry55 = "function"
							enabled30 = typeof(firesignal) == entry55
						end
						if enabled30 then
							pcall(firesignal, argument181.MouseButton1Click)
							pcall(firesignal, argument181.Activated)
							enabled29 = true
						end
						return enabled29
					end
					local function handleAction141(argument183, argument184)
						if not argument183 then
							return nil
						end
						local value148 = argument183:FindFirstChild(argument184.Name)
						if value148 and value148:IsA("GuiButton") then
							return value148
						end
						for _, descendant in ipairs(argument183:GetDescendants()) do
							if descendant:IsA("GuiButton") then
								if descendant.Name == argument184.Name then
									return descendant
								end
								local textLabel = descendant:FindFirstChildWhichIsA("TextLabel")
								if textLabel then
									textLabel = textLabel.Text == argument184.Name or textLabel.Text == argument184.DisplayName
								end
								if textLabel then
									return descendant
								end
							end
						end
						return nil
					end
					_G.__4HubRagdollSelf = function()
						if enabled21 then
							return
						end
						enabled21 = true
						task.spawn(function()
							if not handleAction87() then
								if ShowNotification then
									pcall(ShowNotification, "RAGDOLL", "No ragdoll command available")
								end
								enabled21 = false
								return
							end
							local now2 = os.clock()
							while handleAction138() do
								service10.Heartbeat:Wait()
								if not handleAction87() then
									enabled21 = false
									return
								end
								if not (os.clock() - now2 > 180) then
									continue
								end
								enabled21 = false
								return
							end
							local value149, value150 = handleAction87()
							if not (value150 and value149) then
								enabled21 = false
								return
							end
							handleAction139(value149)
							task.wait(0.03)
							local value151 = handleAction141(select(2, pcall(function()
								return value150.AdminPanel.Profiles.ScrollingFrame
							end)), localPlayer13) or handleAction141(value150, localPlayer13)
							if value151 then
								handleAction139(value151)
							end
							if ShowNotification then
								pcall(ShowNotification, "RAGDOLL", "Ragdolled yourself")
							end
							task.wait(0.15)
							enabled21 = false
						end)
					end
				end
				_G.__4HubDropBrainrot = _G.__4HubRagdollSelf
				localPlayer13.CharacterAdded:Connect(function()
					enabled21 = false
				end)
				do
					local localPlayer20 = game:GetService("Players").LocalPlayer
					local playerGui_ = localPlayer20:WaitForChild("PlayerGui")
					local enabled31 = false
					_G.__4HubCloneSwitch = function()
						if enabled31 then
							return
						end
						enabled31 = true
						task.spawn(function()
							_G.isCloning = false
							enabled31 = false
						end)
					end
				end
				_G.__4HubInstantClone = _G.__4HubCloneSwitch
				do
					local players10 = game:GetService("Players")
					service15 = game:GetService("RunService")
					localPlayer19 = players10.LocalPlayer
				end
				do
					local number26 = 0.4
					local number27 = 50000
					local enabled32 = true
					local number28 = 0.6
					local enabled33 = false
					local function handleAction142(argument185)
						if argument185:IsA("BasePart") or argument185:IsA("Decal") then
							argument185.LocalTransparencyModifier = 1
						end
					end
					_G.__4HubReset = function()
						if enabled33 then
							return
						end
						local character = localPlayer19.Character
						if not character or not character.Parent then
							return
						end
						local humanoid = character:FindFirstChildOfClass("Humanoid")
						if not humanoid or humanoid.Health <= 0 then
							return
						end
						local rootPart = humanoid.RootPart or character:FindFirstChild("HumanoidRootPart")
						enabled33 = true
						_G._FH_LAUNCHING = true
						task.spawn(function()
							local currentCamera = workspace.CurrentCamera
							local cFrame = currentCamera.CFrame
							local cameraType = currentCamera.CameraType
							pcall(function()
								currentCamera.CameraType = Enum.CameraType.Scriptable
								service15:BindToRenderStep("4HubInstaResetCam", Enum.RenderPriority.Camera.Value + 1, function()
									if _G.__4HubDead then
										pcall(function()
											service15:UnbindFromRenderStep("4HubInstaResetCam")
										end)
										return
									end
									pcall(function()
										currentCamera.CFrame = cFrame
									end)
								end)
							end)
							local connection_ = nil
							pcall(function()
								for _, descendant in ipairs(character:GetDescendants()) do
									pcall(handleAction142, descendant)
								end
								connection_ = character.DescendantAdded:Connect(function(descendant)
									pcall(handleAction142, descendant)
								end)
							end)
							local value152 = nil
							local connection_2 = localPlayer19.CharacterAdded:Connect(function(character2)
								value152 = character2
							end)
							local function handleAction143()
								pcall(function()
									humanoid.PlatformStand = false
								end)
								pcall(function()
									humanoid.Sit = false
								end)
								pcall(function()
									humanoid.AutoRotate = true
								end)
							end
							handleAction143()
							for _, descendant in ipairs(character:GetDescendants()) do
								if descendant:IsA("BasePart") then
									pcall(function()
										descendant.Anchored = false
									end)
									pcall(function()
										descendant.CanCollide = false
									end)
								elseif descendant.Name == "SeatWeld" then
									pcall(function()
										descendant:Destroy()
									end)
								end
							end
							local now2 = os.clock()
							local function handleAction144()
								if rootPart and rootPart.Parent then
									return rootPart
								end
								rootPart = humanoid.RootPart or character:FindFirstChild("HumanoidRootPart")
								if rootPart and rootPart.Parent then
									return rootPart
								end
								return nil
							end
							local number29 = os.clock() + number26
							while not value152 and os.clock() < number29 and humanoid.Parent do
								handleAction143()
								pcall(function()
									humanoid.HipHeight = 1e30
								end)
								local value153 = handleAction144()
								if value153 then
									pcall(function()
										value153.Anchored = false
									end)
									pcall(function()
										value153.AssemblyLinearVelocity = Vector3.new(0, 50000, 0)
									end)
									pcall(function()
										value153.Velocity = Vector3.new(0, 50000, 0)
									end)
								end
								service15.Heartbeat:Wait()
							end
							local enabled34 = true
							if enabled32 then
								enabled34 = not value152
							end
							if enabled34 then
								local number30 = -500
								pcall(function()
									number30 = workspace.FallenPartsDestroyHeight
								end)
								local number31 = os.clock() + number28
								while true do
									if not value152 and os.clock() < number31 then
										local part1 = handleAction144()
										if part1 then
											pcall(function()
												part1.CFrame = CFrame.new(0, number30 - 500, 0)
											end)
											pcall(function()
												part1.AssemblyLinearVelocity = Vector3.new(0, -number27, 0)
											end)
											service15.Heartbeat:Wait()
											continue
										end
									end
									break
								end
							end
							while not value152 and os.clock() - now2 < 6 do
								if humanoid.Parent then
									pcall(function()
										humanoid.Health = 0
									end)
									pcall(function()
										humanoid:ChangeState(Enum.HumanoidStateType.Dead)
									end)
								end
								if character.Parent then
									pcall(function()
										character:BreakJoints()
									end)
								end
								task.wait(0.1)
							end
							pcall(function()
								connection_2:Disconnect()
							end)
							if connection_ then
								pcall(function()
									connection_:Disconnect()
								end)
							end
							pcall(function()
								service15:UnbindFromRenderStep("4HubInstaResetCam")
							end)
							pcall(function()
								currentCamera.CameraType = cameraType == Enum.CameraType.Scriptable and Enum.CameraType.Custom or cameraType
								if value152 then
									local humanoid2 = value152:FindFirstChildOfClass("Humanoid") or value152:WaitForChild("Humanoid", 5)
									if humanoid2 then
										currentCamera.CameraSubject = humanoid2
									end
								end
							end)
							_G._FH_LAUNCHING = false
							enabled33 = false
						end)
					end
				end
			end
			_G.4HubKeys = _G.4HubKeys or {}
			do
				local function handleAction145(argument186)
					return argument186 and argument186.Name or "None"
				end
				handleAction137 = function(argument187, argument188)
					_G.4HubKeys[argument187] = handleAction145(argument188)
					if _G.__4HubAPRefresh then
						_G.__4HubAPRefresh()
					end
				end
			end
			do
				local y = Enum.KeyCode.Y
				createKeybindToggle(Keybinds, "Kick", handleAction86(), true, y, function()
					_G.__4HubKick()
				end, function(argument189)
					handleAction137("Kick", argument189)
				end)
			end
			do
				local k = Enum.KeyCode.K
				createKeybindToggle(Keybinds, "Rejoin", handleAction86(), true, k, function()
					_G.__4HubRejoin()
				end, function(argument190)
					handleAction137("Rejoin", argument190)
				end)
			end
			do
				local h = Enum.KeyCode.H
				createKeybindToggle(Keybinds, "Float", handleAction86(), true, h, function()
					if _G.__4HubFloatToggle then
						_G.__4HubFloatToggle.Set(not _G.__4HubFloatToggle.Get())
					end
				end, function(argument191)
					handleAction137("Float", argument191)
				end)
			end
			do
				local entry56 = true
				local n1 = Enum.KeyCode.N
				createKeybindToggle(Keybinds, "Ragdoll", handleAction86(), entry56, n1, function()
					if _G.__4HubRagdollSelf then
						_G.__4HubRagdollSelf()
					end
				end, function(argument192)
					handleAction137("Ragdoll", argument192)
				end)
			end
			do
				local g = Enum.KeyCode.G
				createKeybindToggle(Keybinds, "Clone", handleAction86(), true, g, function()
					if _G.__4HubCloneSwitch then
						_G.__4HubCloneSwitch()
					end
				end)
			end
			do
				local q = Enum.KeyCode.Q
				createKeybindToggle(Keybinds, "Carpet Speed", handleAction86(), true, q, function()
					if carpetSpeed then
						carpetSpeed.Set(not carpetSpeed.Get())
					end
				end)
			end
			do
				local v101 = Enum.KeyCode.V
				createKeybindToggle(Keybinds, "Steal Speed Keybind", handleAction86(), true, v101, function()
					if _G.__4HubToggleWalkSpeed then
						_G.__4HubToggleWalkSpeed()
					elseif setWalkSpeedEnabled and WalkSpeedState then
						setWalkSpeedEnabled(not WalkSpeedState.enabled)
					end
				end)
			end
			do
				local entry57 = true
				local x = Enum.KeyCode.X
				createKeybindToggle(Keybinds, "Reset", handleAction86(), entry57, x, function()
					_G.__4HubReset()
				end, function(argument193)
					handleAction137("Reset", argument193)
				end)
			end
			do
				local m = Enum.KeyCode.M
				createKeybindToggle(Keybinds, "Click To AP", handleAction86(), true, m, function()
					if _G.__4HubToggleClickAP then
						_G.__4HubToggleClickAP()
					end
				end)
			end
			do
				local entry58 = true
				createKeybindToggle(Keybinds, "Spam Base Owner", handleAction86(), entry58, nil, function()
					if _G.__4HubSpamBaseOwner then
						_G.__4HubSpamBaseOwner()
					end
				end)
			end
			do
				local p = Enum.KeyCode.P
				createKeybindToggle(Keybinds, "Proximity AP", handleAction86(), true, p, function()
					if _G.__4HubToggleProximityAP then
						_G.__4HubToggleProximityAP()
					end
				end)
			end
			do
				local j = Enum.KeyCode.J
				createKeybindToggle(Keybinds, "Job Joiner", handleAction86(), true, j, function()
					if _G.__4HubJobJoinerToggle then
						_G.__4HubJobJoinerToggle.Set(not _G.__4HubJobJoinerToggle.Get())
					end
				end)
			end
			do
				local leftControl = Enum.KeyCode.LeftControl
				createKeybindToggle(Keybinds, "Menu Toggle", handleAction86(), false, leftControl, nil, function(argument194)
					value3 = argument194
					handleAction137("Menu", argument194)
				end)
			end
		end
		do
			local players11 = game:GetService("Players")
			TweenService2 = game:GetService("TweenService")
			game:GetService("UserInputService")
			service14 = game:GetService("RunService")
			localPlayer18 = players11.LocalPlayer
		end
		do
			local TweenService3, UserInputService, TeleportService, localPlayer21
			do
				local options26 = {
					Black = Color3.fromRGB(6, 8, 14),
					BgDark = Color3.fromRGB(9, 13, 24),
					BgPanel = Color3.fromRGB(13, 20, 38),
					Stroke = Color3.fromRGB(30, 46, 82),
					DarkBlue = Color3.fromRGB(18, 38, 78),
					LightBlue = Color3.fromRGB(92, 165, 255),
					BlueLine = Color3.fromRGB(60, 120, 220),
					White = Color3.fromRGB(255, 255, 255),
					TextDim = Color3.fromRGB(150, 165, 195),
					ToggleOff = Color3.fromRGB(40, 52, 82),
				}
				local gothamBold2 = Enum.Font.GothamBold
				local function createUICorner2(parent, argument195)
					local uiCorner = Instance.new("UICorner")
					uiCorner.CornerRadius = UDim.new(0, argument195 or 8)
					uiCorner.Parent = parent
					return uiCorner
				end
				local function createUIStroke2(parent, color, thickness)
					local uiStroke2 = Instance.new("UIStroke")
					uiStroke2.Color = color or options26.Stroke
					uiStroke2.Thickness = thickness or 1
					uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					uiStroke2.Parent = parent
					return uiStroke2
				end
				local value154 = nil
				local function handleAction146()
					if value154 then
						return
					end
					local semiInvisibilityUI = localPlayer18:FindFirstChild("PlayerGui") and localPlayer18.PlayerGui:FindFirstChild("SemiInvisibilityUI")
					if semiInvisibilityUI then
						semiInvisibilityUI:Destroy()
					end
					local screenGui2 = Instance.new("ScreenGui")
					screenGui2.Name = "SemiInvisibilityUI"
					screenGui2.ResetOnSpawn = false
					screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
					screenGui2.IgnoreGuiInset = true
					screenGui2.DisplayOrder = 100001
					screenGui2.Parent = localPlayer18:WaitForChild("PlayerGui")
					value154 = screenGui2
					local udim22 = UDim2.fromOffset(250, 108)
					local frame5 = Instance.new("Frame")
					frame5.Name = "Window"
					frame5.AnchorPoint = Vector2.new(0.5, 0.5)
					frame5.Size = udim22
					frame5.Position = UDim2.new(0.5, 0, 0.5, 0)
					frame5.BackgroundColor3 = options26.BgDark
					frame5.BorderSizePixel = 0
					frame5.ClipsDescendants = true
					frame5.Active = true
					frame5.Parent = screenGui2
					createUICorner2(frame5, 12)
					restoreWindowPosition("JobIdWindow", frame5)
					local uiGradient = Instance.new("UIGradient")
					uiGradient.Rotation = 90
					local new = ColorSequenceKeypoint.new
					local bgDark = options26.BgDark
					uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, options26.Black), new(1, bgDark) })
					uiGradient.Parent = frame5
					local instance4 = Instance.new("UIStroke")
					instance4.Thickness = 2.5
					instance4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					instance4.Parent = frame5
					local uiGradient2 = Instance.new("UIGradient")
					local colorSequence = ColorSequence.new
					local items40 = {}
					local value155 = ColorSequenceKeypoint.new(0, options26.DarkBlue)
					local value156 = ColorSequenceKeypoint.new(0.5, options26.LightBlue)
					local new2 = ColorSequenceKeypoint.new
					local darkBlue = options26.DarkBlue
					items40[1] = value155
					items40[2] = value156
					do
						local values = table.pack(new2(1, darkBlue))
						table.move(values, 1, values.n, 3, items40)
					end
					uiGradient2.Color = colorSequence(items40)
					uiGradient2.Parent = instance4
					local connection_ = nil
					connection_ = service14.RenderStepped:Connect(function()
						if not frame5.Parent then
							connection_:Disconnect()
							return
						end
						uiGradient2.Rotation = tick() * 90 % 360
					end)
					local frame6 = Instance.new("Frame")
					frame6.Name = "Header"
					frame6.Size = UDim2.new(1, 0, 0, 42)
					frame6.BackgroundTransparency = 1
					frame6.Parent = frame5
					local textButton2 = Instance.new("TextButton")
					textButton2.Name = "Minimise"
					textButton2.AnchorPoint = Vector2.new(1, 0)
					textButton2.Position = UDim2.new(1, -12, 0, 11)
					textButton2.Size = UDim2.fromOffset(20, 20)
					textButton2.BackgroundColor3 = options26.DarkBlue
					textButton2.AutoButtonColor = false
					textButton2.Font = gothamBold2
					textButton2.Text = "–"
					textButton2.TextColor3 = options26.LightBlue
					textButton2.TextSize = 18
					textButton2.ZIndex = 6
					textButton2.Parent = frame6
					createUICorner2(textButton2, 6)
					createUIStroke2(textButton2, options26.LightBlue, 1)
					local textLabel = Instance.new("TextLabel")
					textLabel.Name = "Title"
					textLabel.Size = UDim2.new(1, -80, 0, 42)
					textLabel.Position = UDim2.fromOffset(40, 0)
					textLabel.BackgroundTransparency = 1
					textLabel.Font = gothamBold2
					textLabel.Text = "Job ID Copier"
					textLabel.TextColor3 = options26.White
					textLabel.TextSize = 16
					textLabel.TextXAlignment = Enum.TextXAlignment.Center
					textLabel.TextYAlignment = Enum.TextYAlignment.Center
					textLabel.Parent = frame6
					local frame7 = Instance.new("Frame")
					frame7.Name = "HeaderLine"
					frame7.Size = UDim2.new(1, -28, 0, 2)
					frame7.Position = UDim2.new(0, 14, 0, 40)
					frame7.BackgroundColor3 = options26.BlueLine
					frame7.BorderSizePixel = 0
					frame7.Parent = frame5
					createUICorner2(frame7, 1)
					local uiGradient3 = Instance.new("UIGradient")
					local colorSequence2 = ColorSequence.new
					local items41 = {}
					local value157 = ColorSequenceKeypoint.new(0, options26.DarkBlue)
					local value158 = ColorSequenceKeypoint.new(0.5, options26.LightBlue)
					local new3 = ColorSequenceKeypoint.new
					local darkBlue2 = options26.DarkBlue
					items41[1] = value157
					items41[2] = value158
					do
						local values = table.pack(new3(1, darkBlue2))
						table.move(values, 1, values.n, 3, items41)
					end
					uiGradient3.Color = colorSequence2(items41)
					uiGradient3.Parent = frame7
					local textButton3 = Instance.new("TextButton")
					textButton3.Name = "CopyJobId"
					textButton3.AnchorPoint = Vector2.new(0.5, 0)
					textButton3.Position = UDim2.new(0.5, 0, 0, 52)
					textButton3.Size = UDim2.fromOffset(222, 40)
					textButton3.BackgroundColor3 = options26.DarkBlue
					textButton3.AutoButtonColor = false
					textButton3.Font = gothamBold2
					textButton3.Text = "Copy Job ID"
					textButton3.TextColor3 = options26.White
					textButton3.TextSize = 14
					textButton3.Parent = frame5
					createUICorner2(textButton3, 8)
					createUIStroke2(textButton3, options26.Stroke, 1)
					local udim23 = UDim2.fromOffset(222, 40)
					local function handleAction147(argument196)
						local writeClipboard = setclipboard or toclipboard or syn and syn.write_clipboard or Clipboard and Clipboard.set or writeclipboard
						if writeClipboard then
							pcall(writeClipboard, argument196)
							return true
						end
						return false
					end
					local function handleAction148()
						local tween = TweenService2:Create(textButton3, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(210, 34) })
						tween:Play()
						tween.Completed:Once(function()
							local options27 = { Size = udim23 }
							TweenService2:Create(textButton3, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), options27):Play()
						end)
					end
					local number32 = 0
					local function handleAction149(argument197)
						number32 += 1
						local number321 = number32
						textButton3.Text = argument197 and "Copied!" or "Copy failed"
						task.delay(1.1, function()
							if number321 == number32 then
								textButton3.Text = "Copy Job ID"
							end
						end)
					end
					textButton3.MouseButton1Click:Connect(function()
						handleAction148()
						local text9 = tostring(game.JobId)
						local value159 = handleAction147(text9)
						handleAction149(value159)
					end)
					if _G.__4HubRegisterDrag then
						_G.__4HubRegisterDrag(frame5, frame6, "JobIdWindow", UDim2.new(0.5, 0, 0.5, 0))
					end
					local enabled35 = false
					local enabled36 = false
					local tweenInfo = TweenInfo.new(0.26, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
					local function handleAction150(argument198)
						if enabled36 or argument198 == enabled35 then
							return
						end
						enabled36 = true
						enabled35 = argument198
						local udim24 = argument198 and UDim2.fromOffset(250, 42) or udim22
						frame7.Visible = not argument198
						textButton2.Text = argument198 and "+" or "–"
						local tween = TweenService2:Create(frame5, tweenInfo, { Size = udim24 })
						tween:Play()
						tween.Completed:Once(function()
							if not argument198 then
								frame7.Visible = true
							end
							enabled36 = false
						end)
					end
					textButton2.MouseButton1Click:Connect(function()
						handleAction150(not enabled35)
					end)
					frame5.Size = UDim2.fromOffset(0, 0)
					instance4.Transparency = 1
					TweenService2:Create(frame5, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = udim22 }):Play()
					TweenService2:Create(instance4, TweenInfo.new(0.4), { Transparency = 0 }):Play()
				end
				handleAction134 = function(argument199)
					if argument199 then
						handleAction146()
					else
						if value154 then
							value154:Destroy()
						end
						value154 = nil
					end
				end
			end
			do
				local players12 = game:GetService("Players")
				TweenService3 = game:GetService("TweenService")
				UserInputService = game:GetService("UserInputService")
				game:GetService("RunService")
				TeleportService = game:GetService("TeleportService")
				localPlayer21 = players12.LocalPlayer
			end
			local playerGui_ = localPlayer21:WaitForChild("PlayerGui")
			local options28 = {
				Black = Color3.fromRGB(6, 8, 14),
				BgDark = Color3.fromRGB(9, 13, 24),
				BgPanel = Color3.fromRGB(13, 20, 38),
				Stroke = Color3.fromRGB(30, 46, 82),
				DarkBlue = Color3.fromRGB(18, 38, 78),
				LightBlue = Color3.fromRGB(92, 165, 255),
				White = Color3.fromRGB(255, 255, 255),
				TextDim = Color3.fromRGB(150, 165, 195),
				Green = Color3.fromRGB(100, 220, 130),
				Red = Color3.fromRGB(235, 90, 100),
			}
			local gothamMedium2 = Enum.Font.GothamMedium
			local gothamBlack = Enum.Font.GothamBlack
			local function createUICorner2(parent, argument200)
				local uiCorner = Instance.new("UICorner")
				uiCorner.CornerRadius = UDim.new(0, argument200 or 8)
				uiCorner.Parent = parent
				return uiCorner
			end
			local function handleAction151(parent, color, thickness, transparency)
				local instance4 = Instance.new("UIStroke")
				instance4.Color = color or options28.Stroke
				instance4.Thickness = thickness or 1
				instance4.Transparency = transparency or 0
				instance4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				instance4.Parent = parent
				return instance4
			end
			local function handleAction152(argument201, argument202)
				local jjNotif = playerGui_:FindFirstChild("JJNotif")
				if jjNotif then
					jjNotif:Destroy()
				end
				local screenGui2 = Instance.new("ScreenGui", playerGui_)
				screenGui2.Name = "JJNotif"
				screenGui2.ResetOnSpawn = false
				local frame5 = Instance.new("Frame", screenGui2)
				frame5.Size = UDim2.new(0, 240, 0, 46)
				frame5.Position = UDim2.new(0.5, -120, 0, 70)
				frame5.BackgroundColor3 = options28.BgDark
				frame5.BorderSizePixel = 0
				createUICorner2(frame5, 9)
				handleAction151(frame5, options28.LightBlue, 1, 0.2)
				local frame6 = Instance.new("Frame", frame5)
				frame6.Size = UDim2.new(0, 3, 1, -12)
				frame6.Position = UDim2.new(0, 5, 0, 6)
				frame6.BackgroundColor3 = options28.LightBlue
				frame6.BorderSizePixel = 0
				createUICorner2(frame6, 2)
				local textLabel = Instance.new("TextLabel", frame5)
				textLabel.Size = UDim2.new(1, -22, 0, 16)
				textLabel.Position = UDim2.new(0, 14, 0, 6)
				textLabel.BackgroundTransparency = 1
				textLabel.Text = tostring(argument201):upper()
				textLabel.Font = gothamBlack
				textLabel.TextSize = 11
				textLabel.TextColor3 = options28.LightBlue
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				local textLabel2 = Instance.new("TextLabel", frame5)
				textLabel2.Size = UDim2.new(1, -22, 0, 14)
				textLabel2.Position = UDim2.new(0, 14, 0, 24)
				textLabel2.BackgroundTransparency = 1
				textLabel2.Text = tostring(argument202)
				textLabel2.Font = gothamMedium2
				textLabel2.TextSize = 10
				textLabel2.TextColor3 = options28.TextDim
				textLabel2.TextXAlignment = Enum.TextXAlignment.Left
				task.delay(2.2, function()
					if screenGui2 then
						screenGui2:Destroy()
					end
				end)
			end
			value145 = nil
			entry54 = false
			handleAction136 = function()
				if value145 then
					return
				end
				local jobJoinerUI = playerGui_:FindFirstChild("JobJoinerUI")
				if jobJoinerUI then
					jobJoinerUI:Destroy()
				end
				local screenGui2 = Instance.new("ScreenGui")
				screenGui2.Name = "JobJoinerUI"
				screenGui2.ResetOnSpawn = false
				screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				screenGui2.IgnoreGuiInset = true
				screenGui2.Parent = playerGui_
				value145 = screenGui2
				local udim22 = UDim2.fromOffset(410, 48)
				local frame5 = Instance.new("Frame")
				frame5.AnchorPoint = Vector2.new(0.5, 0.5)
				frame5.Size = udim22
				frame5.Position = UDim2.new(0.5, 0, 1, -190)
				frame5.BackgroundColor3 = options28.BgDark
				frame5.BorderSizePixel = 0
				frame5.ClipsDescendants = true
				frame5.Active = true
				frame5.Parent = screenGui2
				createUICorner2(frame5, 10)
				restoreWindowPosition("JobJoinerBar", frame5)
				local uiGradient = Instance.new("UIGradient", frame5)
				uiGradient.Rotation = 90
				local new = ColorSequenceKeypoint.new
				local bgDark = options28.BgDark
				uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, options28.Black), new(1, bgDark) })
				local uiStroke2 = Instance.new("UIStroke", frame5)
				uiStroke2.Thickness = 2.5
				uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				local instance4 = Instance.new("UIGradient", uiStroke2)
				local colorSequence = ColorSequence.new
				local items42 = {}
				local value160 = ColorSequenceKeypoint.new(0, options28.DarkBlue)
				local value161 = ColorSequenceKeypoint.new(0.5, options28.LightBlue)
				local new2 = ColorSequenceKeypoint.new
				local entry59 = 1
				local darkBlue = options28.DarkBlue
				items42[1] = value160
				items42[2] = value161
				do
					local values = table.pack(new2(entry59, darkBlue))
					table.move(values, 1, values.n, 3, items42)
				end
				instance4.Color = colorSequence(items42)
				_G.__4HubSpin(instance4, 90, function()
					return frame5.Parent ~= nil
				end)
				local uiPadding = Instance.new("UIPadding", frame5)
				uiPadding.PaddingLeft = UDim.new(0, 8)
				uiPadding.PaddingRight = UDim.new(0, 8)
				local uiListLayout = Instance.new("UIListLayout", frame5)
				uiListLayout.FillDirection = Enum.FillDirection.Horizontal
				uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				uiListLayout.Padding = UDim.new(0, 7)
				local function createTextBox2(placeholderText, argument203, text, layoutOrder)
					local textBox = Instance.new("TextBox")
					textBox.Size = UDim2.new(0, argument203, 0, 30)
					textBox.LayoutOrder = layoutOrder
					textBox.BackgroundColor3 = options28.BgPanel
					textBox.Text = text or ""
					textBox.PlaceholderText = placeholderText
					textBox.PlaceholderColor3 = options28.TextDim
					textBox.Font = gothamMedium2
					textBox.TextSize = 12
					textBox.TextColor3 = options28.White
					textBox.ClearTextOnFocus = false
					textBox.Parent = frame5
					createUICorner2(textBox, 6)
					local value162 = handleAction151(textBox, options28.Stroke, 1)
					textBox.Focused:Connect(function()
						local options29 = { Color = options28.LightBlue }
						TweenService3:Create(value162, TweenInfo.new(0.15), options29):Play()
					end)
					textBox.FocusLost:Connect(function()
						local options30 = { Color = options28.Stroke }
						TweenService3:Create(value162, TweenInfo.new(0.15), options30):Play()
					end)
					return textBox
				end
				local function createTextButton2(text, argument204, backgroundColor3, layoutOrder)
					local textButton2 = Instance.new("TextButton")
					textButton2.Size = UDim2.new(0, argument204, 0, 30)
					textButton2.LayoutOrder = layoutOrder
					textButton2.BackgroundColor3 = backgroundColor3
					textButton2.AutoButtonColor = false
					textButton2.Font = gothamBlack
					textButton2.Text = text
					textButton2.TextColor3 = options28.White
					textButton2.TextSize = 12
					textButton2.Parent = frame5
					createUICorner2(textButton2, 6)
					local value163 = handleAction151(textButton2, backgroundColor3, 1.5, 0.3)
					textButton2.MouseEnter:Connect(function()
						TweenService3:Create(value163, TweenInfo.new(0.15), { Transparency = 0 }):Play()
					end)
					textButton2.MouseLeave:Connect(function()
						TweenService3:Create(value163, TweenInfo.new(0.15), { Transparency = 0.3 }):Play()
					end)
					return textButton2
				end
				local function createTextBox3(text, argument205, text2, layoutOrder)
					local frame6 = Instance.new("Frame")
					frame6.Size = UDim2.new(0, argument205, 0, 42)
					frame6.LayoutOrder = layoutOrder
					frame6.BackgroundTransparency = 1
					frame6.Parent = frame5
					local textLabel = Instance.new("TextLabel")
					textLabel.Size = UDim2.new(1, 0, 0, 11)
					textLabel.BackgroundTransparency = 1
					textLabel.Text = text
					textLabel.Font = gothamBlack
					textLabel.TextSize = 10
					textLabel.TextColor3 = options28.LightBlue
					textLabel.TextXAlignment = Enum.TextXAlignment.Center
					textLabel.Parent = frame6
					local textBox = Instance.new("TextBox")
					textBox.Position = UDim2.new(0, 0, 0, 13)
					textBox.Size = UDim2.new(1, 0, 0, 29)
					textBox.BackgroundColor3 = options28.BgPanel
					textBox.Text = text2 or ""
					textBox.PlaceholderText = text
					textBox.PlaceholderColor3 = options28.TextDim
					textBox.Font = gothamMedium2
					textBox.TextSize = 12
					textBox.TextColor3 = options28.White
					textBox.ClearTextOnFocus = false
					textBox.Parent = frame6
					createUICorner2(textBox, 6)
					local value164 = handleAction151(textBox, options28.Stroke, 1)
					textBox.Focused:Connect(function()
						local options31 = { Color = options28.LightBlue }
						TweenService3:Create(value164, TweenInfo.new(0.15), options31):Play()
					end)
					textBox.FocusLost:Connect(function()
						local options32 = { Color = options28.Stroke }
						TweenService3:Create(value164, TweenInfo.new(0.15), options32):Play()
					end)
					return textBox
				end
				local join = createTextButton2("JOIN", 56, options28.DarkBlue, 1)
				join.TextColor3 = options28.Green
				local jobId = createTextBox2("Job ID", 150, "", 2)
				jobId.TextTruncate = Enum.TextTruncate.AtEnd
				local clear = createTextButton2("CLEAR", 52, options28.BgPanel, 3)
				local Attempts = createTextBox3("Attempts", 58, "2000", 4)
				local Delay = createTextBox3("Delay", 50, "0.01", 5)
				join.MouseButton1Click:Connect(function()
					if entry54 then
						entry54 = false
						join.Text = "JOIN"
						join.TextColor3 = options28.Green
						join.BackgroundColor3 = options28.DarkBlue
						handleAction152("JOINER", "Cancelled")
						return
					end
					local text10 = jobId.Text:gsub("%s+", "")
					local num = tonumber(Attempts.Text) or 10
					local number33 = tonumber(Delay.Text) or 0.5
					if text10 == "" or #text10 < 5 then
						handleAction152("ERROR", "Invalid Job ID")
						return
					end
					entry54 = true
					join.Text = "STOP"
					join.TextColor3 = options28.White
					join.BackgroundColor3 = options28.Red
					task.spawn(function()
						for i = 1, num do
							if entry54 then
								handleAction152("JOINING", string.format("Attempt %d/%d…", i, num))
								pcall(function()
									TeleportService:TeleportToPlaceInstance(game.PlaceId, text10, localPlayer21)
								end)
								task.wait(number33)
								continue
							end
							break
						end
						entry54 = false
						if join and join.Parent then
							join.Text = "JOIN"
							join.TextColor3 = options28.Green
							join.BackgroundColor3 = options28.DarkBlue
						end
					end)
				end)
				clear.MouseButton1Click:Connect(function()
					jobId.Text = ""
				end)
				frame5.InputBegan:Connect(function(input)
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
						return
					end
					local position = input.Position
					local position2 = frame5.Position
					local connection_ = nil
					local connection_2 = UserInputService.InputChanged:Connect(function(input2)
						if input2.UserInputType == Enum.UserInputType.MouseMovement or input2.UserInputType == Enum.UserInputType.Touch then
							local number34 = input2.Position - position
							frame5.Position = UDim2.new(position2.X.Scale, position2.X.Offset + number34.X, position2.Y.Scale, position2.Y.Offset + number34.Y)
						end
					end)
					connection_ = UserInputService.InputEnded:Connect(function(input2)
						if input2 == input or input2.UserInputType == Enum.UserInputType.MouseButton1 or input2.UserInputType == Enum.UserInputType.Touch then
							if connection_2 then
								connection_2:Disconnect()
							end
							if connection_ then
								connection_:Disconnect()
							end
							saveWindowPosition("JobJoinerBar", frame5)
						end
					end)
				end)
				frame5.Size = UDim2.fromOffset(0, 48)
				uiStroke2.Transparency = 1
				TweenService3:Create(frame5, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = udim22 }):Play()
				local options33 = { Transparency = 0 }
				TweenService3:Create(uiStroke2, TweenInfo.new(0.4), options33):Play()
			end
		end
	end
	local handleAction153
	handleAction153 = function(argument206)
		if argument206 then
			handleAction136()
		else
			entry54 = false
			if value145 then
				value145:Destroy()
			end
			value145 = nil
		end
	end
	do
		local entry60 = 0
		handleAction135 = function()
			entry60 += 1
			return entry60
		end
	end
	do
		local lightBlue = themeColors.LightBlue
		local darkBlue = themeColors.DarkBlue
		local blueLine = themeColors.BlueLine
		local value165 = handleAction135()
		createSection(Settings, "Alerts", lightBlue, darkBlue, blueLine, value165)
	end
	createToggle(Settings, "Enabled Alerts", handleAction135(), false, function(argument207)
		_G.__4HubEnabledAlerts = argument207 and true or false
	end)
	createToggle(Settings, "Enable Brainrot Notification", handleAction135(), false, function(argument208)
		_G.__4HubBrainrotNotif = argument208 and true or false
	end)
	do
		local AlertSoundId = getSavedChoice("AlertSoundId") or "102483636290461"
		_G.__4HubAlertSoundId = AlertSoundId
		local sound = Instance.new("Sound")
		sound.Name = "RiftAlertSound"
		sound.Volume = 1
		sound.SoundId = "rbxassetid://" .. AlertSoundId
		sound.Parent = screenGui
		createTextBox(Settings, "Alert Sound ID", handleAction135(), AlertSoundId, true, function(argument209)
			local num = tonumber(argument209)
			if num and num > 0 then
				_G.__4HubAlertSoundId = tostring(num)
				saveChoice("AlertSoundId", tostring(num))
				sound.SoundId = "rbxassetid://" .. num
				pcall(function()
					sound:Play()
				end)
			end
		end)
	end
	do
		local value166 = handleAction135()
		createLabel(Settings, 2, value166)
	end
	do
		local lightBlue = themeColors.LightBlue
		local darkBlue = themeColors.DarkBlue
		local blueLine = themeColors.BlueLine
		local value167 = handleAction135()
		createSection(Settings, "Job Joiner", lightBlue, darkBlue, blueLine, value167)
	end
	_G.__4HubJobJoinerToggle = createToggle(Settings, "Job ID Joiner", handleAction135(), false, function(argument210)
		handleAction153(argument210)
	end)
end
local enabled37, handleAction154, handleAction155, textButton2
do
	do
		local guiScaling
		do
			local entry61 = false
			createToggle(Settings, "Job ID Copier", handleAction135(), entry61, function(argument212)
				handleAction134(argument212)
			end)
		end
		saveToggle("Search Small Server (requires 0 rebirths)", false)
		createToggle(Settings, "Search Small Server (requires 0 rebirths)", handleAction135(), false, function(argument213)
			if not argument213 then
				return
			end
			task.spawn(function()
				local TeleportService = game:GetService("TeleportService")
				local HttpService2 = game:GetService("HttpService")
				local players13 = game:GetService("Players")
				local function handleAction156(argument214)
					local text11 = "https://games.roblox.com/v1/games/96342491571673/servers/Public?sortOrder=Asc&limit=100"
					if argument214 and argument214 ~= "" then
						text11 ..= "&cursor=" .. argument214
					end
					local ok, result = pcall(function()
						return HttpService2:JSONDecode(game:HttpGet(text11))
					end)
					if not ok then
						return nil
					end
					return result
				end
				local function handleAction157()
					local text12 = ""
					local value168 = nil
					local value1681
					while true do
						local value169 = handleAction156(text12)
						if not value169 or not value169.data then
							value1681 = value168
							break
						end
						for _, value170 in ipairs(value169.data) do
							local playing = value170.playing
							if playing ~= nil and playing <= 2 then
								if playing == 1 then
									return value170
								end
								if value168 == nil or playing < value168.playing then
									value168 = value170
								end
							end
						end
						text12 = value169.nextPageCursor or ""
						if text12 == "" or text12 == nil then
							value1681 = value168
							break
						end
					end
					return value1681
				end
				local value171 = handleAction157()
				if value171 then
					pcall(function()
						TeleportService:TeleportToPlaceInstance(96342491571673, value171.id, players13.LocalPlayer)
					end)
				end
			end)
		end)
		do
			local value172 = handleAction135()
			createLabel(Settings, 2, value172)
		end
		do
			local lightBlue = themeColors.LightBlue
			local darkBlue = themeColors.DarkBlue
			local blueLine = themeColors.BlueLine
			local value173 = handleAction135()
			createSection(Settings, "UI Controls", lightBlue, darkBlue, blueLine, value173)
		end
		guiScaling = nil
		do
			local darkBlue = themeColors.DarkBlue
			createTextButton(Settings, "Reset GUI", handleAction135(), "Reset", darkBlue, function()
				frame.Position = UDim2.new(0.5, 0, 0.5, 0)
				if _G.__4HubResetUIs then
					_G.__4HubResetUIs()
				end
				if guiScaling then
					guiScaling.Set(100)
				end
				if _G.__4HubSetGuiScale then
					_G.__4HubSetGuiScale(100)
				end
			end)
		end
		_G.__4HubMainWindow = frame
		_G.__4HubTranspExclude = _G.__4HubTranspExclude or setmetatable({}, { __mode = "k" })
		_G.__4HubTranspExclude[frame] = true
		if _G.__4HubSetGuiScale then
			_G.__4HubSetGuiScale(_G.__4HubGuiScaleCur or 100)
			task.delay(1, function()
				pcall(function()
					_G.__4HubSetGuiScale(_G.__4HubGuiScaleCur or 100)
				end)
			end)
			task.delay(3, function()
				pcall(function()
					_G.__4HubSetGuiScale(_G.__4HubGuiScaleCur or 100)
				end)
			end)
		end
		createToggle(Settings, "GUI Notifications", handleAction135(), true, function(argument215)
			_G.__4HubNotifEnabled = argument215 and true or false
		end)
		do
			local options34 = {
				min = 50,
				max = 105,
				default = 100,
				decimals = 0,
				suffix = "%",
			}
			guiScaling = createSlider(Settings, "GUI Scaling", handleAction135(), options34, function(argument216)
				if _G.__4HubSetGuiScale then
					_G.__4HubSetGuiScale(argument216)
				end
			end)
		end
		do
			local entry62 = 4
			local value174 = handleAction135()
			createLabel(Settings, entry62, value174)
		end
	end
	local color = Color3.fromRGB(224, 176, 32)
	local color2 = Color3.fromRGB(190, 40, 48)
	local textControl1 = nil
	local function handleAction158()
		4HubLocked = not 4HubLocked
		_G.__4HubLocked = 4HubLocked
		if 4HubLocked then
			textControl1.Text = "🔓  Unlock GUI"
			textControl1.BackgroundColor3 = color2
		else
			textControl1.Text = "🔒  Lock GUI"
			textControl1.BackgroundColor3 = color
		end
	end
	textControl1 = handleAction
	textControl1 = textControl1(Settings, "🔒  Lock GUI", handleAction135(), color, handleAction158)
end
do
	local value175 = handleAction135()
	createLabel(Settings, 6, value175)
end
selectTab("Main")
do
	local ok, result = pcall(function()
		local TweenService2 = game:GetService("TweenService")
		local UserInputService = game:GetService("UserInputService")
		local players14 = game:GetService("Players")
		local playerGui_ = players14.LocalPlayer:WaitForChild("PlayerGui")
		local items43 = {
			{ "rocket", "Rocket" },
			{ "balloon", "Balloon" },
			{ "jail", "Jail" },
			{ "ragdoll", "Ragdoll" },
			{ "morph", "Morph" },
			{ "inverse", "Inverse" },
			{ "tiny", "Tiny" },
			{ "jumpscare", "Jumpscare" },
		}
		local items44 = {}
		for _, value176 in ipairs(items43) do
			items44[value176[1]] = value176[2]
		end
		local items45 = {}
		for _, value177 in ipairs(items43) do
			items45[#items45 + 1] = value177[1]
		end
		local function handleAction159(argument217)
			local value178 = getSavedChoice("Order_" .. argument217)
			if type(value178) == "string" and value178 ~= "" then
				local ok, result = pcall(function()
					return HttpService:JSONDecode(value178)
				end)
				if ok and type(result) == "table" and #result == #items45 then
					return result
				end
			end
			local items46 = {}
			for i, value179 in ipairs(items45) do
				items46[i] = value179
			end
			return items46
		end
		local function handleAction160(argument218, argument219)
			pcall(function()
				saveChoice("Order_" .. argument218, HttpService:JSONEncode(argument219))
			end)
		end
		_G.__4HubClickOrder = handleAction159("Click")
		_G.__4HubProxOrder = handleAction159("Prox")
		_G.__4HubSpamOrder = handleAction159("Spam")
		_G.__4HubSpamMode = getSavedChoice("SpamMode") == "Single" and "Single" or "Full"
		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "4HubAPConfig"
		screenGui2.ResetOnSpawn = false
		screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui2.IgnoreGuiInset = true
		screenGui2.DisplayOrder = 100002
		screenGui2.Parent = playerGui_
		_G.__4HubCloseAPConfigs = function(argument220)
			for _, child in ipairs(screenGui2:GetChildren()) do
				if child:IsA("Frame") and child ~= argument220 then
					child.Visible = false
				end
			end
		end
		local function handleAction161(text, argument221, argument222, argument223, argument224)
			local frame5 = Instance.new("Frame")
			frame5.AnchorPoint = Vector2.new(0.5, 0.5)
			frame5.Position = UDim2.new(0.5, 0, 0.5, 0)
			frame5.Size = UDim2.fromOffset(248, 0)
			frame5.AutomaticSize = Enum.AutomaticSize.Y
			frame5.BackgroundColor3 = themeColors.BgDark
			frame5.BorderSizePixel = 0
			frame5.Active = true
			frame5.Visible = false
			frame5.Parent = screenGui2
			createUICorner(frame5, 12)
			local uiScale = Instance.new("UIScale")
			uiScale.Scale = 1
			uiScale.Parent = frame5
			local uiGradient = Instance.new("UIGradient")
			uiGradient.Rotation = 90
			local new = ColorSequenceKeypoint.new
			local bgDark = themeColors.BgDark
			uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, themeColors.Black), new(1, bgDark) })
			uiGradient.Parent = frame5
			local uiStroke2 = Instance.new("UIStroke")
			uiStroke2.Thickness = 2.5
			uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uiStroke2.Parent = frame5
			local uiGradient2 = Instance.new("UIGradient")
			local colorSequence = ColorSequence.new
			local items47 = {}
			local value180 = ColorSequenceKeypoint.new(0, themeColors.DarkBlue)
			local value181 = ColorSequenceKeypoint.new(0.5, themeColors.LightBlue)
			local new2 = ColorSequenceKeypoint.new
			local darkBlue = themeColors.DarkBlue
			items47[1] = value180
			items47[2] = value181
			do
				local values = table.pack(new2(1, darkBlue))
				table.move(values, 1, values.n, 3, items47)
			end
			uiGradient2.Color = colorSequence(items47)
			uiGradient2.Parent = uiStroke2
			_G.__4HubSpin(uiGradient2, 90, function()
				return frame5.Visible
			end)
			local uiListLayout = Instance.new("UIListLayout")
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.Padding = UDim.new(0, 6)
			uiListLayout.Parent = frame5
			local uiPadding = Instance.new("UIPadding")
			uiPadding.PaddingLeft = UDim.new(0, 10)
			uiPadding.PaddingRight = UDim.new(0, 10)
			uiPadding.PaddingTop = UDim.new(0, 8)
			uiPadding.PaddingBottom = UDim.new(0, 10)
			uiPadding.Parent = frame5
			local frame6 = Instance.new("Frame")
			frame6.Size = UDim2.new(1, 0, 0, 26)
			frame6.BackgroundTransparency = 1
			frame6.Active = true
			frame6.LayoutOrder = 1
			frame6.Parent = frame5
			local instance4 = Instance.new("TextLabel")
			instance4.Position = UDim2.fromOffset(2, 0)
			instance4.Size = UDim2.new(1, -30, 1, 0)
			instance4.BackgroundTransparency = 1
			instance4.Font = gothamBold
			instance4.Text = text
			instance4.TextColor3 = themeColors.White
			instance4.TextSize = 13
			instance4.TextXAlignment = Enum.TextXAlignment.Left
			instance4.Parent = frame6
			local instance5 = Instance.new("TextButton")
			instance5.AnchorPoint = Vector2.new(1, 0)
			instance5.Size = UDim2.fromOffset(18, 18)
			instance5.Position = UDim2.new(1, 0, 0, 4)
			instance5.BackgroundColor3 = themeColors.DarkBlue
			instance5.AutoButtonColor = false
			instance5.Font = gothamBold
			instance5.Text = "X"
			instance5.TextColor3 = themeColors.White
			instance5.TextSize = 11
			instance5.Parent = frame6
			createUICorner(instance5, 5)
			createUIStroke(instance5, themeColors.LightBlue, 1)
			local frame7 = Instance.new("Frame")
			frame7.Size = UDim2.new(1, 0, 0, 2)
			frame7.BackgroundColor3 = themeColors.BlueLine
			frame7.BorderSizePixel = 0
			frame7.LayoutOrder = 2
			frame7.Parent = frame5
			createUICorner(frame7, 1)
			local uiGradient3 = Instance.new("UIGradient")
			local colorSequence2 = ColorSequence.new
			local items48 = {}
			local value182 = ColorSequenceKeypoint.new(0, themeColors.DarkBlue)
			local value183 = ColorSequenceKeypoint.new(0.5, themeColors.LightBlue)
			local new3 = ColorSequenceKeypoint.new
			local entry63 = 1
			local darkBlue2 = themeColors.DarkBlue
			items48[1] = value182
			items48[2] = value183
			do
				local values = table.pack(new3(entry63, darkBlue2))
				table.move(values, 1, values.n, 3, items48)
			end
			uiGradient3.Color = colorSequence2(items48)
			uiGradient3.Parent = frame7
			if argument223 then
				argument223(frame5)
			end
			local number35 = 32
			local number36 = 6
			local color = Color3.fromRGB(26, 104, 60)
			local color2 = Color3.fromRGB(150, 255, 190)
			local color3 = Color3.fromRGB(112, 32, 40)
			local color4 = Color3.fromRGB(255, 148, 158)
			local instance6 = Instance.new("Frame")
			instance6.Size = UDim2.new(1, 0, 0, 0)
			instance6.AutomaticSize = Enum.AutomaticSize.Y
			instance6.BackgroundTransparency = 1
			instance6.LayoutOrder = 50
			instance6.Parent = frame5
			local uiListLayout2 = Instance.new("UIListLayout")
			uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout2.Padding = UDim.new(0, 6)
			uiListLayout2.Parent = instance6
			local items49 = {}
			local enabled38 = false
			local value184 = nil
			local function handleAction162(argument225)
				for i, value185 in ipairs(argument221) do
					if value185 == argument225 then
						return i
					end
				end
				return nil
			end
			local function handleAction163()
				for _, value186 in ipairs(items49) do
					local value187 = handleAction162(value186.cmd)
					if value187 then
						value186.frame.LayoutOrder = value187
						value186.num.Text = tostring(value187)
					end
				end
			end
			local function handleAction164()
				for _, child in ipairs(instance6:GetChildren()) do
					if child:IsA("Frame") then
						child:Destroy()
					end
				end
				items49 = {}
				for i, value188 in ipairs(argument221) do
					local instance7 = Instance.new("Frame")
					instance7.Size = UDim2.new(1, 0, 0, 32)
					instance7.BackgroundColor3 = themeColors.BgPanel
					instance7.BorderSizePixel = 0
					instance7.LayoutOrder = i
					instance7.Parent = instance6
					createUICorner(instance7, 8)
					local value189 = createUIStroke(instance7, themeColors.Stroke, 1)
					local textButton3 = Instance.new("TextButton")
					textButton3.Size = UDim2.new(1, 0, 1, 0)
					textButton3.BackgroundTransparency = 1
					textButton3.Text = ""
					textButton3.AutoButtonColor = false
					textButton3.ZIndex = 1
					textButton3.Parent = instance7
					local textLabel = Instance.new("TextLabel")
					textLabel.AnchorPoint = Vector2.new(0, 0.5)
					textLabel.Position = UDim2.new(0, 7, 0.5, 0)
					textLabel.Size = UDim2.fromOffset(21, 21)
					textLabel.BackgroundColor3 = themeColors.DarkBlue
					textLabel.Font = gothamBold
					textLabel.Text = tostring(i)
					textLabel.TextColor3 = themeColors.LightBlue
					textLabel.TextSize = 11
					textLabel.ZIndex = 2
					textLabel.Parent = instance7
					createUICorner(textLabel, 6)
					createUIStroke(textLabel, themeColors.LightBlue, 1)
					local textLabel2 = Instance.new("TextLabel")
					textLabel2.Position = UDim2.fromOffset(35, 0)
					textLabel2.Size = UDim2.new(1, -98, 1, 0)
					textLabel2.BackgroundTransparency = 1
					textLabel2.Font = gothamBold
					textLabel2.Text = items44[value188] or value188
					textLabel2.TextColor3 = themeColors.White
					textLabel2.TextSize = 12.5
					textLabel2.TextXAlignment = Enum.TextXAlignment.Left
					textLabel2.ZIndex = 2
					textLabel2.Parent = instance7
					local textButton4 = Instance.new("TextButton")
					textButton4.AnchorPoint = Vector2.new(1, 0.5)
					textButton4.Position = UDim2.new(1, -8, 0.5, 0)
					textButton4.Size = UDim2.fromOffset(23, 22)
					textButton4.BackgroundColor3 = color
					textButton4.AutoButtonColor = false
					textButton4.Font = gothamBold
					textButton4.Text = "▲"
					textButton4.TextColor3 = color2
					textButton4.TextSize = 12
					textButton4.ZIndex = 3
					textButton4.Parent = instance7
					createUICorner(textButton4, 6)
					local textButton5 = Instance.new("TextButton")
					textButton5.AnchorPoint = Vector2.new(1, 0.5)
					textButton5.Position = UDim2.new(1, -37, 0.5, 0)
					textButton5.Size = UDim2.fromOffset(23, 22)
					textButton5.BackgroundColor3 = color3
					textButton5.AutoButtonColor = false
					textButton5.Font = gothamBold
					textButton5.Text = "▼"
					textButton5.TextColor3 = color4
					textButton5.TextSize = 12
					textButton5.ZIndex = 3
					textButton5.Parent = instance7
					createUICorner(textButton5, 6)
					local function handleAction165(argument226)
						TweenService2:Create(argument226, TweenInfo.new(0.09), { Size = UDim2.fromOffset(20, 19) }):Play()
						task.delay(0.09, function()
							TweenService2:Create(argument226, TweenInfo.new(0.12), { Size = UDim2.fromOffset(23, 22) }):Play()
						end)
					end
					textButton4.MouseButton1Click:Connect(function()
						local value190 = handleAction162(value188)
						if value190 and value190 > 1 then
							handleAction165(textButton4)
							local argument2211 = argument221
							local number37 = value190 - 1
							local entry64 = argument221[value190]
							argument221[value190] = argument221[value190 - 1]
							argument2211[number37] = entry64
							handleAction160(argument222, argument221)
							handleAction163()
						end
					end)
					textButton5.MouseButton1Click:Connect(function()
						local value191 = handleAction162(value188)
						if value191 and value191 < #argument221 then
							handleAction165(textButton5)
							local argument2212 = argument221
							local number38 = value191 + 1
							local entry65 = argument221[value191]
							argument221[value191] = argument221[value191 + 1]
							argument2212[number38] = entry65
							handleAction160(argument222, argument221)
							handleAction163()
						end
					end)
					textButton3.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							enabled38 = true
							value184 = value188
							for _, value192 in ipairs(items49) do
								local matchesCondition2 = value192.cmd == value188
								value192.frame.BackgroundColor3 = matchesCondition2 and themeColors.DarkBlue or themeColors.BgPanel
								TweenService2:Create(value192.stroke, TweenInfo.new(0.12), { Color = matchesCondition2 and themeColors.LightBlue or themeColors.Stroke }):Play()
							end
						end
					end)
					items49[#items49 + 1] = { frame = instance7, num = textLabel, stroke = value189, cmd = value188 }
				end
			end
			handleAction164()
			UserInputService.InputChanged:Connect(function(input)
				if not enabled38 or not value184 then
					return
				end
				if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				if instance6.AbsoluteSize.X <= 0 then
					return
				end
				local number39 = #argument221
				local number40 = math.clamp(math.floor((input.Position.Y - instance6.AbsolutePosition.Y) / (number35 + number36)) + 1, 1, number39)
				local value193 = handleAction162(value184)
				if value193 and number40 ~= value193 then
					table.remove(argument221, value193)
					table.insert(argument221, number40, value184)
					handleAction163()
				end
			end)
			UserInputService.InputEnded:Connect(function(input)
				if not enabled38 then
					return
				end
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					enabled38 = false
					value184 = nil
					for _, value194 in ipairs(items49) do
						value194.frame.BackgroundColor3 = themeColors.BgPanel
						local options35 = { Color = themeColors.Stroke }
						TweenService2:Create(value194.stroke, TweenInfo.new(0.15), options35):Play()
					end
					handleAction160(argument222, argument221)
				end
			end)
			if argument224 then
				argument224(frame5)
			end
			local enabled39 = nil
			local position = nil
			local position2 = nil
			local connection_ = nil
			local connection_2 = nil
			frame6.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					enabled39 = true
					position = input.Position
					position2 = frame5.Position
					if connection_ then
						connection_:Disconnect()
					end
					if connection_2 then
						connection_2:Disconnect()
					end
					connection_ = UserInputService.InputChanged:Connect(function(input2)
						if enabled39 and (input2.UserInputType == Enum.UserInputType.MouseMovement or input2.UserInputType == Enum.UserInputType.Touch) then
							local number41 = input2.Position - position
							frame5.Position = UDim2.new(position2.X.Scale, position2.X.Offset + number41.X, position2.Y.Scale, position2.Y.Offset + number41.Y)
						end
					end)
					connection_2 = UserInputService.InputEnded:Connect(function(input2)
						if input2.UserInputType == Enum.UserInputType.MouseButton1 or input2.UserInputType == Enum.UserInputType.Touch then
							enabled39 = false
							if connection_ then
								connection_:Disconnect()
								connection_ = nil
							end
							if connection_2 then
								connection_2:Disconnect()
								connection_2 = nil
							end
						end
					end)
				end
			end)
			local entry66 = 0
			local function handleAction166()
				if not frame5.Visible then
					return
				end
				entry66 += 1
				local entry661 = entry66
				TweenService2:Create(uiScale, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.9 }):Play()
				task.delay(0.12, function()
					if entry661 == entry66 then
						frame5.Visible = false
					end
				end)
			end
			local function handleAction167()
				if _G.__4HubCloseAPConfigs then
					_G.__4HubCloseAPConfigs(frame5)
				end
				entry66 += 1
				frame5.Position = UDim2.new(0.5, 0, 0.5, 0)
				uiScale.Scale = 0.9
				frame5.Visible = true
				TweenService2:Create(uiScale, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
			end
			instance5.MouseButton1Click:Connect(handleAction166)
			return {
				win = frame5,
				open = handleAction167,
				hide = handleAction166,
				toggle = function()
					if frame5.Visible then
						handleAction166()
					else
						handleAction167()
					end
				end,
			}
		end
		local entry67 = 0
		local function handleAction168()
			entry67 += 1
			return entry67
		end
		local createSection1 = createSection
		local lightBlue = themeColors.LightBlue
		local darkBlue = themeColors.DarkBlue
		local blueLine = themeColors.BlueLine
		local value195 = handleAction168()
		createSection1(ap, "Command Controls", lightBlue, darkBlue, blueLine, value195)
		local clickToApOrder = handleAction161("Click To AP Order", _G.__4HubClickOrder, "Click")
		local clickToAp = createToggle(ap, "Click To AP", handleAction168(), false, function(argument227)
			if _G.__4HubSetClickAP then
				_G.__4HubSetClickAP(argument227)
			end
		end, false, function()
			clickToApOrder.toggle()
		end)
		_G.__4HubClickAPNotify = function(argument228)
			if clickToAp then
				clickToAp.SetSilent(argument228)
			end
		end
		local proximityOrder = handleAction161("Proximity Order", _G.__4HubProxOrder, "Prox", nil, function(parent)
			local instance4 = Instance.new("Frame")
			instance4.Size = UDim2.new(1, 0, 0, 42)
			instance4.BackgroundTransparency = 1
			instance4.LayoutOrder = 80
			instance4.Parent = parent
			local textLabel = Instance.new("TextLabel")
			textLabel.Position = UDim2.fromOffset(2, 0)
			textLabel.Size = UDim2.new(1, -4, 0, 16)
			textLabel.BackgroundTransparency = 1
			textLabel.Font = gothamMedium
			textLabel.Text = "Proximity Studs"
			textLabel.TextColor3 = themeColors.TextDim
			textLabel.TextSize = 12
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.Parent = instance4
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.AnchorPoint = Vector2.new(1, 0)
			textLabel2.Position = UDim2.new(1, -2, 0, 0)
			textLabel2.Size = UDim2.fromOffset(40, 16)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Font = gothamBold
			textLabel2.TextColor3 = themeColors.LightBlue
			textLabel2.TextSize = 12
			textLabel2.TextXAlignment = Enum.TextXAlignment.Right
			textLabel2.Parent = instance4
			local frame5 = Instance.new("Frame")
			frame5.Position = UDim2.fromOffset(2, 26)
			frame5.Size = UDim2.new(1, -4, 0, 6)
			frame5.BackgroundColor3 = themeColors.ToggleOff
			frame5.BorderSizePixel = 0
			frame5.Parent = instance4
			createUICorner(frame5, 3)
			local frame6 = Instance.new("Frame")
			frame6.Size = UDim2.new(0, 0, 1, 0)
			frame6.BackgroundColor3 = themeColors.LightBlue
			frame6.BorderSizePixel = 0
			frame6.Parent = frame5
			createUICorner(frame6, 3)
			local frame7 = Instance.new("Frame")
			frame7.AnchorPoint = Vector2.new(0.5, 0.5)
			frame7.Size = UDim2.fromOffset(14, 14)
			frame7.BackgroundColor3 = themeColors.White
			frame7.BorderSizePixel = 0
			frame7.Parent = frame5
			createUICorner(frame7, 7)
			local textButton3 = Instance.new("TextButton")
			textButton3.BackgroundTransparency = 1
			textButton3.Text = ""
			textButton3.Size = UDim2.new(1, 0, 4, 0)
			textButton3.Position = UDim2.new(0, 0, -1.5, 0)
			textButton3.Parent = frame5
			local function handleAction169(argument229, argument230)
				local 4HubProxRadius = math.clamp(math.floor(argument229 + 0.5), 1, 50)
				local number42 = (4HubProxRadius - 1) / 49
				frame6.Size = UDim2.new(number42, 0, 1, 0)
				frame7.Position = UDim2.new(number42, 0, 0.5, 0)
				textLabel2.Text = tostring(4HubProxRadius)
				_G.__4HubProxRadius = 4HubProxRadius
				if argument230 then
					saveNumber("ProxStuds", 4HubProxRadius)
				end
			end
			handleAction169(_G.__4HubProxRadius or 15, false)
			local enabled40 = false
			local function handleAction170(argument231)
				local entry68 = 0
				handleAction169(1 + math.clamp((argument231 - frame5.AbsolutePosition.X) / math.max(frame5.AbsoluteSize.X, 1), entry68, 1) * 49, true)
			end
			textButton3.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					enabled40 = true
					handleAction170(input.Position.X)
				end
			end)
			UserInputService.InputChanged:Connect(function(input)
				if enabled40 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					handleAction170(input.Position.X)
				end
			end)
			UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					enabled40 = false
				end
			end)
		end)
		local entry69 = false
		local function handleAction171(argument232)
			if _G.__4HubSetProximityAP then
				_G.__4HubSetProximityAP(argument232)
			end
		end
		local entry70 = false
		local proximity = createToggle(ap, "Proximity", handleAction168(), entry69, handleAction171, entry70, function()
			proximityOrder.toggle()
		end)
		_G.__4HubProxAPNotify = function(argument233)
			if proximity then
				proximity.SetSilent(argument233)
			end
		end
		local items50 = {}
		local spamBaseOwnerOrder = handleAction161("Spam Base Owner Order", _G.__4HubSpamOrder, "Spam", function(parent)
			local function handleAction172(text, layoutOrder)
				local instance4 = Instance.new("Frame")
				instance4.Size = UDim2.new(1, 0, 0, 30)
				instance4.BackgroundColor3 = themeColors.BgPanel
				instance4.BorderSizePixel = 0
				instance4.LayoutOrder = layoutOrder
				instance4.Parent = parent
				createUICorner(instance4, 7)
				createUIStroke(instance4, themeColors.Stroke, 1)
				local textLabel = Instance.new("TextLabel")
				textLabel.Position = UDim2.fromOffset(10, 0)
				textLabel.Size = UDim2.new(1, -60, 1, 0)
				textLabel.BackgroundTransparency = 1
				textLabel.Font = gothamBold
				textLabel.Text = text
				textLabel.TextColor3 = themeColors.White
				textLabel.TextSize = 12
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.Parent = instance4
				local textButton3 = Instance.new("TextButton")
				textButton3.AnchorPoint = Vector2.new(1, 0.5)
				textButton3.Position = UDim2.new(1, -10, 0.5, 0)
				textButton3.Size = UDim2.fromOffset(38, 18)
				textButton3.AutoButtonColor = false
				textButton3.Text = ""
				textButton3.BorderSizePixel = 0
				textButton3.Parent = instance4
				createUICorner(textButton3, 9)
				local frame5 = Instance.new("Frame")
				frame5.Size = UDim2.fromOffset(14, 14)
				frame5.BorderSizePixel = 0
				frame5.BackgroundColor3 = themeColors.White
				frame5.Parent = textButton3
				createUICorner(frame5, 7)
				local function handleAction173(argument234)
					TweenService2:Create(textButton3, TweenInfo.new(0.15), { BackgroundColor3 = argument234 and themeColors.LightBlue or themeColors.ToggleOff }):Play()
					TweenService2:Create(frame5, TweenInfo.new(0.15), { Position = argument234 and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7) }):Play()
				end
				items50[text] = handleAction173
				textButton3.MouseButton1Click:Connect(function()
					_G.__4HubSpamMode = text == "Single Commands" and "Single" or "Full"
					saveChoice("SpamMode", _G.__4HubSpamMode)
					items50["Single Commands"](_G.__4HubSpamMode == "Single")
					items50["Full Commands"](_G.__4HubSpamMode == "Full")
				end)
				handleAction173(false)
			end
			handleAction172("Single Commands", 10)
			handleAction172("Full Commands", 11)
		end)
		task.defer(function()
			if items50["Single Commands"] then
				items50["Single Commands"](_G.__4HubSpamMode == "Single")
			end
			if items50["Full Commands"] then
				items50["Full Commands"](_G.__4HubSpamMode == "Full")
			end
		end)
		local spamBaseOwner = nil
		local function handleAction174(argument235)
			if argument235 then
				if _G.__4HubSpamBaseOwner then
					_G.__4HubSpamBaseOwner()
				end
				task.delay(0.5, function()
					if spamBaseOwner then
						spamBaseOwner.Set(false)
					end
				end)
			end
		end
		local function handleAction175()
			spamBaseOwnerOrder.toggle()
		end
		spamBaseOwner = createToggle
		spamBaseOwner = spamBaseOwner(ap, "Spam Base Owner", handleAction168(), false, handleAction174, false, handleAction175)
		local createSection2 = createSection
		local lightBlue2 = themeColors.LightBlue
		local darkBlue2 = themeColors.DarkBlue
		local blueLine2 = themeColors.BlueLine
		local value196 = handleAction168()
		createSection2(ap, "User AP Blacklist", lightBlue2, darkBlue2, blueLine2, value196)
		local frame5 = Instance.new("Frame")
		frame5.Size = UDim2.new(1, 0, 0, 34)
		frame5.BackgroundColor3 = themeColors.BgDark
		frame5.BorderSizePixel = 0
		frame5.LayoutOrder = handleAction168()
		frame5.Parent = ap
		createUICorner(frame5, 8)
		createUIStroke(frame5, themeColors.Stroke, 1)
		local textBox = Instance.new("TextBox")
		textBox.Size = UDim2.new(1, -20, 1, 0)
		textBox.Position = UDim2.fromOffset(10, 0)
		textBox.BackgroundTransparency = 1
		textBox.Font = gothamMedium
		textBox.PlaceholderText = "Search username…"
		textBox.Text = ""
		textBox.TextColor3 = themeColors.White
		textBox.PlaceholderColor3 = themeColors.Dim
		textBox.TextSize = 12
		textBox.TextXAlignment = Enum.TextXAlignment.Left
		textBox.ClearTextOnFocus = false
		textBox.Parent = frame5
		local function createFrame(parent, argument236, argument237, text, layoutOrder, text2, argument238, argument239)
			local frame6 = Instance.new("Frame")
			frame6.Size = UDim2.new(1, 0, 0, 44)
			frame6.BackgroundColor3 = themeColors.BgPanel
			frame6.BorderSizePixel = 0
			frame6.LayoutOrder = layoutOrder
			frame6.Parent = parent
			createUICorner(frame6, 8)
			createUIStroke(frame6, themeColors.Stroke, 1)
			local imageLabel = Instance.new("ImageLabel")
			imageLabel.AnchorPoint = Vector2.new(0, 0.5)
			imageLabel.Position = UDim2.new(0, 8, 0.5, 0)
			imageLabel.Size = UDim2.fromOffset(32, 32)
			imageLabel.BackgroundColor3 = themeColors.BgDark
			imageLabel.BorderSizePixel = 0
			imageLabel.Parent = frame6
			createUICorner(imageLabel, 16)
			pcall(function()
				imageLabel.Image = string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=48&h=48", argument236)
			end)
			local instance4 = Instance.new("TextLabel")
			instance4.Position = UDim2.fromOffset(48, 6)
			instance4.Size = UDim2.new(1, -140, 0, 15)
			instance4.BackgroundTransparency = 1
			instance4.Font = gothamBold
			instance4.Text = text or argument237
			instance4.TextColor3 = themeColors.White
			instance4.TextSize = 13
			instance4.TextXAlignment = Enum.TextXAlignment.Left
			instance4.TextTruncate = Enum.TextTruncate.AtEnd
			instance4.Parent = frame6
			local textLabel = Instance.new("TextLabel")
			textLabel.Position = UDim2.fromOffset(48, 23)
			textLabel.Size = UDim2.new(1, -80, 0, 13)
			textLabel.BackgroundTransparency = 1
			textLabel.Font = gothamMedium
			textLabel.Text = "@" .. argument237
			textLabel.TextColor3 = themeColors.Dim
			textLabel.TextSize = 11
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel.Parent = frame6
			local instance5 = Instance.new("TextButton")
			instance5.AnchorPoint = Vector2.new(1, 0.5)
			instance5.Position = UDim2.new(1, -8, 0.5, 0)
			instance5.Size = UDim2.fromOffset(78, 26)
			instance5.BackgroundColor3 = argument238 and themeColors.Green or themeColors.Red
			instance5.AutoButtonColor = false
			instance5.Font = gothamBold
			instance5.Text = text2
			instance5.TextColor3 = themeColors.White
			instance5.TextSize = 11
			instance5.Parent = frame6
			createUICorner(instance5, 6)
			instance5.MouseButton1Click:Connect(function()
				argument239(frame6)
			end)
			return frame6
		end
		local frame6 = Instance.new("Frame")
		frame6.Size = UDim2.new(1, 0, 0, 0)
		frame6.AutomaticSize = Enum.AutomaticSize.Y
		frame6.BackgroundTransparency = 1
		frame6.LayoutOrder = handleAction168()
		frame6.Parent = ap
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.Padding = UDim.new(0, 6)
		uiListLayout.Parent = frame6
		local createSection3 = createSection
		local lightBlue3 = themeColors.LightBlue
		local darkBlue3 = themeColors.DarkBlue
		local blueLine3 = themeColors.BlueLine
		local value197 = handleAction168()
		createSection3(ap, "Blacklist Logs", lightBlue3, darkBlue3, blueLine3, value197)
		local frame7 = Instance.new("Frame")
		frame7.Size = UDim2.new(1, 0, 0, 0)
		frame7.AutomaticSize = Enum.AutomaticSize.Y
		frame7.BackgroundTransparency = 1
		frame7.LayoutOrder = handleAction168()
		frame7.Parent = ap
		local uiListLayout2 = Instance.new("UIListLayout")
		uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout2.Padding = UDim.new(0, 6)
		uiListLayout2.Parent = frame7
		local function 4HubBlChanged()
			for _, child in ipairs(frame7:GetChildren()) do
				if child:IsA("Frame") then
					child:Destroy()
				end
			end
			local number43 = 0
			for k, value198 in pairs(_G.__4HubBlacklist) do
				number43 += 1
				createFrame(frame7, tonumber(k) or 0, value198.name or "?", value198.display or value198.name or "?", number43, "UnBlacklist", false, function(argument240)
					_G.__4HubBlRemove(tonumber(k) or k)
					argument240:Destroy()
				end)
			end
		end
		_G.__4HubBlChanged = 4HubBlChanged
		4HubBlChanged()
		local function handleAction176(argument241)
			for _, child in ipairs(frame6:GetChildren()) do
				if child:IsA("Frame") then
					child:Destroy()
				end
			end
			if not argument241 or #argument241 < 2 then
				return
			end
			task.spawn(function()
				local userIdFromNameAsync = nil
				pcall(function()
					userIdFromNameAsync = players14:GetUserIdFromNameAsync(argument241)
				end)
				if not userIdFromNameAsync then
					return
				end
				pcall(function()
					local ok, result = pcall(function()
						return players14:GetNameFromUserIdAsync(userIdFromNameAsync)
					end)
					if ok then
						argument241 = result
					end
				end)
				local argument2411 = argument241
				createFrame(frame6, userIdFromNameAsync, argument241, argument2411, 1, "Blacklist", true, function()
					_G.__4HubBlAdd(userIdFromNameAsync, argument241, argument2411)
				end)
			end)
		end
		textBox.FocusLost:Connect(function(enterPressed)
			if enterPressed then
				handleAction176(textBox.Text)
			end
		end)
	end)
	if not ok then
	end
end
do
	local ok, result = pcall(function()
		local number44 = 0
		local function handleAction177()
			number44 += 1
			return number44
		end
		local function handleAction178(argument242)
			return tostring(argument242):gsub("[^%w]", ""):lower()
		end
		local function handleAction179()
			local items51 = {}
			local value199 = pairs
			local 4HubToggles = _G.__4HubToggles or {}
			for k, 4HubToggle in value199(4HubToggles) do
				if 4HubToggle.Get and 4HubToggle.Get() then
					items51[#items51 + 1] = handleAction178(k)
				end
			end
			table.sort(items51)
			for i, value200 in ipairs(items51) do
				items51[i] = "(" .. value200 .. ")"
			end
			local text13 = table.concat(items51, ">")
			local items52 = {}
			local value201 = pairs
			local 4HubSliders = _G.__4HubSliders or {}
			for k, 4HubSlider in value201(4HubSliders) do
				if 4HubSlider.Get then
					items52[#items52 + 1] = "[" .. handleAction178(k) .. "=" .. tostring(4HubSlider.Get()) .. "]"
				end
			end
			table.sort(items52)
			local text14
			if #items52 > 0 then
				text14 = text13 .. table.concat(items52)
			else
				text14 = text13
			end
			return text14
		end
		local function handleAction180(argument243)
			if type(argument243) ~= "string" then
				return 0
			end
			local items53 = {}
			for match in argument243:gmatch("%(([^%)]+)%)") do
				items53[handleAction178(match)] = true
			end
			local value202 = pairs
			local 4HubToggles = _G.__4HubToggles or {}
			local number45 = 0
			for k, 4HubToggle in value202(4HubToggles) do
				if 4HubToggle.Get and 4HubToggle.Set then
					local matchesCondition3 = items53[handleAction178(k)] == true
					if 4HubToggle.Get() ~= matchesCondition3 then
						4HubToggle.Set(matchesCondition3)
						number45 += 1
					end
				end
			end
			local items54 = {}
			for match, match2 in argument243:gmatch("%[([^=%]]+)=([^%]]+)%]") do
				items54[handleAction178(match)] = tonumber(match2)
			end
			local value203 = pairs
			local 4HubSliders = _G.__4HubSliders or {}
			for k, 4HubSlider in value203(4HubSliders) do
				local entry71 = items54[handleAction178(k)]
				if entry71 ~= nil and 4HubSlider.Set then
					4HubSlider.Set(entry71)
					number45 += 1
				end
			end
			return number45
		end
		local function handleAction181()
			local SavedConfigs = getSavedChoice("SavedConfigs")
			if type(SavedConfigs) == "string" and SavedConfigs ~= "" then
				local ok, result = pcall(function()
					return HttpService:JSONDecode(SavedConfigs)
				end)
				if ok and type(result) == "table" then
					return result
				end
			end
			return {}
		end
		local function handleAction182(argument244)
			pcall(function()
				saveChoice("SavedConfigs", HttpService:JSONEncode(argument244))
			end)
		end
		local value204 = handleAction181()
		local function handleAction183(argument245)
			local entry72 = 0
			for match in tostring(argument245):gmatch("%(([^%)]+)%)") do
				entry72 += 1
			end
			return entry72
		end
		local function handleAction184(layoutOrder)
			local instance4 = Instance.new("Frame")
			instance4.Size = UDim2.new(1, 0, 0, 0)
			instance4.AutomaticSize = Enum.AutomaticSize.Y
			instance4.BackgroundColor3 = themeColors.BgDark
			instance4.BorderSizePixel = 0
			instance4.LayoutOrder = layoutOrder
			instance4.Parent = Config_
			createUICorner(instance4, 10)
			local uiGradient = Instance.new("UIGradient")
			uiGradient.Rotation = 90
			local new = ColorSequenceKeypoint.new
			local bgDark = themeColors.BgDark
			uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, themeColors.BgPanel), new(1, bgDark) })
			uiGradient.Parent = instance4
			createUIStroke(instance4, themeColors.Stroke, 1)
			local uiPadding = Instance.new("UIPadding")
			uiPadding.PaddingLeft = UDim.new(0, 12)
			uiPadding.PaddingRight = UDim.new(0, 12)
			uiPadding.PaddingTop = UDim.new(0, 10)
			uiPadding.PaddingBottom = UDim.new(0, 12)
			uiPadding.Parent = instance4
			local uiListLayout = Instance.new("UIListLayout")
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.Padding = UDim.new(0, 8)
			uiListLayout.Parent = instance4
			return instance4
		end
		local function handleAction185(parent, text, text2, layoutOrder)
			local instance4 = Instance.new("Frame")
			instance4.Size = UDim2.new(1, 0, 0, text2 and 30 or 18)
			instance4.BackgroundTransparency = 1
			instance4.LayoutOrder = layoutOrder
			instance4.Parent = parent
			local instance5 = Instance.new("Frame")
			instance5.Size = UDim2.fromOffset(3, 14)
			instance5.Position = UDim2.fromOffset(0, 2)
			instance5.BackgroundColor3 = themeColors.LightBlue
			instance5.BorderSizePixel = 0
			instance5.Parent = instance4
			createUICorner(instance5, 2)
			local textLabel = Instance.new("TextLabel")
			textLabel.Position = UDim2.fromOffset(11, 0)
			textLabel.Size = UDim2.new(1, -11, 0, 16)
			textLabel.BackgroundTransparency = 1
			textLabel.Font = gothamBold
			textLabel.Text = text
			textLabel.TextColor3 = themeColors.White
			textLabel.TextSize = 13
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.Parent = instance4
			if text2 then
				local textLabel2 = Instance.new("TextLabel")
				textLabel2.Position = UDim2.fromOffset(11, 16)
				textLabel2.Size = UDim2.new(1, -11, 0, 13)
				textLabel2.BackgroundTransparency = 1
				textLabel2.Font = gothamMedium
				textLabel2.Text = text2
				textLabel2.TextColor3 = themeColors.Dim
				textLabel2.TextSize = 11
				textLabel2.TextXAlignment = Enum.TextXAlignment.Left
				textLabel2.Parent = instance4
			end
			return instance4
		end
		local function createTextButton2(parent, text, argument246, backgroundColor3, layoutOrder)
			local textButton3 = Instance.new("TextButton")
			textButton3.Size = UDim2.fromOffset(argument246, 30)
			textButton3.BackgroundColor3 = backgroundColor3
			textButton3.AutoButtonColor = false
			textButton3.Font = gothamBold
			textButton3.Text = text
			textButton3.TextColor3 = themeColors.White
			textButton3.TextSize = 12
			textButton3.LayoutOrder = layoutOrder
			textButton3.Parent = parent
			createUICorner(textButton3, 7)
			local value205 = createUIStroke(textButton3, themeColors.Stroke, 1)
			textButton3.MouseEnter:Connect(function()
				local options36 = { Color = themeColors.LightBlue }
				TweenService:Create(value205, TweenInfo.new(0.12), options36):Play()
			end)
			textButton3.MouseLeave:Connect(function()
				local options37 = { Color = themeColors.Stroke }
				TweenService:Create(value205, TweenInfo.new(0.12), options37):Play()
			end)
			return textButton3
		end
		local frame5 = Instance.new("Frame")
		frame5.Size = UDim2.new(1, 0, 0, 42)
		frame5.BackgroundTransparency = 1
		frame5.LayoutOrder = handleAction177()
		frame5.Parent = Config_
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, 0, 0, 22)
		textLabel.BackgroundTransparency = 1
		textLabel.Font = gothamBold
		textLabel.Text = "CONFIG MANAGER"
		textLabel.TextColor3 = themeColors.White
		textLabel.TextSize = 18
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.Parent = frame5
		local uiGradient = Instance.new("UIGradient")
		local new = ColorSequenceKeypoint.new
		local lightBlue = themeColors.LightBlue
		uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, themeColors.White), new(1, lightBlue) })
		uiGradient.Parent = textLabel
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.Position = UDim2.fromOffset(0, 24)
		textLabel2.Size = UDim2.new(1, 0, 0, 15)
		textLabel2.BackgroundTransparency = 1
		textLabel2.Font = gothamMedium
		textLabel2.Text = "save, share and load full setups"
		textLabel2.TextColor3 = themeColors.Dim
		textLabel2.TextSize = 12
		textLabel2.TextXAlignment = Enum.TextXAlignment.Left
		textLabel2.Parent = frame5
		local value206 = handleAction184(handleAction177())
		handleAction185(value206, "Your Config Code", "copy it to share your exact setup", 1)
		local frame6 = Instance.new("Frame")
		frame6.Size = UDim2.new(1, 0, 0, 52)
		frame6.BackgroundColor3 = themeColors.Black
		frame6.BorderSizePixel = 0
		frame6.LayoutOrder = 2
		frame6.Parent = value206
		createUICorner(frame6, 8)
		createUIStroke(frame6, themeColors.Stroke, 1)
		local textBox = Instance.new("TextBox")
		textBox.Size = UDim2.new(1, -16, 1, -10)
		textBox.Position = UDim2.fromOffset(8, 5)
		textBox.BackgroundTransparency = 1
		textBox.Font = Enum.Font.Code
		textBox.Text = ""
		textBox.PlaceholderText = "(nothing enabled yet)"
		textBox.TextColor3 = themeColors.LightBlue
		textBox.PlaceholderColor3 = themeColors.Dim
		textBox.TextSize = 12
		textBox.TextXAlignment = Enum.TextXAlignment.Left
		textBox.TextYAlignment = Enum.TextYAlignment.Top
		textBox.TextWrapped = true
		textBox.MultiLine = true
		textBox.ClearTextOnFocus = false
		textBox.TextEditable = false
		textBox.Parent = frame6
		local frame7 = Instance.new("Frame")
		frame7.Size = UDim2.new(1, 0, 0, 30)
		frame7.BackgroundTransparency = 1
		frame7.LayoutOrder = 3
		frame7.Parent = value206
		local instance4 = Instance.new("UIListLayout")
		instance4.FillDirection = Enum.FillDirection.Horizontal
		instance4.SortOrder = Enum.SortOrder.LayoutOrder
		instance4.Padding = UDim.new(0, 8)
		instance4.Parent = frame7
		local instance5 = Instance.new("TextLabel")
		instance5.Size = UDim2.fromOffset(120, 30)
		instance5.BackgroundTransparency = 1
		instance5.Font = gothamMedium
		instance5.Text = ""
		instance5.TextColor3 = themeColors.Dim
		instance5.TextSize = 12
		instance5.TextXAlignment = Enum.TextXAlignment.Left
		instance5.LayoutOrder = 3
		instance5.Parent = frame7
		local function handleAction186()
			local value207 = handleAction179()
			textBox.Text = value207
			instance5.Text = handleAction183(value207) .. " enabled"
		end
		local copy = createTextButton2(frame7, "Copy", 78, themeColors.DarkBlue, 1)
		local refresh = createTextButton2(frame7, "Refresh", 84, themeColors.BgPanel, 2)
		copy.MouseButton1Click:Connect(function()
			handleAction186()
			pcall(function()
				if setclipboard then
					setclipboard(handleAction179())
				end
			end)
			copy.Text = "Copied!"
			task.delay(0.9, function()
				copy.Text = "Copy"
			end)
		end)
		refresh.MouseButton1Click:Connect(handleAction186)
		task.defer(handleAction186)
		local value208 = handleAction184(handleAction177())
		handleAction185(value208, "Load a Config", "paste someone's code to match their setup", 1)
		local frame8 = Instance.new("Frame")
		frame8.Size = UDim2.new(1, 0, 0, 36)
		frame8.BackgroundColor3 = themeColors.Black
		frame8.BorderSizePixel = 0
		frame8.LayoutOrder = 2
		frame8.Parent = value208
		createUICorner(frame8, 8)
		createUIStroke(frame8, themeColors.Stroke, 1)
		local textBox2 = Instance.new("TextBox")
		textBox2.Size = UDim2.new(1, -16, 1, 0)
		textBox2.Position = UDim2.fromOffset(8, 0)
		textBox2.BackgroundTransparency = 1
		textBox2.Font = Enum.Font.Code
		textBox2.Text = ""
		textBox2.PlaceholderText = "paste a config code…"
		textBox2.TextColor3 = themeColors.White
		textBox2.PlaceholderColor3 = themeColors.Dim
		textBox2.TextSize = 12
		textBox2.TextXAlignment = Enum.TextXAlignment.Left
		textBox2.TextTruncate = Enum.TextTruncate.AtEnd
		textBox2.ClearTextOnFocus = false
		textBox2.Parent = frame8
		local frame9 = Instance.new("Frame")
		frame9.Size = UDim2.new(1, 0, 0, 30)
		frame9.BackgroundTransparency = 1
		frame9.LayoutOrder = 3
		frame9.Parent = value208
		local textButton3 = Instance.new("TextButton")
		textButton3.Size = UDim2.new(1, 0, 1, 0)
		textButton3.BackgroundColor3 = themeColors.Green
		textButton3.AutoButtonColor = false
		textButton3.Font = gothamBold
		textButton3.Text = "Load Config"
		textButton3.TextColor3 = themeColors.White
		textButton3.TextSize = 13
		textButton3.Parent = frame9
		createUICorner(textButton3, 7)
		local value209 = createUIStroke(textButton3, themeColors.Stroke, 1)
		textButton3.MouseEnter:Connect(function()
			local options38 = { Color = themeColors.White }
			TweenService:Create(value209, TweenInfo.new(0.12), options38):Play()
		end)
		textButton3.MouseLeave:Connect(function()
			local options39 = { Color = themeColors.Stroke }
			TweenService:Create(value209, TweenInfo.new(0.12), options39):Play()
		end)
		textButton3.MouseButton1Click:Connect(function()
			local text = textBox2.Text or ""
			if text == "" then
				return
			end
			local value210 = handleAction180(text)
			textBox2.Text = ""
			textButton3.Text = "Loaded " .. value210 .. " setting" .. (value210 == 1 and "" or "s") .. "!"
			task.delay(1.4, function()
				textButton3.Text = "Load Config"
			end)
			task.defer(handleAction186)
		end)
		local value211 = handleAction184(handleAction177())
		handleAction185(value211, "Saved Configs", "your saved setups on this device", 1)
		local frame10 = Instance.new("Frame")
		frame10.Size = UDim2.new(1, 0, 0, 34)
		frame10.BackgroundTransparency = 1
		frame10.LayoutOrder = 2
		frame10.Parent = value211
		local frame11 = Instance.new("Frame")
		frame11.Size = UDim2.new(1, -92, 1, 0)
		frame11.BackgroundColor3 = themeColors.Black
		frame11.BorderSizePixel = 0
		frame11.Parent = frame10
		createUICorner(frame11, 7)
		createUIStroke(frame11, themeColors.Stroke, 1)
		local textBox3 = Instance.new("TextBox")
		textBox3.Size = UDim2.new(1, -16, 1, 0)
		textBox3.Position = UDim2.fromOffset(8, 0)
		textBox3.BackgroundTransparency = 1
		textBox3.Font = gothamMedium
		textBox3.Text = ""
		textBox3.PlaceholderText = "name this config…"
		textBox3.TextColor3 = themeColors.White
		textBox3.PlaceholderColor3 = themeColors.Dim
		textBox3.TextSize = 12
		textBox3.TextXAlignment = Enum.TextXAlignment.Left
		textBox3.TextTruncate = Enum.TextTruncate.AtEnd
		textBox3.ClearTextOnFocus = false
		textBox3.Parent = frame11
		local textButton4 = Instance.new("TextButton")
		textButton4.AnchorPoint = Vector2.new(1, 0.5)
		textButton4.Position = UDim2.new(1, 0, 0.5, 0)
		textButton4.Size = UDim2.fromOffset(84, 34)
		textButton4.BackgroundColor3 = themeColors.DarkBlue
		textButton4.AutoButtonColor = false
		textButton4.Font = gothamBold
		textButton4.Text = "Save"
		textButton4.TextColor3 = themeColors.White
		textButton4.TextSize = 13
		textButton4.Parent = frame10
		createUICorner(textButton4, 7)
		local value212 = createUIStroke(textButton4, themeColors.LightBlue, 1)
		local frame12 = Instance.new("Frame")
		frame12.Size = UDim2.new(1, 0, 0, 0)
		frame12.AutomaticSize = Enum.AutomaticSize.Y
		frame12.BackgroundTransparency = 1
		frame12.LayoutOrder = 3
		frame12.Parent = value211
		local instance6 = Instance.new("UIListLayout")
		instance6.SortOrder = Enum.SortOrder.LayoutOrder
		instance6.Padding = UDim.new(0, 7)
		instance6.Parent = frame12
		local handleAction187 = nil
		handleAction187 = function()
			for _, child in ipairs(frame12:GetChildren()) do
				if child:IsA("Frame") then
					child:Destroy()
				end
			end
			if #value204 == 0 then
				local instance7 = Instance.new("Frame")
				instance7.Size = UDim2.new(1, 0, 0, 34)
				instance7.BackgroundColor3 = themeColors.Black
				instance7.BackgroundTransparency = 0.35
				instance7.BorderSizePixel = 0
				instance7.LayoutOrder = 1
				instance7.Parent = frame12
				createUICorner(instance7, 7)
				local textLabel3 = Instance.new("TextLabel")
				textLabel3.Size = UDim2.new(1, 0, 1, 0)
				textLabel3.BackgroundTransparency = 1
				textLabel3.Font = gothamMedium
				textLabel3.Text = "No saved configs yet — name one and hit Save"
				textLabel3.TextColor3 = themeColors.Dim
				textLabel3.TextSize = 12
				textLabel3.TextXAlignment = Enum.TextXAlignment.Center
				textLabel3.Parent = instance7
				return
			end
			for i, value213 in ipairs(value204) do
				local frame13 = Instance.new("Frame")
				frame13.Size = UDim2.new(1, 0, 0, 50)
				frame13.BackgroundColor3 = themeColors.BgPanel
				frame13.BorderSizePixel = 0
				frame13.LayoutOrder = i
				frame13.Parent = frame12
				createUICorner(frame13, 8)
				local value214 = createUIStroke(frame13, themeColors.Stroke, 1)
				local frame14 = Instance.new("Frame")
				frame14.Size = UDim2.new(0, 3, 0.6, 0)
				frame14.Position = UDim2.new(0, 0, 0.2, 0)
				frame14.BackgroundColor3 = themeColors.DarkBlue
				frame14.BorderSizePixel = 0
				frame14.Parent = frame13
				createUICorner(frame14, 2)
				local textButton5 = Instance.new("TextButton")
				textButton5.Size = UDim2.new(1, 0, 1, 0)
				textButton5.BackgroundTransparency = 1
				textButton5.Text = ""
				textButton5.ZIndex = 0
				textButton5.Parent = frame13
				textButton5.MouseEnter:Connect(function()
					local options40 = { Color = themeColors.LightBlue }
					TweenService:Create(value214, TweenInfo.new(0.14), options40):Play()
					local options41 = { BackgroundColor3 = themeColors.LightBlue }
					TweenService:Create(frame14, TweenInfo.new(0.14), options41):Play()
				end)
				textButton5.MouseLeave:Connect(function()
					local options42 = { Color = themeColors.Stroke }
					TweenService:Create(value214, TweenInfo.new(0.14), options42):Play()
					local options43 = { BackgroundColor3 = themeColors.DarkBlue }
					TweenService:Create(frame14, TweenInfo.new(0.14), options43):Play()
				end)
				local textLabel3 = Instance.new("TextLabel")
				textLabel3.Position = UDim2.fromOffset(14, 7)
				textLabel3.Size = UDim2.new(1, -160, 0, 17)
				textLabel3.BackgroundTransparency = 1
				textLabel3.Font = gothamBold
				textLabel3.Text = value213.name or "Config " .. i
				textLabel3.TextColor3 = themeColors.White
				textLabel3.TextSize = 13
				textLabel3.TextXAlignment = Enum.TextXAlignment.Left
				textLabel3.TextTruncate = Enum.TextTruncate.AtEnd
				textLabel3.Parent = frame13
				local textLabel4 = Instance.new("TextLabel")
				textLabel4.Position = UDim2.fromOffset(14, 26)
				textLabel4.Size = UDim2.new(1, -160, 0, 14)
				textLabel4.BackgroundTransparency = 1
				textLabel4.Font = Enum.Font.Code
				textLabel4.Text = value213.code ~= "" and value213.code or "(empty)"
				textLabel4.TextColor3 = themeColors.Dim
				textLabel4.TextSize = 10
				textLabel4.TextXAlignment = Enum.TextXAlignment.Left
				textLabel4.TextTruncate = Enum.TextTruncate.AtEnd
				textLabel4.Parent = frame13
				local textLabel5 = Instance.new("TextLabel")
				textLabel5.AnchorPoint = Vector2.new(1, 0.5)
				textLabel5.Position = UDim2.new(1, -96, 0.5, 0)
				textLabel5.Size = UDim2.fromOffset(42, 20)
				textLabel5.BackgroundColor3 = themeColors.DarkBlue
				textLabel5.Font = gothamBold
				textLabel5.Text = tostring(handleAction183(value213.code))
				textLabel5.TextColor3 = themeColors.LightBlue
				textLabel5.TextSize = 11
				textLabel5.Parent = frame13
				createUICorner(textLabel5, 6)
				createUIStroke(textLabel5, themeColors.LightBlue, 1)
				local textButton6 = Instance.new("TextButton")
				textButton6.AnchorPoint = Vector2.new(1, 0.5)
				textButton6.Position = UDim2.new(1, -42, 0.5, 0)
				textButton6.Size = UDim2.fromOffset(50, 28)
				textButton6.BackgroundColor3 = themeColors.Green
				textButton6.AutoButtonColor = false
				textButton6.Font = gothamBold
				textButton6.Text = "Load"
				textButton6.TextColor3 = themeColors.White
				textButton6.TextSize = 11
				textButton6.ZIndex = 2
				textButton6.Parent = frame13
				createUICorner(textButton6, 6)
				local instance7 = Instance.new("TextButton")
				instance7.AnchorPoint = Vector2.new(1, 0.5)
				instance7.Position = UDim2.new(1, -8, 0.5, 0)
				instance7.Size = UDim2.fromOffset(28, 28)
				instance7.BackgroundColor3 = themeColors.Red
				instance7.AutoButtonColor = false
				instance7.Font = gothamBold
				instance7.Text = "X"
				instance7.TextColor3 = themeColors.White
				instance7.TextSize = 13
				instance7.ZIndex = 2
				instance7.Parent = frame13
				createUICorner(instance7, 6)
				textButton6.MouseButton1Click:Connect(function()
					handleAction180(value213.code)
					textButton6.Text = "Loaded"
					task.delay(0.9, function()
						textButton6.Text = "Load"
					end)
					task.defer(handleAction186)
				end)
				instance7.MouseButton1Click:Connect(function()
					table.remove(value204, i)
					handleAction182(value204)
					handleAction187()
				end)
			end
		end
		textButton4.MouseEnter:Connect(function()
			local options44 = { Color = themeColors.White }
			TweenService:Create(value212, TweenInfo.new(0.12), options44):Play()
		end)
		textButton4.MouseLeave:Connect(function()
			local options45 = { Color = themeColors.LightBlue }
			TweenService:Create(value212, TweenInfo.new(0.12), options45):Play()
		end)
		textButton4.MouseButton1Click:Connect(function()
			local text15 = (textBox3.Text or ""):gsub("^%s+", ""):gsub("%s+$", "")
			if text15 == "" then
				text15 = "Config " .. #value204 + 1
			end
			value204[#value204 + 1] = { name = text15, code = handleAction179() }
			handleAction182(value204)
			textBox3.Text = ""
			handleAction187()
		end)
		handleAction187()
	end)
	if not ok then
	end
end
do
	local position = nil
	local position2 = nil
	local entry73 = false
	local function handleAction188(input)
		if 4HubLocked then
			return
		end
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			entry73 = true
			enabled1 = true
			position = input.Position
			position2 = frame.Position
		end
	end
	frame2.InputBegan:Connect(handleAction188)
	instance.InputBegan:Connect(handleAction188)
	frame3.InputBegan:Connect(handleAction188)
	frame.InputBegan:Connect(handleAction188)
	for _, value215 in pairs(tabRegistry) do
		value215.page.InputBegan:Connect(handleAction188)
	end
	userInputService.InputChanged:Connect(function(input)
		if entry73 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local number46 = input.Position - position
			frame.Position = UDim2.new(position2.X.Scale, position2.X.Offset + number46.X, position2.Y.Scale, position2.Y.Offset + number46.Y)
		end
	end)
	userInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			entry73 = false
			enabled1 = false
		end
	end)
end
enabled37 = false
do
	local enabled41 = false
	local tweenInfo = TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	local tweenInfo2 = TweenInfo.new(0.26, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
	handleAction154 = function()
		if enabled41 or enabled37 then
			return
		end
		local entry74 = true
		enabled41 = true
		enabled37 = entry74
		frame.Visible = true
		frame.Size = UDim2.fromOffset(0, 0)
		uiStroke.Transparency = 1
		local tween = TweenService:Create(frame, tweenInfo, { Size = udim2 })
		TweenService:Create(uiStroke, TweenInfo.new(0.34), { Transparency = 0 }):Play()
		tween:Play()
		tween.Completed:Once(function()
			enabled41 = false
		end)
	end
	handleAction155 = function()
		if enabled41 or not enabled37 then
			return
		end
		enabled41 = true
		enabled37 = false
		frame4.Visible = false
		enabled2 = false
		instance3.Visible = false
		enabled20 = false
		instance2.Visible = false
		enabled19 = false
		if _G.__4HubCloseAPConfigs then
			_G.__4HubCloseAPConfigs()
		end
		TweenService:Create(uiStroke, TweenInfo.new(0.2), { Transparency = 1 }):Play()
		local tween = TweenService:Create(frame, tweenInfo2, { Size = UDim2.fromOffset(0, 0) })
		tween:Play()
		tween.Completed:Once(function()
			frame.Visible = false
			enabled41 = false
		end)
	end
end
textButton.MouseButton1Click:Connect(handleAction155)
_G.__4HubToggleMenu = function()
	if enabled37 then
		handleAction155()
	else
		handleAction154()
	end
end
userInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then
		return
	end
	if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl or value3 and input.KeyCode == value3 then
		if enabled37 then
			handleAction155()
		else
			handleAction154()
		end
	end
end)
textButton2 = Instance.new("TextButton")
textButton2.Name = "RToggle"
textButton2.AnchorPoint = Vector2.new(0, 0.5)
textButton2.Position = UDim2.new(0, 10, 0.5, 0)
textButton2.Size = UDim2.fromOffset(32, 32)
textButton2.BackgroundColor3 = themeColors.BgDark
textButton2.AutoButtonColor = false
textButton2.Text = ""
textButton2.Parent = screenGui
createUICorner(textButton2, 16)
do
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Name = "Logo"
	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	imageLabel.Size = UDim2.new(1, -4, 1, -4)
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = "rbxassetid://84149277273810"
	imageLabel.ResampleMode = Enum.ResamplerMode.Default
	imageLabel.ScaleType = Enum.ScaleType.Fit
	imageLabel.ZIndex = 3
	imageLabel.Parent = textButton2
	local uiCorner = Instance.new("UICorner")
	uiCorner.CornerRadius = UDim.new(1, 0)
	uiCorner.Parent = imageLabel
end
do
	local value216 = createUIStroke(textButton2, themeColors.LightBlue, 1)
	local uiGradient = Instance.new("UIGradient")
	local colorSequence = ColorSequence.new
	local items55 = {}
	local value217 = ColorSequenceKeypoint.new(0, themeColors.DarkBlue)
	local value218 = ColorSequenceKeypoint.new(0.5, themeColors.LightBlue)
	local new = ColorSequenceKeypoint.new
	local entry75 = 1
	local darkBlue = themeColors.DarkBlue
	items55[1] = value217
	items55[2] = value218
	do
		local values = table.pack(new(entry75, darkBlue))
		table.move(values, 1, values.n, 3, items55)
	end
	uiGradient.Color = colorSequence(items55)
	uiGradient.Parent = value216
	_G.__4HubSpin(uiGradient, 90)
end
textButton2.MouseEnter:Connect(function()
	local options46 = { BackgroundColor3 = themeColors.DarkBlue }
	TweenService:Create(textButton2, TweenInfo.new(0.12), options46):Play()
end)
textButton2.MouseLeave:Connect(function()
	local options47 = { BackgroundColor3 = themeColors.BgDark }
	TweenService:Create(textButton2, TweenInfo.new(0.12), options47):Play()
end)
textButton2.MouseButton1Click:Connect(function()
	if enabled37 then
		handleAction155()
	else
		handleAction154()
	end
end)
frame.Size = UDim2.fromOffset(0, 0)
frame.Visible = false
uiStroke.Transparency = 1
do
	local function handleAction189()
		local players15 = game:GetService("Players")
		local TweenService2 = game:GetService("TweenService")
		game:GetService("UserInputService")
		game:GetService("RunService")
		local playerGui_ = players15.LocalPlayer:WaitForChild("PlayerGui")
		local options48 = {
			Black = Color3.fromRGB(6, 8, 14),
			BgDark = Color3.fromRGB(9, 13, 24),
			BgPanel = Color3.fromRGB(13, 20, 38),
			Stroke = Color3.fromRGB(30, 46, 82),
			DarkBlue = Color3.fromRGB(18, 38, 78),
			LightBlue = Color3.fromRGB(92, 165, 255),
			BlueLine = Color3.fromRGB(60, 120, 220),
			White = Color3.fromRGB(255, 255, 255),
			TextDim = Color3.fromRGB(150, 165, 195),
		}
		local gothamBold2 = Enum.Font.GothamBold
		local function createUICorner2(parent, argument247)
			local uiCorner = Instance.new("UICorner")
			uiCorner.CornerRadius = UDim.new(0, argument247 or 8)
			uiCorner.Parent = parent
			return uiCorner
		end
		local function handleAction190(parent, color, thickness, transparency)
			local instance4 = Instance.new("UIStroke")
			instance4.Color = color or options48.Stroke
			instance4.Thickness = thickness or 1
			instance4.Transparency = transparency or 0
			instance4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			instance4.Parent = parent
			return instance4
		end
		local function handleAction191()
			if _G.__4HubKick then
				pcall(_G.__4HubKick)
			end
		end
		local function handleAction192()
			if _G.__4HubRejoin then
				pcall(_G.__4HubRejoin)
			end
		end
		local function handleAction193()
			if _G.__4HubReset then
				pcall(_G.__4HubReset)
			end
		end
		local actionsPanelUI = playerGui_:FindFirstChild("ActionsPanelUI")
		if actionsPanelUI then
			actionsPanelUI:Destroy()
		end
		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "ActionsPanelUI"
		screenGui2.ResetOnSpawn = false
		screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui2.IgnoreGuiInset = true
		screenGui2.DisplayOrder = 60
		screenGui2.Parent = playerGui_
		local udim22 = UDim2.fromOffset(236, 280)
		local frame5 = Instance.new("Frame")
		frame5.Name = "Window"
		frame5.AnchorPoint = Vector2.new(1, 1)
		frame5.Size = udim22
		frame5.Position = UDim2.new(1, -16, 1, -16)
		frame5.BackgroundColor3 = options48.BgDark
		frame5.BorderSizePixel = 0
		frame5.ClipsDescendants = true
		frame5.Active = true
		frame5.Parent = screenGui2
		createUICorner2(frame5, 12)
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Rotation = 90
		local new = ColorSequenceKeypoint.new
		local bgDark = options48.BgDark
		uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, options48.Black), new(1, bgDark) })
		uiGradient.Parent = frame5
		local instance4 = Instance.new("UIStroke")
		instance4.Thickness = 2.5
		instance4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		instance4.Parent = frame5
		local uiGradient2 = Instance.new("UIGradient")
		local colorSequence = ColorSequence.new
		local items56 = {}
		local value219 = ColorSequenceKeypoint.new(0, options48.DarkBlue)
		local value220 = ColorSequenceKeypoint.new(0.5, options48.LightBlue)
		local new2 = ColorSequenceKeypoint.new
		local darkBlue = options48.DarkBlue
		items56[1] = value219
		items56[2] = value220
		do
			local values = table.pack(new2(1, darkBlue))
			table.move(values, 1, values.n, 3, items56)
		end
		uiGradient2.Color = colorSequence(items56)
		uiGradient2.Parent = instance4
		_G.__4HubSpin(uiGradient2, 90)
		local frame6 = Instance.new("Frame")
		frame6.Name = "Header"
		frame6.Size = UDim2.new(1, 0, 0, 42)
		frame6.BackgroundTransparency = 1
		frame6.Active = true
		frame6.Parent = frame5
		local instance5 = Instance.new("TextButton")
		instance5.Name = "Minimise"
		instance5.AnchorPoint = Vector2.new(1, 0)
		instance5.Position = UDim2.new(1, -10, 0, 10)
		instance5.Size = UDim2.fromOffset(20, 20)
		instance5.BackgroundColor3 = options48.DarkBlue
		instance5.AutoButtonColor = false
		instance5.Font = gothamBold2
		instance5.Text = "–"
		instance5.TextColor3 = options48.LightBlue
		instance5.TextSize = 18
		instance5.ZIndex = 6
		instance5.Parent = frame6
		createUICorner2(instance5, 6)
		handleAction190(instance5, options48.LightBlue, 1)
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "Title"
		textLabel.Size = UDim2.new(1, -80, 0, 42)
		textLabel.Position = UDim2.fromOffset(40, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Font = gothamBold2
		textLabel.Text = "Actions Panel"
		textLabel.TextColor3 = options48.White
		textLabel.TextSize = 16
		textLabel.TextXAlignment = Enum.TextXAlignment.Center
		textLabel.Parent = frame6
		local frame7 = Instance.new("Frame")
		frame7.Name = "HeaderLine"
		frame7.Size = UDim2.new(1, -28, 0, 2)
		frame7.Position = UDim2.new(0, 14, 0, 40)
		frame7.BackgroundColor3 = options48.BlueLine
		frame7.BorderSizePixel = 0
		frame7.Parent = frame5
		createUICorner2(frame7, 1)
		local instance6 = Instance.new("UIGradient")
		local colorSequence2 = ColorSequence.new
		local items57 = {}
		local value221 = ColorSequenceKeypoint.new(0, options48.DarkBlue)
		local value222 = ColorSequenceKeypoint.new(0.5, options48.LightBlue)
		local new3 = ColorSequenceKeypoint.new
		local darkBlue2 = options48.DarkBlue
		items57[1] = value221
		items57[2] = value222
		do
			local values = table.pack(new3(1, darkBlue2))
			table.move(values, 1, values.n, 3, items57)
		end
		instance6.Color = colorSequence2(items57)
		instance6.Parent = frame7
		local instance7 = Instance.new("Frame")
		instance7.Name = "Body"
		instance7.Position = UDim2.fromOffset(0, 48)
		instance7.Size = UDim2.new(1, 0, 1, -48)
		instance7.BackgroundTransparency = 1
		instance7.Parent = frame5
		local uiPadding = Instance.new("UIPadding")
		uiPadding.PaddingLeft = UDim.new(0, 12)
		uiPadding.PaddingRight = UDim.new(0, 12)
		uiPadding.PaddingBottom = UDim.new(0, 12)
		uiPadding.Parent = instance7
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.Padding = UDim.new(0, 10)
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.Parent = instance7
		local color = Color3.fromRGB(34, 110, 255)
		local color2 = Color3.fromRGB(74, 150, 255)
		local function handleAction194(name, layoutOrder, argument248, argument249)
			local argument2491 = argument249 or {}
			local solid = argument2491.solid and color or options48.BgPanel
			local instance8 = Instance.new("TextButton")
			instance8.Name = name
			instance8.Size = UDim2.new(1, 0, 0, 36)
			instance8.BackgroundColor3 = solid
			instance8.AutoButtonColor = false
			instance8.Text = name
			instance8.Font = gothamBold2
			instance8.TextSize = 14
			instance8.TextColor3 = options48.White
			instance8.LayoutOrder = layoutOrder
			instance8.Parent = instance7
			createUICorner2(instance8, 8)
			local value223 = handleAction190(instance8, argument2491.solid and options48.LightBlue or options48.Stroke, argument2491.solid and 1.25 or 1)
			if not argument2491.solid then
				local instance9 = Instance.new("Frame")
				instance9.Size = UDim2.new(0, 3, 0.55, 0)
				instance9.Position = UDim2.new(0, 0, 0.225, 0)
				instance9.BackgroundColor3 = options48.DarkBlue
				instance9.BorderSizePixel = 0
				instance9.Parent = instance8
				createUICorner2(instance9, 2)
				instance8.MouseEnter:Connect(function()
					local options49 = { Color = options48.LightBlue }
					TweenService2:Create(value223, TweenInfo.new(0.15), options49):Play()
					local options50 = { BackgroundColor3 = options48.LightBlue }
					TweenService2:Create(instance9, TweenInfo.new(0.15), options50):Play()
					local options51 = { BackgroundColor3 = options48.DarkBlue }
					TweenService2:Create(instance8, TweenInfo.new(0.15), options51):Play()
				end)
				instance8.MouseLeave:Connect(function()
					local options52 = { Color = options48.Stroke }
					TweenService2:Create(value223, TweenInfo.new(0.15), options52):Play()
					local options53 = { BackgroundColor3 = options48.DarkBlue }
					TweenService2:Create(instance9, TweenInfo.new(0.15), options53):Play()
					local options54 = { BackgroundColor3 = options48.BgPanel }
					TweenService2:Create(instance8, TweenInfo.new(0.15), options54):Play()
				end)
			else
				instance8.MouseEnter:Connect(function()
					local options55 = { BackgroundColor3 = color2 }
					TweenService2:Create(instance8, TweenInfo.new(0.15), options55):Play()
				end)
				instance8.MouseLeave:Connect(function()
					local options56 = { BackgroundColor3 = color }
					TweenService2:Create(instance8, TweenInfo.new(0.15), options56):Play()
				end)
			end
			instance8.MouseButton1Click:Connect(function()
				local options57 = { BackgroundColor3 = options48.LightBlue }
				TweenService2:Create(instance8, TweenInfo.new(0.08), options57):Play()
				task.delay(0.1, function()
					instance8.BackgroundColor3 = solid
				end)
				if _G.__4HubNotify then
					_G.__4HubNotify(name, "Activated")
				end
				if argument248 then
					task.spawn(argument248)
				end
			end)
			return instance8
		end
		local options58 = { Ragdoll = "N", Kick = "Y", Rejoin = "K", Reset = "X" }
		local Ragdoll = handleAction194("Ragdoll", 1, function()
			if _G.__4HubRagdollSelf then
				_G.__4HubRagdollSelf()
			end
		end)
		local Kick = handleAction194("Kick", 2, function()
			handleAction191()
		end)
		local Rejoin = handleAction194("Rejoin", 3, function()
			handleAction192()
		end)
		local Reset = handleAction194("Reset", 4, function()
			handleAction193()
		end)
		handleAction194("Settings", 5, function()
			if _G.__4HubToggleMenu then
				_G.__4HubToggleMenu()
			end
		end, { solid = true })
		local options59 = { Ragdoll = Ragdoll, Kick = Kick, Rejoin = Rejoin, Reset = Reset }
		_G.__4HubAPRefresh = function()
			for k, textControl2 in pairs(options59) do
				textControl2.Text = k .. ": " .. (_G.4HubKeys and _G.4HubKeys[k] or options58[k] or "None")
			end
		end
		_G.__4HubAPRefresh()
		_G.setActionsPanelHidden = function(argument250)
			screenGui2.Enabled = not argument250
		end
		if _G.__4HubRegisterDrag then
			_G.__4HubRegisterDrag(frame5, frame6, "ActionsPanelWin", UDim2.new(1, -16, 1, -16))
		end
		local entry76 = false
		local entry77 = false
		local tweenInfo = TweenInfo.new(0.26, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		local function handleAction195(argument251)
			if entry77 or argument251 == entry76 then
				return
			end
			entry77 = true
			entry76 = argument251
			local visible = not argument251
			instance7.Visible = visible
			frame7.Visible = visible
			instance5.Text = argument251 and "+" or "–"
			local tween = TweenService2:Create(frame5, tweenInfo, { Size = argument251 and UDim2.fromOffset(236, 42) or udim22 })
			tween:Play()
			tween.Completed:Once(function()
				if not argument251 then
					frame7.Visible = true
				end
				entry77 = false
			end)
		end
		instance5.MouseButton1Click:Connect(function()
			handleAction195(not entry76)
		end)
		instance5.MouseEnter:Connect(function()
			local options60 = { BackgroundColor3 = options48.BlueLine }
			TweenService2:Create(instance5, TweenInfo.new(0.12), options60):Play()
		end)
		instance5.MouseLeave:Connect(function()
			local options61 = { BackgroundColor3 = options48.DarkBlue }
			TweenService2:Create(instance5, TweenInfo.new(0.12), options61):Play()
		end)
		frame5.Size = UDim2.fromOffset(0, 0)
		instance4.Transparency = 1
		TweenService2:Create(frame5, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = udim22 }):Play()
		TweenService2:Create(instance4, TweenInfo.new(0.4), { Transparency = 0 }):Play()
	end
	handleAction189()
end
do
	local RunService2, localPlayer22, playerGui_, currentCamera, touchEnabled1
	task.spawn(function()
		if not game:IsLoaded() then
			game.Loaded:Wait()
		end
		local players16 = game:GetService("Players")
		local TweenService2 = game:GetService("TweenService")
		local UserInputService = game:GetService("UserInputService")
		UIS = UserInputService
		RunService = game:GetService("RunService")
		HttpService = game:GetService("HttpService")
		ReplicatedStorage = game:GetService("ReplicatedStorage")
		Workspace = game:GetService("Workspace")
		player = players16.LocalPlayer
		playerGui = player:WaitForChild("PlayerGui")
		CONFIG_FILE = "mynxx_invis_config.json"
		Config = {
			InvisStealAngle = 233,
			SinkSliderValue = 5,
			AutoRecoverLagback = true,
			WalkSpeedEnabled = false,
			WalkSpeedValue = 23,
			positions = {},
		}
		canUseFiles = function()
			return typeof(readfile) == "function" and typeof(writefile) == "function" and typeof(isfile) == "function"
		end
		loadConfig = function()
			if not canUseFiles() then
				return
			end
			local ok, result = pcall(function()
				if isfile(CONFIG_FILE) then
					return HttpService:JSONDecode(readfile(CONFIG_FILE))
				end
			end)
			if ok and type(result) == "table" then
				for k, value224 in pairs(result) do
					local matchesCondition4 = type(value224) == "table"
					if matchesCondition4 then
						local entry78 = "table"
						matchesCondition4 = type(Config[k]) == entry78
					end
					if matchesCondition4 then
						for k2, value225 in pairs(value224) do
							Config[k][k2] = value225
						end
					else
						Config[k] = value224
					end
				end
			end
		end
		saveConfig = function()
			if not canUseFiles() then
				return
			end
			task.spawn(function()
				pcall(function()
					writefile(CONFIG_FILE, HttpService:JSONEncode(Config))
				end)
			end)
		end
		loadConfig()
		serializePos = function(argument252)
			return { xs = argument252.X.Scale, xo = argument252.X.Offset, ys = argument252.Y.Scale, yo = argument252.Y.Offset }
		end
		rememberPosition = function(argument253, argument254)
			if not argument253 or not argument254 then
				return
			end
			Config.positions = Config.positions or {}
			Config.positions[argument253] = serializePos(argument254.Position)
			saveConfig()
		end
		applySavedPosition = function(argument255, argument256)
			if not argument255 or not argument256 then
				return
			end
			local positions = Config.positions and Config.positions[argument255]
			if positions then
				argument256.Position = UDim2.new(positions.xs or 0, positions.xo or 0, positions.ys or 0, positions.yo or 0)
			end
		end
		ToggleState = {}
		regToggle = function(argument257, argument258)
			if not ToggleState[argument257] then
				local entry79 = savedConfig.toggles[argument257]
				ToggleState[argument257] = { value = entry79 ~= nil and entry79 or argument258 or false, listeners = {} }
			end
		end
		getToggle = function(argument259)
			return ToggleState[argument259] and ToggleState[argument259].value or false
		end
		setToggle = function(argument260, value, argument261)
			regToggle(argument260)
			ToggleState[argument260].value = value
			savedConfig.toggles[argument260] = value and true or nil
			saveConfig()
			if not argument261 then
				for _, listener in ipairs(ToggleState[argument260].listeners) do
					pcall(listener, value)
				end
			end
		end
		onToggleChanged = function(argument262, argument263)
			regToggle(argument262)
			table.insert(ToggleState[argument262].listeners, argument263)
		end
		ShowNotification = function()
		end
		WalkSpeedState = { enabled = false, conn = nil, speed = Config.WalkSpeedValue or 16 }
		setWalkSpeedEnabled = function(enabled)
			WalkSpeedState.enabled = enabled
			Config.WalkSpeedEnabled = enabled
			setToggle("WalkSpeed", enabled)
			saveConfig()
			if WalkSpeedState.conn then
				WalkSpeedState.conn:Disconnect()
				WalkSpeedState.conn = nil
			end
			if not enabled then
				local character = player.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				if humanoidRootPart then
					pcall(function()
						_G.__4HubMoveStop(humanoidRootPart, false)
					end)
				end
				character = character and character:FindFirstChildOfClass("Humanoid")
				if character then
					pcall(function()
						character.WalkSpeed = 16
					end)
				end
				return
			end
			WalkSpeedState.conn = RunService.Heartbeat:Connect(function()
				if not WalkSpeedState.enabled then
					return
				end
				local character = player.Character
				if not character then
					return
				end
				local humanoid = character:FindFirstChildOfClass("Humanoid")
				local value226 = character:FindFirstChild("HumanoidRootPart")
				if not humanoid or humanoid.Health <= 0 or not value226 then
					return
				end
				local moveDirection = humanoid.MoveDirection
				if moveDirection.Magnitude > 0.05 then
					_G.__4HubMove(value226, moveDirection.X * WalkSpeedState.speed, moveDirection.Z * WalkSpeedState.speed)
				else
					_G.__4HubMove(value226, 0, 0)
				end
			end)
		end
		setWalkSpeedValue = function(argument264)
			local speed = math.clamp(math.floor(argument264 + 0.5), 15, 23)
			WalkSpeedState.speed = speed
			Config.WalkSpeedValue = speed
			saveConfig()
			return speed
		end
		animPlaying = false
		tracks = {}
		folderConnections = {}
		serverGhosts = {}
		ghostEnabled = true
		lagbackCallCount = 0
		lagbackWindowStart = 0
		lastLagbackTime = 0
		errorOrbActive = false
		errorOrb = nil
		errorOrbConnection = nil
		_G.invisibleStealEnabled = false
		_G.InvisStealAngle = Config.InvisStealAngle or 233
		_G.SinkSliderValue = Config.SinkSliderValue or 5
		_G.AutoRecoverLagback = Config.AutoRecoverLagback ~= nil and Config.AutoRecoverLagback or true
		clearErrorOrb = function()
			if errorOrb and errorOrb.Parent then
				errorOrb:Destroy()
			end
			errorOrb = nil
			errorOrbActive = false
			if errorOrbConnection then
				errorOrbConnection:Disconnect()
				errorOrbConnection = nil
			end
		end
		createErrorOrb = function()
			if errorOrbActive then
				return
			end
			errorOrbActive = true
			for _, value227 in pairs(serverGhosts) do
				if value227 and value227.Parent then
					value227:Destroy()
				end
			end
			serverGhosts = {}
		end
		createServerGhost = function(argument265)
			if not ghostEnabled or errorOrbActive then
				return
			end
			local now2 = tick()
			if now2 - lastLagbackTime < 0.01 then
				return
			end
			lastLagbackTime = now2
			if now2 - lagbackWindowStart > 1 then
				lagbackCallCount = 0
				lagbackWindowStart = now2
			end
			lagbackCallCount = lagbackCallCount + 1
			if lagbackCallCount >= 7 then
				createErrorOrb()
				return
			end
			for _, value228 in pairs(serverGhosts) do
				if value228 and value228.Parent then
					value228:Destroy()
				end
			end
			serverGhosts = {}
			local part = Instance.new("Part")
			part.Name = "LagbackGhost"
			part.Shape = Enum.PartType.Ball
			part.Size = Vector3.new(3, 3, 3)
			part.Color = Color3.fromRGB(255, 0, 0)
			part.Material = Enum.Material.Glass
			part.Transparency = 0.3
			part.CanCollide = false
			part.Anchored = true
			part.CastShadow = false
			part.Position = argument265 + Vector3.new(0, 5, 0)
			part.Parent = Workspace.CurrentCamera
			table.insert(serverGhosts, part)
		end
		clearAllGhosts = function()
			for _, value229 in pairs(serverGhosts) do
				pcall(function()
					if value229 and value229.Parent then
						value229:Destroy()
					end
				end)
			end
			serverGhosts = {}
			clearErrorOrb()
			lagbackCallCount = 0
			lastLagbackTime = 0
			pcall(function()
				local playerGui_2 = player:FindFirstChild("PlayerGui")
				if playerGui_2 then
					for _, child in pairs(playerGui_2:GetChildren()) do
						if child.Name == "LagbackNotification" then
							child:Destroy()
						end
					end
				end
			end)
			pcall(function()
				if Workspace.CurrentCamera then
					for _, child in pairs(Workspace.CurrentCamera:GetChildren()) do
						if child.Name == "LagbackGhost" then
							child:Destroy()
						end
					end
				end
			end)
			pcall(function()
				for _, descendant in pairs(Workspace:GetDescendants()) do
					if descendant.Name == "LagbackGhost" then
						descendant:Destroy()
					end
				end
			end)
		end
		removeFolders = function()
			local value230 = Workspace:FindFirstChild(player.Name)
			if not value230 then
				return
			end
			local doubleRig = value230:FindFirstChild("DoubleRig")
			if doubleRig then
				local humanoidRootPart = doubleRig:FindFirstChild("HumanoidRootPart") or doubleRig:FindFirstChildWhichIsA("BasePart")
				if humanoidRootPart and ghostEnabled then
					createServerGhost(humanoidRootPart.Position)
				end
				doubleRig:Destroy()
			end
			local constraints = value230:FindFirstChild("Constraints")
			if constraints then
				constraints:Destroy()
			end
			local connection_ = value230.ChildAdded:Connect(function(child)
				if child.Name == "DoubleRig" then
					task.defer(function()
						local basePart = child:FindFirstChild("HumanoidRootPart") or child:FindFirstChildWhichIsA("BasePart")
						if basePart and ghostEnabled then
							createServerGhost(basePart.Position)
						end
						child:Destroy()
					end)
				elseif child.Name == "Constraints" then
					child:Destroy()
				end
			end)
			table.insert(folderConnections, connection_)
		end
		doClone = function()
			local character = player.Character
			if character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
				hip = character.Humanoid.HipHeight
				oldRoot = character:FindFirstChild("HumanoidRootPart")
				if not oldRoot or not oldRoot.Parent then
					return false
				end
				for _, child in pairs(oldRoot:GetChildren()) do
					if child:IsA("Attachment") and (child.Name:find("Beam") or child.Name:find("Attach")) then
						child:Destroy()
					end
				end
				for _, child in pairs(oldRoot:GetChildren()) do
					if child:IsA("Beam") then
						child:Destroy()
					end
				end
				local instance4 = Instance.new("Model")
				instance4.Parent = game
				character.Parent = instance4
				clone = oldRoot:Clone()
				clone.Parent = character
				pcall(function()
					clone.Transparency = 1
					clone.CanCollide = false
					clone.CastShadow = false
				end)
				pcall(function()
					oldRoot.Transparency = 1
					oldRoot.CastShadow = false
				end)
				oldRoot.Parent = Workspace.CurrentCamera
				clone.CFrame = oldRoot.CFrame
				character.PrimaryPart = clone
				character.Parent = Workspace
				for _, descendant in pairs(character:GetDescendants()) do
					if descendant:IsA("Weld") or descendant:IsA("Motor6D") then
						if descendant.Part0 == oldRoot then
							descendant.Part0 = clone
						end
						if descendant.Part1 == oldRoot then
							descendant.Part1 = clone
						end
					end
				end
				instance4:Destroy()
				return true
			end
			return false
		end
		revertClone = function()
			local character = player.Character
			if not character then
				clearAllGhosts()
				return
			end
			if oldRoot and oldRoot:IsDescendantOf(game) then
				pcall(function()
					local model = Instance.new("Model")
					model.Parent = game
					character.Parent = model
					oldRoot.Parent = character
					character.PrimaryPart = oldRoot
					character.Parent = Workspace
					oldRoot.CanCollide = true
					oldRoot.Anchored = false
					for _, descendant in pairs(character:GetDescendants()) do
						if descendant:IsA("Weld") or descendant:IsA("Motor6D") then
							if descendant.Part0 == clone then
								descendant.Part0 = oldRoot
							end
							if descendant.Part1 == clone then
								descendant.Part1 = oldRoot
							end
						end
					end
					local cFrame = nil
					if clone then
						cFrame = clone.CFrame
						pcall(function()
							clone:Destroy()
						end)
						clone = nil
					end
					if cFrame then
						pcall(function()
							oldRoot.CFrame = cFrame
						end)
					end
					model:Destroy()
				end)
			end
			oldRoot = nil
			if clone then
				pcall(function()
					clone:Destroy()
				end)
				clone = nil
			end
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				pcall(function()
					humanoid.HipHeight = hip or humanoid.HipHeight
				end)
				pcall(function()
					humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
				end)
				task.defer(function()
					if humanoid and humanoid.Parent then
						pcall(function()
							humanoid:ChangeState(Enum.HumanoidStateType.Running)
						end)
					end
				end)
			end
			for _, descendant in ipairs(character:GetDescendants()) do
				if descendant:IsA("BasePart") then
					pcall(function()
						descendant.Anchored = false
					end)
					pcall(function()
						descendant.LocalTransparencyModifier = 0
					end)
				end
			end
			clearAllGhosts()
		end
		animationTrickery = function()
			local character = player.Character
			if character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
				local animation = Instance.new("Animation")
				animation.AnimationId = "http://www.roblox.com/asset/?id=18537363391"
				local humanoid = character.Humanoid
				local value231 = (humanoid:FindFirstChild("Animator") or Instance.new("Animator", humanoid)):LoadAnimation(animation)
				value231.Priority = Enum.AnimationPriority.Action4
				value231:Play(0, 1, 0)
				animation:Destroy()
				table.insert(tracks, value231)
				value231.Stopped:Connect(function()
					if animPlaying then
						animationTrickery()
					end
				end)
				task.delay(0, function()
					value231.TimePosition = 0.7
					task.delay(0.3, function()
						if value231 then
							value231:AdjustSpeed(math.huge)
						end
					end)
				end)
			end
		end
		selfVisConn = nil
		_selfOrigT = _selfOrigT or {}
		captureSelfTransparency = function(argument266)
			local character = argument266 or player.Character
			_selfOrigT = {}
			if not character then
				return
			end
			for _, descendant in ipairs(character:GetDescendants()) do
				if descendant:IsA("BasePart") then
					_selfOrigT[descendant] = descendant.Name == "HumanoidRootPart" and 1 or descendant.Transparency
				elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
					_selfOrigT[descendant] = descendant.Transparency
				end
			end
		end
		forceSelfVisible = function(argument267)
			local character = argument267 or player.Character
			if not character then
				return
			end
			for _, descendant in ipairs(character:GetDescendants()) do
				if descendant:IsA("BasePart") then
					pcall(function()
						descendant.LocalTransparencyModifier = 0
						local transparency = _selfOrigT[descendant]
						if transparency == nil then
							transparency = descendant.Name == "HumanoidRootPart" and 1 or 0
						end
						if descendant.Name ~= "HumanoidRootPart" and descendant.Transparency > transparency then
							descendant.Transparency = transparency
						end
					end)
				elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
					pcall(function()
						descendant.LocalTransparencyModifier = 0
						local entry80 = _selfOrigT[descendant] or 0
						if entry80 < descendant.Transparency then
							descendant.Transparency = entry80
						end
					end)
				end
			end
		end
		_invisToggleCooldown = 0
		invisTurnOff = function()
			clearAllGhosts()
			if not animPlaying then
				return
			end
			local character = player.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			animPlaying = false
			_G.invisibleStealEnabled = false
			setToggle("Invisible Steal", false)
			for _, value232 in pairs(tracks) do
				pcall(function()
					value232:Stop(0)
				end)
			end
			tracks = {}
			if connection then
				connection:Disconnect()
				connection = nil
			end
			if selfVisConn then
				selfVisConn:Disconnect()
				selfVisConn = nil
			end
			if _selfDescConn then
				_selfDescConn:Disconnect()
				_selfDescConn = nil
			end
			for _, connection8 in ipairs(folderConnections) do
				if connection8 then
					connection8:Disconnect()
				end
			end
			folderConnections = {}
			revertClone()
			clearAllGhosts()
			for i = 1, 3 do
				forceSelfVisible(player.Character)
				task.wait(0.05)
			end
			if humanoid then
				pcall(function()
					local animator = humanoid:FindFirstChildOfClass("Animator")
					if animator then
						for _, value233 in ipairs(animator:GetPlayingAnimationTracks()) do
							if value233.Priority == Enum.AnimationPriority.Action4 or value233.Priority == Enum.AnimationPriority.Action3 then
								value233:Stop(0)
							end
						end
					end
					humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
					task.defer(function()
						if humanoid and humanoid.Parent then
							humanoid:ChangeState(Enum.HumanoidStateType.Running)
						end
					end)
				end)
			end
			if WalkSpeedState and WalkSpeedState.enabled and Config.WalkSpeedEnabled then
				setWalkSpeedEnabled(false)
			end
			_invisToggleCooldown = tick()
		end
		invisTurnOn = function()
			if animPlaying then
				return
			end
			local character = player.Character
			if not character then
				return
			end
			if not character:FindFirstChildOfClass("Humanoid") then
				return
			end
			animPlaying = true
			_G.invisibleStealEnabled = true
			setToggle("Invisible Steal", true)
			tracks = {}
			removeFolders()
			captureSelfTransparency(character)
			if doClone() then
				task.wait(0.05)
				animationTrickery()
				if selfVisConn then
					selfVisConn:Disconnect()
				end
				if _selfDescConn then
					_selfDescConn:Disconnect()
				end
				_selfDescConn = character.DescendantAdded:Connect(function(descendant)
					if not _G.invisibleStealEnabled then
						return
					end
					if descendant:IsA("BasePart") then
						_selfOrigT[descendant] = descendant.Name == "HumanoidRootPart" and 1 or descendant.Transparency
					elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
						_selfOrigT[descendant] = descendant.Transparency
					end
				end)
				selfVisConn = RunService.RenderStepped:Connect(function()
					if _G.__4HubDead then
						if selfVisConn then
							selfVisConn:Disconnect()
						end
						return
					end
					if _G.invisibleStealEnabled then
						forceSelfVisible(player.Character)
						local currentCamera2 = Workspace.CurrentCamera
						local character2 = player.Character
						local humanoid = character2 and character2:FindFirstChildOfClass("Humanoid")
						if currentCamera2 and humanoid and currentCamera2.CameraSubject ~= humanoid then
							pcall(function()
								currentCamera2.CameraSubject = humanoid
							end)
						end
					end
				end)
				local position = nil
				local entry81 = 5
				connection = RunService.PreSimulation:Connect(function()
					if _G.__4HubDead then
						if connection then
							connection:Disconnect()
						end
						return
					end
					if character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 and oldRoot then
						local primaryPart = character.PrimaryPart or character:FindFirstChild("HumanoidRootPart")
						if primaryPart then
							if entry81 > 0 then
								entry81 -= 1
								position = nil
							elseif position and ghostEnabled then
								local position2 = oldRoot.Position
								if (position2 - position).Magnitude > 3 and not _G.RecoveryInProgress then
									position = nil
									createServerGhost(position2)
									if _G.AutoRecoverLagback and _G._forceInvisToggle then
										_G.RecoveryInProgress = true
										task.spawn(function()
											pcall(_G._forceInvisToggle)
											task.wait(0.6)
											if player:GetAttribute("Stealing") then
												pcall(_G._forceInvisToggle)
											end
											_G.RecoveryInProgress = false
										end)
									end
								end
							end
							if clone then
								clone.CanCollide = true
							end
							if oldRoot and oldRoot.Parent then
								for _, child in pairs(oldRoot:GetChildren()) do
									if child:IsA("Attachment") or child:IsA("Beam") then
										child:Destroy()
									end
								end
								local number47 = primaryPart.CFrame - Vector3.new(0, (_G.SinkSliderValue or 5) * 0.5, 0)
								local part2 = oldRoot
								local cframe = CFrame.Angles
								local rad = math.rad
								local invisStealAngle = _G.InvisStealAngle or 233
								local entry82 = 0
								part2.CFrame = number47 * cframe(rad(invisStealAngle), 0, entry82)
								oldRoot.AssemblyLinearVelocity = primaryPart.AssemblyLinearVelocity
								oldRoot.CanCollide = false
								position = oldRoot.Position
							end
						end
					end
				end)
			end
		end
		_G.toggleInvisibleSteal = function()
			local value234 = _invisToggleCooldown
			if tick() - value234 < 0.3 then
				return
			end
			if animPlaying then
				invisTurnOff()
			else
				invisTurnOn()
			end
		end
		_G._forceInvisToggle = function()
			if animPlaying then
				invisTurnOff()
			else
				invisTurnOn()
			end
		end
		player.CharacterAdded:Connect(function(character)
			task.wait(0.1)
			clearErrorOrb()
			clearAllGhosts()
			lagbackCallCount = 0
			pcall(function()
				for _, child in pairs(Workspace.CurrentCamera:GetChildren()) do
					if child:IsA("BasePart") and child.Name == "HumanoidRootPart" then
						child:Destroy()
					end
				end
			end)
			if oldRoot then
				pcall(function()
					oldRoot:Destroy()
				end)
				oldRoot = nil
			end
			if clone then
				pcall(function()
					clone:Destroy()
				end)
				clone = nil
			end
			if selfVisConn then
				selfVisConn:Disconnect()
				selfVisConn = nil
			end
			if _selfDescConn then
				_selfDescConn:Disconnect()
				_selfDescConn = nil
			end
			if connection then
				connection:Disconnect()
				connection = nil
			end
			animPlaying = false
			_G.invisibleStealEnabled = false
			setToggle("Invisible Steal", false)
			task.spawn(function()
				for i = 1, 4 do
					forceSelfVisible(character)
					task.wait(0.1)
				end
			end)
			task.wait(0.2)
			local currentCamera2 = Workspace.CurrentCamera
			if currentCamera2 and character then
				local value235 = character:FindFirstChildOfClass("Humanoid")
				if value235 then
					currentCamera2.CameraSubject = value235
					currentCamera2.CameraType = Enum.CameraType.Custom
				end
			end
		end)
		setupDeathListener = function()
			local character = player.Character
			if character then
				local humanoid = character:FindFirstChildOfClass("Humanoid")
				if humanoid then
					humanoid.Died:Connect(function()
						clearErrorOrb()
						clearAllGhosts()
						lagbackCallCount = 0
					end)
				end
			end
		end
		setupDeathListener()
		player.CharacterAdded:Connect(function()
			task.wait(0.1)
			setupDeathListener()
		end)
		task.spawn(function()
			_G.AntiDieDisabled = false
			local function setupAntiDie()
				if _G.AntiDieDisabled then
					return
				end
				local character = player.Character
				if not character then
					return
				end
				local humanoid = character:FindFirstChildOfClass("Humanoid")
				if not humanoid then
					return
				end
				if _G.AntiDieConnection then
					pcall(function()
						_G.AntiDieConnection:Disconnect()
					end)
				end
				_G.AntiDieConnection = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
					if _G.AntiDieDisabled then
						return
					end
					if humanoid.Health <= 0 then
						humanoid.Health = humanoid.MaxHealth
					end
				end)
			end
			_G.setupAntiDie = setupAntiDie
			setupAntiDie()
			player.CharacterAdded:Connect(function()
				task.wait(0.5)
				if not _G.AntiDieDisabled then
					setupAntiDie()
				end
			end)
		end)
		local options62 = {
			Black = Color3.fromRGB(6, 8, 14),
			BgDark = Color3.fromRGB(9, 13, 24),
			BgPanel = Color3.fromRGB(13, 20, 38),
			Stroke = Color3.fromRGB(30, 46, 82),
			DarkBlue = Color3.fromRGB(18, 38, 78),
			LightBlue = Color3.fromRGB(92, 165, 255),
			BlueLine = Color3.fromRGB(60, 120, 220),
			White = Color3.fromRGB(255, 255, 255),
			TextDim = Color3.fromRGB(150, 165, 195),
			ToggleOff = Color3.fromRGB(40, 52, 82),
		}
		local gothamMedium2 = Enum.Font.GothamMedium
		local gothamBold2 = Enum.Font.GothamBold
		local entry83 = false
		local function createUICorner2(parent, argument268)
			local uiCorner = Instance.new("UICorner")
			uiCorner.CornerRadius = UDim.new(0, argument268 or 8)
			uiCorner.Parent = parent
			return uiCorner
		end
		local function handleAction196(parent, color, thickness)
			local instance4 = Instance.new("UIStroke")
			instance4.Color = color or options62.Stroke
			instance4.Thickness = thickness or 1
			instance4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			instance4.Parent = parent
			return instance4
		end
		local mynxxInvisSteal = playerGui:FindFirstChild("MynxxInvisSteal")
		if mynxxInvisSteal then
			mynxxInvisSteal:Destroy()
		end
		local instance4 = Instance.new("ScreenGui")
		instance4.Name = "MynxxInvisSteal"
		instance4.ResetOnSpawn = false
		instance4.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		instance4.IgnoreGuiInset = true
		instance4.Parent = playerGui
		local udim22 = UDim2.fromOffset(232, 325)
		local frame5 = Instance.new("Frame")
		frame5.Name = "Window"
		frame5.AnchorPoint = Vector2.new(0.5, 0.5)
		frame5.Size = udim22
		frame5.Position = UDim2.new(0, 80, 1, -186.5)
		frame5.BackgroundColor3 = options62.BgDark
		frame5.BorderSizePixel = 0
		frame5.ClipsDescendants = true
		frame5.Active = true
		frame5.Parent = instance4
		if _G.__4HubRegisterScale then
			_G.__4HubRegisterScale(frame5)
		end
		createUICorner2(frame5, 12)
		applySavedPosition("InvisStealWindowBL", frame5)
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Rotation = 90
		local new = ColorSequenceKeypoint.new
		local bgDark = options62.BgDark
		uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, options62.Black), new(1, bgDark) })
		uiGradient.Parent = frame5
		local instance5 = Instance.new("UIStroke")
		instance5.Thickness = 1.5
		instance5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		instance5.Parent = frame5
		local uiGradient2 = Instance.new("UIGradient")
		local colorSequence = ColorSequence.new
		local items58 = {}
		local value236 = ColorSequenceKeypoint.new(0, options62.DarkBlue)
		local value237 = ColorSequenceKeypoint.new(0.5, options62.LightBlue)
		local new2 = ColorSequenceKeypoint.new
		local darkBlue = options62.DarkBlue
		items58[1] = value236
		items58[2] = value237
		do
			local values = table.pack(new2(1, darkBlue))
			table.move(values, 1, values.n, 3, items58)
		end
		uiGradient2.Color = colorSequence(items58)
		uiGradient2.Parent = instance5
		_G.__4HubSpin(uiGradient2, 90, function()
			return instance4.Parent ~= nil
		end)
		local frame6 = Instance.new("Frame")
		frame6.Name = "Header"
		frame6.Size = UDim2.new(1, 0, 0, 40)
		frame6.BackgroundTransparency = 1
		frame6.Parent = frame5
		local textButton3 = Instance.new("TextButton")
		textButton3.Name = "Minimise"
		textButton3.AnchorPoint = Vector2.new(1, 0)
		textButton3.Position = UDim2.new(1, -11, 0, 10)
		textButton3.Size = UDim2.fromOffset(20, 20)
		textButton3.BackgroundColor3 = options62.DarkBlue
		textButton3.AutoButtonColor = false
		textButton3.Font = gothamBold2
		textButton3.Text = "–"
		textButton3.TextColor3 = options62.LightBlue
		textButton3.TextSize = 18
		textButton3.ZIndex = 6
		textButton3.Parent = frame6
		createUICorner2(textButton3, 6)
		handleAction196(textButton3, options62.LightBlue, 1)
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "Title"
		textLabel.Size = UDim2.new(1, -72, 0, 40)
		textLabel.Position = UDim2.fromOffset(36, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Font = gothamBold2
		textLabel.Text = "Invisible Steal"
		textLabel.TextColor3 = options62.White
		textLabel.TextSize = 15
		textLabel.TextXAlignment = Enum.TextXAlignment.Center
		textLabel.Parent = frame6
		local instance6 = Instance.new("Frame")
		instance6.Name = "HeaderLine"
		instance6.Size = UDim2.new(1, -28, 0, 2)
		instance6.Position = UDim2.new(0, 14, 0, 38)
		instance6.BackgroundColor3 = options62.BlueLine
		instance6.BorderSizePixel = 0
		instance6.Parent = frame5
		createUICorner2(instance6, 1)
		local uiGradient3 = Instance.new("UIGradient")
		local colorSequence2 = ColorSequence.new
		local items59 = {}
		local value238 = ColorSequenceKeypoint.new(0, options62.DarkBlue)
		local value239 = ColorSequenceKeypoint.new(0.5, options62.LightBlue)
		local new3 = ColorSequenceKeypoint.new
		local darkBlue2 = options62.DarkBlue
		items59[1] = value238
		items59[2] = value239
		do
			local values = table.pack(new3(1, darkBlue2))
			table.move(values, 1, values.n, 3, items59)
		end
		uiGradient3.Color = colorSequence2(items59)
		uiGradient3.Parent = instance6
		local scrollingFrame = Instance.new("ScrollingFrame")
		scrollingFrame.Name = "Body"
		scrollingFrame.Position = UDim2.fromOffset(0, 46)
		scrollingFrame.Size = UDim2.new(1, 0, 1, -46)
		scrollingFrame.BackgroundTransparency = 1
		scrollingFrame.BorderSizePixel = 0
		scrollingFrame.ScrollBarThickness = 0
		scrollingFrame.ScrollingEnabled = false
		scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		scrollingFrame.Parent = frame5
		local uiPadding = Instance.new("UIPadding")
		uiPadding.PaddingLeft = UDim.new(0, 11)
		uiPadding.PaddingRight = UDim.new(0, 11)
		uiPadding.PaddingBottom = UDim.new(0, 10)
		uiPadding.Parent = scrollingFrame
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.Padding = UDim.new(0, 7)
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.Parent = scrollingFrame
		local entry84 = 0
		local function handleAction197()
			entry84 += 1
			return entry84
		end
		local function handleAction198(argument269, layoutOrder)
			local instance7 = Instance.new("Frame")
			instance7.Size = UDim2.new(1, 0, 0, argument269)
			instance7.BackgroundColor3 = options62.BgDark
			instance7.BorderSizePixel = 0
			instance7.LayoutOrder = layoutOrder
			instance7.Parent = scrollingFrame
			createUICorner2(instance7, 8)
			local value240 = handleAction196(instance7, options62.Stroke, 1)
			local frame7 = Instance.new("Frame")
			frame7.Size = UDim2.new(0, 3, 0.55, 0)
			frame7.Position = UDim2.new(0, 0, 0.225, 0)
			frame7.BackgroundColor3 = options62.DarkBlue
			frame7.BorderSizePixel = 0
			frame7.Parent = instance7
			createUICorner2(frame7, 2)
			local textButton4 = Instance.new("TextButton")
			textButton4.Size = UDim2.new(1, 0, 1, 0)
			textButton4.BackgroundTransparency = 1
			textButton4.Text = ""
			textButton4.ZIndex = 0
			textButton4.Parent = instance7
			textButton4.MouseEnter:Connect(function()
				if entry83 then
					return
				end
				local options63 = { Color = options62.LightBlue }
				TweenService2:Create(value240, TweenInfo.new(0.15), options63):Play()
				local options64 = { BackgroundColor3 = options62.LightBlue }
				TweenService2:Create(frame7, TweenInfo.new(0.15), options64):Play()
			end)
			textButton4.MouseLeave:Connect(function()
				local options65 = { Color = options62.Stroke }
				TweenService2:Create(value240, TweenInfo.new(0.15), options65):Play()
				local options66 = { BackgroundColor3 = options62.DarkBlue }
				TweenService2:Create(frame7, TweenInfo.new(0.15), options66):Play()
			end)
			return instance7
		end
		local function handleAction199(text, argument270, argument271, argument272)
			regToggle(argument270, argument271)
			setToggle(argument270, getToggle(argument270), true)
			local value241 = handleAction198(32, handleAction197())
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.Size = UDim2.new(1, -66, 1, 0)
			textLabel2.Position = UDim2.fromOffset(12, 0)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Font = gothamMedium2
			textLabel2.Text = text
			textLabel2.TextColor3 = options62.White
			textLabel2.TextSize = 13
			textLabel2.TextXAlignment = Enum.TextXAlignment.Left
			textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel2.Parent = value241
			local textButton4 = Instance.new("TextButton")
			textButton4.AnchorPoint = Vector2.new(1, 0.5)
			textButton4.Position = UDim2.new(1, -12, 0.5, 0)
			textButton4.Size = UDim2.fromOffset(40, 20)
			textButton4.AutoButtonColor = false
			textButton4.Text = ""
			textButton4.Parent = value241
			createUICorner2(textButton4, 10)
			local frame7 = Instance.new("Frame")
			frame7.Size = UDim2.fromOffset(14, 14)
			frame7.BackgroundColor3 = options62.White
			frame7.BorderSizePixel = 0
			frame7.Parent = textButton4
			createUICorner2(frame7, 7)
			local function handleAction200(argument273)
				local lightBlue = _G.__4HubAccentCur and _G.__4HubAccentCur.LightBlue or options62.LightBlue
				TweenService2:Create(textButton4, TweenInfo.new(0.18), { BackgroundColor3 = argument273 and lightBlue or options62.ToggleOff }):Play()
				TweenService2:Create(frame7, TweenInfo.new(0.18, Enum.EasingStyle.Quad), { Position = argument273 and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7) }):Play()
			end
			handleAction200(getToggle(argument270))
			onToggleChanged(argument270, function(argument274)
				handleAction200(argument274)
			end)
			if _G.__4HubOnTheme then
				_G.__4HubOnTheme(function()
					handleAction200(getToggle(argument270))
				end)
			end
			if getToggle(argument270) and argument272 then
				task.spawn(function()
					if argument270 == "Invisible Steal" then
						while true do
							task.wait(0.2)
							if not (player.Character and player.Character:FindFirstChildOfClass("Humanoid")) then
								continue
							end
							break
						end
						task.wait(1)
						if not _G.invisibleStealEnabled then
							argument272(true)
						end
					else
						argument272(true)
					end
				end)
			end
			textButton4.MouseButton1Click:Connect(function()
				local enabled42 = not getToggle(argument270)
				setToggle(argument270, enabled42)
				if _G.__4HubNotify then
					_G.__4HubNotify(text, enabled42 and "Enabled" or "Disabled")
				end
				if argument272 then
					task.spawn(argument272, enabled42)
				end
			end)
		end
		local function handleAction201(text, argument275, argument276, argument277, argument278, argument279, argument280)
			local value242 = handleAction198(46, handleAction197())
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.Size = UDim2.new(1, -24, 0, 16)
			textLabel2.Position = UDim2.fromOffset(12, 6)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Font = gothamMedium2
			textLabel2.Text = text
			textLabel2.TextColor3 = options62.White
			textLabel2.TextSize = 12
			textLabel2.TextXAlignment = Enum.TextXAlignment.Left
			textLabel2.Parent = value242
			local textLabel3 = Instance.new("TextLabel")
			textLabel3.Size = UDim2.new(0, 60, 0, 16)
			textLabel3.Position = UDim2.new(1, -70, 0, 6)
			textLabel3.BackgroundTransparency = 1
			textLabel3.Font = gothamBold2
			textLabel3.Text = tostring(argument277) .. (argument279 or "")
			textLabel3.TextColor3 = options62.White
			textLabel3.TextSize = 12
			textLabel3.TextXAlignment = Enum.TextXAlignment.Right
			textLabel3.Parent = value242
			local instance7 = Instance.new("Frame")
			instance7.Size = UDim2.new(1, -24, 0, 4)
			instance7.Position = UDim2.new(0, 12, 0, 32)
			instance7.BackgroundColor3 = options62.ToggleOff
			instance7.BorderSizePixel = 0
			instance7.Parent = value242
			createUICorner2(instance7, 4)
			local frame7 = Instance.new("Frame")
			frame7.Size = UDim2.new(math.clamp((argument277 - argument275) / (argument276 - argument275), 0, 1), 0, 1, 0)
			frame7.BackgroundColor3 = options62.LightBlue
			frame7.BorderSizePixel = 0
			frame7.Parent = instance7
			createUICorner2(frame7, 4)
			local frame8 = Instance.new("Frame")
			frame8.Size = UDim2.fromOffset(12, 12)
			frame8.AnchorPoint = Vector2.new(0.5, 0.5)
			frame8.Position = UDim2.new(math.clamp((argument277 - argument275) / (argument276 - argument275), 0, 1), 0, 0.5, 0)
			frame8.BackgroundColor3 = options62.White
			frame8.BorderSizePixel = 0
			frame8.ZIndex = 2
			frame8.Parent = instance7
			createUICorner2(frame8, 6)
			local enabled43 = false
			local function handleAction202(argument281)
				local number48 = math.clamp((argument281 - instance7.AbsolutePosition.X) / instance7.AbsoluteSize.X, 0, 1)
				local number49 = math.floor((argument275 + (argument276 - argument275) * number48) * 10 + 0.5) / 10
				frame7.Size = UDim2.new(number48, 0, 1, 0)
				frame8.Position = UDim2.new(number48, 0, 0.5, 0)
				local textControl3 = textLabel3
				local text16 = tostring(number49)
				local argument2791 = argument279
				local argument27911
				if argument279 then
					argument27911 = argument2791
				else
					argument27911 = ""
				end
				textControl3.Text = text16 .. argument27911
				if argument278 then
					argument278(number49)
				end
			end
			local textButton4 = Instance.new("TextButton")
			textButton4.Size = UDim2.new(1, -24, 0, 20)
			textButton4.Position = UDim2.new(0, 12, 0, 24)
			textButton4.BackgroundTransparency = 1
			textButton4.Text = ""
			textButton4.Parent = value242
			textButton4.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					enabled43 = true
					_G.__4HubSliderDragging = true
					handleAction202(input.Position.X)
				end
			end)
			UIS.InputEnded:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and enabled43 then
					enabled43 = false
					_G.__4HubSliderDragging = false
					if argument280 then
						argument280()
					end
					if _G.__4HubNotify then
						_G.__4HubNotify(text, "Set to " .. textLabel3.Text)
					end
				end
			end)
			UIS.InputChanged:Connect(function(input)
				if enabled43 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					handleAction202(input.Position.X)
				end
			end)
		end
		setWalkSpeedValue(math.min(Config.WalkSpeedValue or 23, 23))
		handleAction199("Enabled", "Invisible Steal", false, function()
			if _G.toggleInvisibleSteal then
				pcall(_G.toggleInvisibleSteal)
			end
		end)
		handleAction201("Rotation", 0, 360, Config.InvisStealAngle or 233, function(invisStealAngle)
			_G.InvisStealAngle = invisStealAngle
			Config.InvisStealAngle = invisStealAngle
		end, "", saveConfig)
		handleAction201("Depth", 0, 18, Config.SinkSliderValue or 5, function(sinkSliderValue)
			_G.SinkSliderValue = sinkSliderValue
			Config.SinkSliderValue = sinkSliderValue
		end, "", saveConfig)
		handleAction201("Walk Speed", 15, 23, math.min(Config.WalkSpeedValue or 23, 23), function(argument282)
			local speed = math.clamp(math.floor(argument282 + 0.5), 15, 23)
			WalkSpeedState.speed = speed
			Config.WalkSpeedValue = speed
		end, "", saveConfig)
		handleAction199("Auto Recover", "Auto Recover Lagback", true, function(autoRecoverLagback)
			_G.AutoRecoverLagback = autoRecoverLagback
			Config.AutoRecoverLagback = autoRecoverLagback
			saveConfig()
		end)
		handleAction199("WalkSpeed", "WalkSpeed", false, function(argument283)
			setWalkSpeedEnabled(argument283)
		end)
		_G.__4HubToggleWalkSpeed = function()
			setWalkSpeedEnabled(not WalkSpeedState.enabled)
		end
		if Config.WalkSpeedEnabled then
			task.defer(function()
				setWalkSpeedEnabled(true)
			end)
		end
		local position = nil
		local position2 = nil
		frame6.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				entry83 = true
				position = input.Position
				position2 = frame5.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						entry83 = false
						rememberPosition("InvisStealWindowBL", frame5)
					end
				end)
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if entry83 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				local number50 = input.Position - position
				TweenService2:Create(frame5, TweenInfo.new(0.06, Enum.EasingStyle.Linear), { Position = UDim2.new(position2.X.Scale, position2.X.Offset + number50.X, position2.Y.Scale, position2.Y.Offset + number50.Y) }):Play()
			end
		end)
		local enabled44 = false
		local enabled45 = false
		local tweenInfo = TweenInfo.new(0.26, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		local function handleAction203(argument284)
			if enabled45 or argument284 == enabled44 then
				return
			end
			enabled45 = true
			enabled44 = argument284
			local udim23 = argument284 and UDim2.fromOffset(232, 40) or udim22
			instance6.Visible = not argument284
			textButton3.Text = argument284 and "+" or "–"
			local tween = TweenService2:Create(frame5, tweenInfo, { Size = udim23 })
			tween:Play()
			tween.Completed:Once(function()
				if not argument284 then
					instance6.Visible = true
				end
				enabled45 = false
			end)
		end
		textButton3.MouseButton1Click:Connect(function()
			handleAction203(not enabled44)
		end)
		textButton3.MouseEnter:Connect(function()
			local options67 = { BackgroundColor3 = options62.BlueLine }
			TweenService2:Create(textButton3, TweenInfo.new(0.12), options67):Play()
		end)
		textButton3.MouseLeave:Connect(function()
			local options68 = { BackgroundColor3 = options62.DarkBlue }
			TweenService2:Create(textButton3, TweenInfo.new(0.12), options68):Play()
		end)
		_G.setInvisStealHidden = function(argument285)
			if instance4 then
				instance4.Enabled = not argument285
			end
		end
		frame5.Size = UDim2.fromOffset(0, 0)
		instance5.Transparency = 1
		TweenService2:Create(frame5, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = udim22 }):Play()
		TweenService2:Create(instance5, TweenInfo.new(0.4), { Transparency = 0 }):Play()
	end)
	task.spawn(function()
		local service16 = game:GetService("Players")
		local Workspace2 = game:GetService("Workspace")
		local service17 = game:GetService("RunService")
		local CoreGui = game:GetService("CoreGui")
		local TweenService2 = game:GetService("TweenService")
		local localPlayer23 = service16.LocalPlayer
		_G._FORMEGA_GEN = (_G._FORMEGA_GEN or 0) + 1
		local formegaGen = _G._FORMEGA_GEN
		local function handleAction204()
			return formegaGen ~= _G._FORMEGA_GEN
		end
		local enabled46 = true
		local value243 = fireproximityprompt
		local value244 = getconnections
		local function handleAction205()
			local character = localPlayer23.Character
			return character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso"))
		end
		local function handleAction206(argument286)
			if not argument286 or argument286 == "" then
				return "Brainrot"
			end
			local items60 = {}
			for match in string.gmatch(argument286:lower(), "%S+") do
				table.insert(items60, string.upper(string.sub(match, 1, 1)) .. string.sub(match, 2))
			end
			return table.concat(items60, " ")
		end
		local function handleAction207()
			return false
		end
		local function handleAction208()
			local ok, result = pcall(function()
				return localPlayer23:GetAttribute("Stealing")
			end)
			return ok and result == true
		end
		local function handleAction209(argument287)
			if not argument287 then
				return false
			end
			return string.find(string.lower(argument287.ObjectText or ""), "brainrot") ~= nil
		end
		local function handleAction210(argument288)
			if not argument288 or not argument288.Parent or not argument288.Enabled then
				return false
			end
			local attribute = argument288:GetAttribute("State")
			local actionText = argument288.ActionText
			return attribute == "Steal" or attribute == "Grab" or actionText == "Steal" or actionText == "Grab"
		end
		local items61 = {}
		local number51 = 0
		local function handleAction211()
			local items62 = {}
			local plots = Workspace2:FindFirstChild("Plots")
			if plots then
				for _, child in pairs(plots:GetChildren()) do
					if not handleAction207() then
						local animalPodiums = child:FindFirstChild("AnimalPodiums")
						if animalPodiums then
							for _, child2 in pairs(animalPodiums:GetChildren()) do
								local base = child2:FindFirstChild("Base")
								base = base and base:FindFirstChild("Spawn")
								base = base and base:FindFirstChild("PromptAttachment")
								if base then
									for _, child3 in pairs(base:GetChildren()) do
										if child3:IsA("ProximityPrompt") then
											items62[#items62 + 1] = child3
										end
									end
								end
							end
						end
					end
				end
			end
			items61 = items62
		end
		task.spawn(function()
			local plots = Workspace2:WaitForChild("Plots", 30)
			if not plots then
				return
			end
			plots.DescendantAdded:Connect(function(descendant)
				if not descendant:IsA("ProximityPrompt") then
					return
				end
				local animalPodiums = descendant:FindFirstAncestor("AnimalPodiums")
				if animalPodiums and animalPodiums.Parent and not handleAction207() then
					items61[#items61 + 1] = descendant
				end
			end)
		end)
		local function handleAction212()
			local value245 = handleAction205()
			if not value245 then
				return nil, nil, false
			end
			if tick() - number51 > 0.4 then
				number51 = tick()
				handleAction211()
			end
			local huge = math.huge
			local huge2 = math.huge
			local entry85 = false
			local value246 = nil
			local value247 = nil
			for _, value248 in ipairs(items61) do
				local parent = value248.Parent
				if parent and value248.Enabled ~= false and handleAction210(value248) then
					local magnitude = (value245.Position - parent.WorldPosition).Magnitude
					if handleAction209(value248) then
						entry85 = true
						local enabled47 = true
						if magnitude < huge then
							huge = magnitude
							value246 = value248
						else
							entry85 = enabled47
						end
					else
						entry85 = true
						local enabled48 = true
						if magnitude < huge2 then
							huge2 = magnitude
							value247 = value248
						else
							entry85 = enabled48
						end
					end
				end
			end
			return value246, value247, entry85
		end
		local function handleAction213()
			if not _G.__4HubPromptGen then
				return nil
			end
			local value249 = Workspace2:FindFirstChild("Plots")
			if not value249 then
				return nil
			end
			local number52 = -1
			local value250 = nil
			for _, child in pairs(value249:GetChildren()) do
				if not handleAction207() then
					local value251 = child:FindFirstChild("AnimalPodiums")
					if value251 then
						for _, child2 in pairs(value251:GetChildren()) do
							local base = child2:FindFirstChild("Base")
							if base then
								local spawn_ = base:FindFirstChild("Spawn")
								if spawn_ then
									local promptAttachment = spawn_:FindFirstChild("PromptAttachment")
									if promptAttachment then
										for _, child3 in pairs(promptAttachment:GetChildren()) do
											if child3:IsA("ProximityPrompt") and handleAction210(child3) and handleAction209(child3) then
												local ok, result = pcall(_G.__4HubPromptGen, child3)
												result = ok and type(result) == "number" and result or 0
												if number52 < result then
													number52 = result
													value250 = child3
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
			return value250
		end
		local function handleAction214()
			local 4HubAutoSteal = _G.__4HubAutoSteal
			if 4HubAutoSteal == nil then
				return true
			end
			return 4HubAutoSteal and true or false
		end
		local now2 = tick()
		local enabled49 = false
		local enabled50 = false
		local text = "Scanning..."
		local number53 = 0
		local enabled51 = false
		local entry86 = 0
		local function handleAction215(argument289, argument290)
			if _G.__4HubDead then
				return
			end
			local entry87 = "function"
			if type(value244) ~= entry87 then
				return
			end
			if not (argument289 and argument289.Parent) then
				return
			end
			pcall(function()
				for _, value252 in pairs(value244(argument289[argument290])) do
					if value252 and value252.Function then
						task.spawn(value252.Function)
					end
				end
			end)
		end
		local function handleAction216(argument291)
			if _G.__4HubDead then
				return
			end
			if not enabled46 then
				return
			end
			if not (argument291 and argument291.Parent) then
				return
			end
			local holdDuration = argument291.HoldDuration
			local maxActivationDistance = argument291.MaxActivationDistance
			local requiresLineOfSight = argument291.RequiresLineOfSight
			pcall(function()
				argument291.HoldDuration = 0
				argument291.MaxActivationDistance = 9e9
				argument291.RequiresLineOfSight = false
			end)
			task.wait(0.03)
			if value243 then
				pcall(value243, argument291)
			end
			task.wait(0.04)
			handleAction215(argument291, "Triggered")
			task.wait(0.03)
			handleAction215(argument291, "PromptButtonHoldBegan")
			task.wait(0.025)
			handleAction215(argument291, "PromptButtonHoldEnded")
			task.delay(0.25, function()
				if argument291 and argument291.Parent then
					pcall(function()
						argument291.HoldDuration = holdDuration
						argument291.MaxActivationDistance = maxActivationDistance
						argument291.RequiresLineOfSight = requiresLineOfSight
					end)
				end
			end)
		end
		local enabled52 = false
		local value253 = nil
		local enabled53 = false
		local number54 = 1.3
		local number55 = 0
		local now3 = tick()
		local function handleAction217()
			if not enabled52 then
				return 0
			end
			return math.clamp(number55 + (tick() - now3) / number54, 0, 1)
		end
		local function handleAction218(argument292)
			if argument292 and argument292.Parent then
				handleAction215(argument292, "PromptButtonHoldEnded")
			end
		end
		task.spawn(function()
			while not handleAction204() and not _G.__4HubDead do
				if not enabled46 or not handleAction214() then
					enabled52 = false
					value253 = nil
					enabled49 = false
					enabled50 = false
					number53 = 0
					enabled51 = false
					entry86 = 0
					if _G.__4HubHighlightPrompt then
						pcall(_G.__4HubHighlightPrompt, nil)
					end
					task.wait(0.1)
				elseif handleAction208() then
					enabled52 = false
					value253 = nil
					enabled50 = true
					enabled49 = false
					number53 = 0
					enabled51 = false
					entry86 = 0
					text = "Carrying — deposit it"
					task.wait(0.05)
				else
					enabled50 = false
					local value254, value255 = handleAction212()
					local selectedTargetPrompt = _G.SelectedTargetPrompt
					local enabled54
					if selectedTargetPrompt and selectedTargetPrompt.Parent and handleAction210(selectedTargetPrompt) then
						enabled54 = handleAction209(selectedTargetPrompt)
						if _G.__4HubHighlightPrompt then
							pcall(_G.__4HubHighlightPrompt, nil)
						end
					else
						local 4HubGrabMode = _G.__4HubGrabMode or "Nearest"
						if 4HubGrabMode == "Highest" then
							selectedTargetPrompt = handleAction213()
							if selectedTargetPrompt then
								enabled54 = true
								if _G.__4HubHighlightPrompt then
									pcall(_G.__4HubHighlightPrompt, selectedTargetPrompt)
									enabled54 = true
								end
							else
								selectedTargetPrompt = value254 or value255
								enabled54 = value254 ~= nil
								if _G.__4HubHighlightPrompt then
									pcall(_G.__4HubHighlightPrompt, value254)
								end
							end
						elseif 4HubGrabMode == "Priority" then
							selectedTargetPrompt = value254 or value255
							enabled54 = value254 ~= nil
							if _G.__4HubHighlightPrompt then
								pcall(_G.__4HubHighlightPrompt, value254)
							end
						else
							selectedTargetPrompt = value254 or value255
							enabled54 = value254 ~= nil
							if _G.__4HubHighlightPrompt then
								pcall(_G.__4HubHighlightPrompt, nil)
							end
						end
					end
					if not selectedTargetPrompt then
						enabled52 = false
						value253 = nil
						enabled49 = false
						number53 = 0
						enabled51 = false
						entry86 = 0
						text = "Scanning..."
						task.wait(0.05)
					else
						enabled49 = true
						local enabled541 = enabled54 and 0.35 or 1.3
						if value253 ~= selectedTargetPrompt then
							handleAction218(value253)
							local enabled521 = enabled52 and enabled54 == enabled53 and handleAction217() or 0
							value253 = selectedTargetPrompt
							enabled53 = enabled54
							number54 = enabled541
							number55 = math.clamp(enabled521, 0, 1)
							now3 = tick()
							enabled52 = true
							text = handleAction206((selectedTargetPrompt.ObjectText ~= "" and selectedTargetPrompt.ObjectText or selectedTargetPrompt.ActionText or "Brainrot"):lower())
						end
						local value256 = handleAction217()
						number53 = value256
						enabled51 = false
						entry86 = 0
						if value256 >= 0.999 then
							local value2531 = value253
							enabled52 = false
							value253 = nil
							number53 = 0
							handleAction216(value2531)
							task.wait(0.1)
						else
							task.wait(0.03)
						end
					end
				end
			end
		end)
		if CoreGui:FindFirstChild("FormegaStealBar") then
			CoreGui.FormegaStealBar:Destroy()
		end
		local color = Color3.fromRGB(255, 64, 64)
		local color2 = Color3.fromRGB(255, 165, 40)
		local color3 = Color3.fromRGB(64, 220, 120)
		local color4 = Color3.fromRGB(120, 200, 255)
		local color5 = Color3.fromRGB(150, 215, 255)
		local color6 = Color3.fromRGB(16, 44, 96)
		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "FormegaStealBar"
		screenGui2.ResetOnSpawn = false
		screenGui2.DisplayOrder = 99999
		screenGui2.IgnoreGuiInset = true
		screenGui2.Parent = CoreGui
		_G.setAutoGrabHidden = function(argument293)
			enabled46 = not argument293
			if screenGui2 then
				screenGui2.Enabled = not argument293
			end
		end
		local frame5 = Instance.new("Frame")
		frame5.Size = UDim2.new(0, 258, 0, 50)
		frame5.Position = UDim2.new(0.5, -129, 0.06, 0)
		frame5.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
		frame5.BackgroundTransparency = 0.22
		frame5.BorderSizePixel = 0
		frame5.Parent = screenGui2
		if _G.__4HubRegisterScale then
			_G.__4HubRegisterScale(frame5)
		end
		Instance.new("UICorner", frame5).CornerRadius = UDim.new(0, 11)
		local imageLabel = Instance.new("ImageLabel")
		imageLabel.Size = UDim2.new(1, 34, 1, 34)
		imageLabel.Position = UDim2.new(0, -17, 0, -13)
		imageLabel.BackgroundTransparency = 1
		imageLabel.Image = "rbxassetid://5028857084"
		imageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
		imageLabel.ImageTransparency = 0.5
		imageLabel.ScaleType = Enum.ScaleType.Slice
		imageLabel.SliceCenter = Rect.new(24, 24, 276, 276)
		imageLabel.ZIndex = 0
		imageLabel.Parent = frame5
		local instance4 = Instance.new("UIStroke")
		instance4.Thickness = 2.4
		instance4.Color = color4
		instance4.Transparency = 0
		instance4.Parent = frame5
		local instance5 = Instance.new("UIGradient")
		local colorSequence = ColorSequence.new
		local items63 = {}
		local value257 = ColorSequenceKeypoint.new(0, color5)
		local value258 = ColorSequenceKeypoint.new(0.5, color6)
		local new = ColorSequenceKeypoint.new
		local entry88 = 1
		items63[1] = value257
		items63[2] = value258
		do
			local values = table.pack(new(entry88, color5))
			table.move(values, 1, values.n, 3, items63)
		end
		instance5.Color = colorSequence(items63)
		instance5.Rotation = 0
		instance5.Parent = instance4
		TweenService2:Create(instance5, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), { Rotation = 360 }):Play()
		local frame6 = Instance.new("Frame")
		frame6.Size = UDim2.new(0, 10, 0, 10)
		frame6.Position = UDim2.new(0, 13, 0, 7)
		frame6.BackgroundColor3 = color4
		frame6.BorderSizePixel = 0
		frame6.ZIndex = 3
		frame6.Parent = frame5
		Instance.new("UICorner", frame6).CornerRadius = UDim.new(0, 5)
		local textLabel = Instance.new("TextLabel")
		textLabel.BackgroundTransparency = 1
		textLabel.Position = UDim2.new(0, 27, 0, 5)
		textLabel.Size = UDim2.new(1, -140, 0, 15)
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextSize = 13
		textLabel.TextColor3 = Color3.fromRGB(240, 240, 250)
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel.Text = "Searching..."
		textLabel.ZIndex = 3
		textLabel.Parent = frame5
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.BackgroundTransparency = 1
		textLabel2.AnchorPoint = Vector2.new(1, 0)
		textLabel2.Position = UDim2.new(1, -13, 0, 5)
		textLabel2.Size = UDim2.new(0, 108, 0, 15)
		textLabel2.Font = Enum.Font.GothamBold
		textLabel2.TextSize = 13
		textLabel2.TextColor3 = Color3.fromRGB(170, 170, 185)
		textLabel2.TextXAlignment = Enum.TextXAlignment.Right
		textLabel2.Text = "0%"
		textLabel2.ZIndex = 3
		textLabel2.Parent = frame5
		local frame7 = Instance.new("Frame")
		frame7.Position = UDim2.new(0, 13, 0, 28)
		frame7.Size = UDim2.new(1, -26, 0, 14)
		frame7.BackgroundColor3 = Color3.fromRGB(34, 34, 42)
		frame7.BorderSizePixel = 0
		frame7.ClipsDescendants = true
		frame7.ZIndex = 2
		frame7.Parent = frame5
		Instance.new("UICorner", frame7).CornerRadius = UDim.new(0, 6)
		local instance6 = Instance.new("Frame")
		instance6.Size = UDim2.new(0, 0, 1, 0)
		instance6.BackgroundColor3 = color
		instance6.BorderSizePixel = 0
		instance6.ZIndex = 3
		instance6.Parent = frame7
		Instance.new("UICorner", instance6).CornerRadius = UDim.new(0, 6)
		local frame8 = Instance.new("Frame")
		frame8.AnchorPoint = Vector2.new(0.5, 0.5)
		frame8.Position = UDim2.new(0.5, 0, 0.5, 0)
		frame8.Size = UDim2.new(0, 2, 1, 3)
		frame8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		frame8.BackgroundTransparency = 0.1
		frame8.BorderSizePixel = 0
		frame8.ZIndex = 5
		frame8.Parent = frame7
		local uiStroke2 = Instance.new("UIStroke")
		uiStroke2.Thickness = 0
		uiStroke2.Color = color3
		uiStroke2.Transparency = 1
		uiStroke2.Parent = frame8
		local number56 = 0
		local number57 = 0
		local entry89 = 0
		local connection_ = nil
		local entry90 = 0
		connection_ = service17.Heartbeat:Connect(function(deltaTime)
			if handleAction204() then
				connection_:Disconnect()
				return
			end
			if screenGui2 and not screenGui2.Enabled then
				return
			end
			entry90 += deltaTime or 0
			if entry90 < 0.0166 then
				return
			end
			local entry901 = entry90
			entry90 = 0
			local now4 = tick()
			local entry91 = false
			local number58, text2
			if enabled50 then
				number58 = 0
				text2 = ""
			elseif enabled51 then
				entry91 = true
				number58 = 1
				text2 = "100%"
			elseif enabled49 then
				number58 = math.clamp(number53, 0, 1)
				text2 = math.floor(number58 * 100) .. "%"
			else
				number58 = 1 - math.abs((now4 - now2) / 1.6 % 2 - 1)
				text2 = math.floor(number58 * 100) .. "%"
			end
			local value259
			if number58 >= 0.75 then
				value259 = color3
				if not entry91 then
					entry91 = number58 >= 0.999
					value259 = color3
				end
			elseif number58 >= 0.5 then
				value259 = color2
			else
				value259 = color
			end
			if number57 - number58 > 0.2 then
				entry89 = 1
			end
			number57 = number58
			entry89 += (0 - entry89) * math.clamp(entry901 * 7, 0, 1)
			if enabled50 then
				number56 += (0 - number56) * math.clamp(entry901 * 14, 0, 1)
			else
				number56 += (number58 - number56) * math.clamp(entry901 * 16, 0, 1)
			end
			local entry92 = 0
			instance6.Size = UDim2.new(math.clamp(number56, 0, 1), entry92, 1, 0)
			local matchesCondition5 = entry89 > 0.01
			if matchesCondition5 then
				local number59 = entry89 * 0.55
				matchesCondition5 = value259:Lerp(Color3.fromRGB(255, 255, 255), number59)
			end
			instance6.BackgroundColor3 = instance6.BackgroundColor3:Lerp(matchesCondition5 or value259, math.clamp(entry901 * 16, 0, 1))
			textLabel.Text = text
			textLabel.TextColor3 = enabled49 and Color3.fromRGB(240, 240, 250) or Color3.fromRGB(150, 150, 165)
			textLabel2.Text = text2
			textLabel2.TextColor3 = entry91 and color3 or Color3.fromRGB(170, 170, 185)
			frame6.BackgroundColor3 = _G.__4HubEspTint and _G.__4HubEspTint(color4) or color4
			frame6.BackgroundTransparency = 0.1 + 0.25 * (0.5 + 0.5 * math.sin(now4 * 7))
			if entry91 then
				uiStroke2.Transparency = 0.2 + 0.4 * (0.5 + 0.5 * math.sin(now4 * 9))
				uiStroke2.Thickness = 1.5
			else
				local number60 = 1 - entry89
				uiStroke2.Color = Color3.fromRGB(255, 255, 255)
				uiStroke2.Thickness = 1.6 * entry89
				uiStroke2.Transparency = math.clamp(number60, 0, 1)
			end
			frame8.BackgroundTransparency = math.clamp(0.1 - entry89 * 0.1, 0, 1)
		end)
	end)
	task.spawn(function()
		local players17 = game:GetService("Players")
		local TweenService2 = game:GetService("TweenService")
		local UserInputService = game:GetService("UserInputService")
		game:GetService("RunService")
		local playerGui_2 = players17.LocalPlayer:WaitForChild("PlayerGui")
		local options69 = {
			Black = Color3.fromRGB(6, 8, 14),
			BgDark = Color3.fromRGB(9, 13, 24),
			BgPanel = Color3.fromRGB(13, 20, 38),
			Stroke = Color3.fromRGB(30, 46, 82),
			DarkBlue = Color3.fromRGB(18, 38, 78),
			LightBlue = Color3.fromRGB(92, 165, 255),
			BlueLine = Color3.fromRGB(60, 120, 220),
			White = Color3.fromRGB(255, 255, 255),
			TextDim = Color3.fromRGB(150, 165, 195),
			Green = Color3.fromRGB(100, 220, 130),
			Red = Color3.fromRGB(235, 90, 100),
		}
		local gothamBold2 = Enum.Font.GothamBold
		local gothamBlack = Enum.Font.GothamBlack
		local function createUICorner2(parent, argument294)
			local uiCorner = Instance.new("UICorner")
			uiCorner.CornerRadius = UDim.new(0, argument294 or 8)
			uiCorner.Parent = parent
			return uiCorner
		end
		local function createUIStroke2(parent, color, thickness)
			local uiStroke2 = Instance.new("UIStroke")
			uiStroke2.Color = color or options69.Stroke
			uiStroke2.Thickness = thickness or 1
			uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uiStroke2.Parent = parent
			return uiStroke2
		end
		local options70 = {
			ragdoll = 30,
			jail = 60,
			rocket = 120,
			balloon = 30,
			inverse = 30,
			jumpscare = 30,
			tiny = 30,
			morph = 30,
			nightvision = 30,
		}
		local items64 = {}
		local function handleAction219(argument295)
			local adminPanel = playerGui_2:FindFirstChild("AdminPanel")
			if not adminPanel then
				return nil
			end
			local ok, result = pcall(function()
				return adminPanel.AdminPanel.Content.ScrollingFrame
			end)
			if not ok or not result then
				return nil
			end
			local value260 = result:FindFirstChild(argument295)
			if not value260 then
				return nil
			end
			local timer = value260:FindFirstChild("Timer")
			if not timer or not timer.Visible then
				return 0
			end
			return tonumber(timer.Text:match("%d+")) or 0
		end
		local function handleAction220(argument296)
			local value261 = handleAction219(argument296)
			if value261 ~= nil then
				return value261
			end
			local entry93 = items64[argument296]
			local entry94 = options70[argument296] or 0
			if not entry93 then
				return 0
			end
			return math.max(0, entry94 - tick() - entry93)
		end
		local commandCooldownUI = playerGui_2:FindFirstChild("CommandCooldownUI")
		if commandCooldownUI then
			commandCooldownUI:Destroy()
		end
		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "CommandCooldownUI"
		screenGui2.ResetOnSpawn = false
		screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui2.IgnoreGuiInset = true
		screenGui2.Parent = playerGui_2
		_G.setCmdCooldownHidden = function(argument297)
			if screenGui2 then
				screenGui2.Enabled = not argument297
			end
		end
		local items65 = { "jail", "rocket", "inverse", "ragdoll", "jumpscare", "tiny", "balloon", "morph", "nightvision" }
		local entry95 = 220
		local number61 = #items65
		local entry96 = 12
		local number62 = 48 + number61 * 26 + (number61 - 1) * 5 + entry96
		local udim22 = UDim2.fromOffset(entry95, number62)
		local instance4 = Instance.new("Frame")
		instance4.Name = "Window"
		instance4.AnchorPoint = Vector2.new(0.5, 0.5)
		instance4.Size = udim22
		instance4.Position = UDim2.new(1, -(entry95 / 2 + 16), 0, number62 / 2 + 16)
		instance4.BackgroundColor3 = options69.BgDark
		instance4.BorderSizePixel = 0
		instance4.ClipsDescendants = true
		instance4.Active = true
		instance4.Parent = screenGui2
		if _G.__4HubRegisterScale then
			_G.__4HubRegisterScale(instance4)
		end
		createUICorner2(instance4, 12)
		restoreWindowPosition("CommandCooldown", instance4)
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Rotation = 90
		local new = ColorSequenceKeypoint.new
		local entry97 = 1
		local bgDark = options69.BgDark
		uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, options69.Black), new(entry97, bgDark) })
		uiGradient.Parent = instance4
		local color = Color3.fromRGB(190, 225, 255)
		local colorSequence = ColorSequence.new
		local items66 = {}
		local value262 = ColorSequenceKeypoint.new(0, options69.DarkBlue)
		local value263 = ColorSequenceKeypoint.new(0.22, options69.LightBlue)
		local value264 = ColorSequenceKeypoint.new(0.3, color)
		local value265 = ColorSequenceKeypoint.new(0.38, options69.LightBlue)
		local value266 = ColorSequenceKeypoint.new(0.6, options69.DarkBlue)
		local value267 = ColorSequenceKeypoint.new(0.8, options69.LightBlue)
		local new2 = ColorSequenceKeypoint.new
		local darkBlue = options69.DarkBlue
		items66[1] = value262
		items66[2] = value263
		items66[3] = value264
		items66[4] = value265
		items66[5] = value266
		items66[6] = value267
		do
			local values = table.pack(new2(1, darkBlue))
			table.move(values, 1, values.n, 7, items66)
		end
		local value268 = colorSequence(items66)
		local uiStroke2 = Instance.new("UIStroke")
		uiStroke2.Thickness = 6
		uiStroke2.Transparency = 0.6
		uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke2.Parent = instance4
		local uiGradient2 = Instance.new("UIGradient")
		uiGradient2.Color = value268
		uiGradient2.Parent = uiStroke2
		local uiStroke3 = Instance.new("UIStroke")
		uiStroke3.Thickness = 1.5
		uiStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke3.Parent = instance4
		local uiGradient3 = Instance.new("UIGradient")
		uiGradient3.Color = value268
		uiGradient3.Parent = uiStroke3
		_G.__4HubPulse(function(argument298)
			if instance4.Parent then
				local rotation = argument298 * 100 % 360
				uiGradient3.Rotation = rotation
				uiGradient2.Rotation = rotation
				uiStroke2.Transparency = 0.55 + 0.2 * math.sin(argument298 * 3)
				return
			end
		end)
		local frame5 = Instance.new("Frame")
		frame5.Name = "Header"
		frame5.Size = UDim2.new(1, 0, 0, 42)
		frame5.BackgroundTransparency = 1
		frame5.Parent = instance4
		local textButton3 = Instance.new("TextButton")
		textButton3.Name = "Minimise"
		textButton3.AnchorPoint = Vector2.new(1, 0)
		textButton3.Position = UDim2.new(1, -12, 0, 11)
		textButton3.Size = UDim2.fromOffset(20, 20)
		textButton3.BackgroundColor3 = options69.DarkBlue
		textButton3.AutoButtonColor = false
		textButton3.Font = gothamBold2
		textButton3.Text = "–"
		textButton3.TextColor3 = options69.LightBlue
		textButton3.TextSize = 18
		textButton3.ZIndex = 6
		textButton3.Parent = frame5
		createUICorner2(textButton3, 6)
		createUIStroke2(textButton3, options69.LightBlue, 1)
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "Title"
		textLabel.Size = UDim2.new(1, -80, 0, 42)
		textLabel.Position = UDim2.fromOffset(40, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Font = gothamBold2
		textLabel.Text = "Command Cooldown"
		textLabel.TextColor3 = options69.White
		textLabel.TextSize = 15
		textLabel.TextXAlignment = Enum.TextXAlignment.Center
		textLabel.Parent = frame5
		local instance5 = Instance.new("Frame")
		instance5.Name = "HeaderLine"
		instance5.Size = UDim2.new(1, -28, 0, 2)
		instance5.Position = UDim2.new(0, 14, 0, 40)
		instance5.BackgroundColor3 = options69.BlueLine
		instance5.BorderSizePixel = 0
		instance5.Parent = instance4
		createUICorner2(instance5, 1)
		local instance6 = Instance.new("UIGradient")
		local colorSequence2 = ColorSequence.new
		local items67 = {}
		local value269 = ColorSequenceKeypoint.new(0, options69.DarkBlue)
		local value270 = ColorSequenceKeypoint.new(0.5, options69.LightBlue)
		local new3 = ColorSequenceKeypoint.new
		local entry98 = 1
		local darkBlue2 = options69.DarkBlue
		items67[1] = value269
		items67[2] = value270
		do
			local values = table.pack(new3(entry98, darkBlue2))
			table.move(values, 1, values.n, 3, items67)
		end
		instance6.Color = colorSequence2(items67)
		instance6.Parent = instance5
		local frame6 = Instance.new("Frame")
		frame6.Name = "Body"
		frame6.Position = UDim2.fromOffset(0, 48)
		frame6.Size = UDim2.new(1, 0, 1, -48)
		frame6.BackgroundTransparency = 1
		frame6.BorderSizePixel = 0
		frame6.Parent = instance4
		local uiPadding = Instance.new("UIPadding")
		uiPadding.PaddingLeft = UDim.new(0, 12)
		uiPadding.PaddingRight = UDim.new(0, 12)
		uiPadding.PaddingBottom = UDim.new(0, entry96)
		uiPadding.Parent = frame6
		local instance7 = Instance.new("UIListLayout")
		instance7.Padding = UDim.new(0, 5)
		instance7.SortOrder = Enum.SortOrder.LayoutOrder
		instance7.Parent = frame6
		local items68 = {}
		for i, value271 in ipairs(items65) do
			local frame7 = Instance.new("Frame")
			frame7.Name = value271
			frame7.Size = UDim2.new(1, 0, 0, 26)
			frame7.BackgroundColor3 = options69.BgDark
			frame7.BorderSizePixel = 0
			frame7.LayoutOrder = i
			frame7.Parent = frame6
			createUICorner2(frame7, 8)
			createUIStroke2(frame7, options69.Stroke, 1)
			local frame8 = Instance.new("Frame")
			frame8.Size = UDim2.new(0, 3, 0.55, 0)
			frame8.Position = UDim2.new(0, 0, 0.225, 0)
			frame8.BackgroundColor3 = options69.DarkBlue
			frame8.BorderSizePixel = 0
			frame8.Parent = frame7
			createUICorner2(frame8, 2)
			local instance8 = Instance.new("TextLabel")
			instance8.Size = UDim2.new(0.58, 0, 1, 0)
			instance8.Position = UDim2.fromOffset(12, 0)
			instance8.BackgroundTransparency = 1
			instance8.Font = gothamBold2
			instance8.Text = value271:sub(1, 1):upper() .. value271:sub(2)
			instance8.TextColor3 = options69.White
			instance8.TextSize = 13
			instance8.TextXAlignment = Enum.TextXAlignment.Left
			instance8.TextTruncate = Enum.TextTruncate.AtEnd
			instance8.Parent = frame7
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.AnchorPoint = Vector2.new(1, 0.5)
			textLabel2.Position = UDim2.new(1, -12, 0.5, 0)
			textLabel2.Size = UDim2.new(0.36, 0, 1, 0)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Font = gothamBlack
			textLabel2.Text = "READY"
			textLabel2.TextColor3 = options69.Green
			textLabel2.TextSize = 12
			textLabel2.TextXAlignment = Enum.TextXAlignment.Right
			textLabel2.Parent = frame7
			items68[value271] = { label = textLabel2, accent = frame8 }
		end
		task.spawn(function()
			while screenGui2.Parent do
				task.wait(0.5)
				for k, value272 in pairs(items68) do
					local value273 = handleAction220(k)
					if value273 > 0 then
						value272.label.Text = string.format("%.0fs", value273)
						value272.label.TextColor3 = options69.Red
						value272.accent.BackgroundColor3 = options69.Red
					else
						value272.label.Text = "READY"
						value272.label.TextColor3 = options69.Green
						value272.accent.BackgroundColor3 = options69.DarkBlue
					end
				end
			end
		end)
		frame5.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			local position = input.Position
			local position2 = instance4.Position
			local connection_ = nil
			local connection_2 = UserInputService.InputChanged:Connect(function(input2)
				if input2.UserInputType == Enum.UserInputType.MouseMovement or input2.UserInputType == Enum.UserInputType.Touch then
					local number63 = input2.Position - position
					instance4.Position = UDim2.new(position2.X.Scale, position2.X.Offset + number63.X, position2.Y.Scale, position2.Y.Offset + number63.Y)
				end
			end)
			connection_ = UserInputService.InputEnded:Connect(function(input2)
				if input2 == input or input2.UserInputType == Enum.UserInputType.MouseButton1 or input2.UserInputType == Enum.UserInputType.Touch then
					if connection_2 then
						connection_2:Disconnect()
					end
					if connection_ then
						connection_:Disconnect()
					end
					saveWindowPosition("CommandCooldown", instance4)
				end
			end)
		end)
		local entry99 = false
		local enabled55 = false
		local tweenInfo = TweenInfo.new(0.26, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		local function handleAction221(argument299)
			if enabled55 or argument299 == entry99 then
				return
			end
			enabled55 = true
			entry99 = argument299
			local udim23 = argument299 and UDim2.fromOffset(entry95, 42) or udim22
			instance5.Visible = not argument299
			textButton3.Text = argument299 and "+" or "–"
			local tween = TweenService2:Create(instance4, tweenInfo, { Size = udim23 })
			tween:Play()
			tween.Completed:Once(function()
				if not argument299 then
					instance5.Visible = true
				end
				enabled55 = false
			end)
		end
		textButton3.MouseButton1Click:Connect(function()
			handleAction221(not entry99)
		end)
		textButton3.MouseEnter:Connect(function()
			local options71 = { BackgroundColor3 = options69.BlueLine }
			TweenService2:Create(textButton3, TweenInfo.new(0.12), options71):Play()
		end)
		textButton3.MouseLeave:Connect(function()
			local options72 = { BackgroundColor3 = options69.DarkBlue }
			TweenService2:Create(textButton3, TweenInfo.new(0.12), options72):Play()
		end)
		instance4.Size = UDim2.fromOffset(0, 0)
		TweenService2:Create(instance4, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = udim22 }):Play()
	end)
	task.spawn(function()
		local service18 = game:GetService("Players")
		Workspace = game:GetService("Workspace")
		RunService = game:GetService("RunService")
		UIS = game:GetService("UserInputService")
		TweenService = game:GetService("TweenService")
		local localPlayer24 = service18.LocalPlayer
		local playerGui_2 = localPlayer24:WaitForChild("PlayerGui")
		local ninePGriefDetector = playerGui_2:FindFirstChild("NineP_GriefDetector")
		if ninePGriefDetector then
			ninePGriefDetector:Destroy()
		end
		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "NineP_GriefDetector"
		screenGui2.ResetOnSpawn = false
		screenGui2.IgnoreGuiInset = true
		screenGui2.DisplayOrder = 9000
		screenGui2.Parent = playerGui_2
		screenGui = screenGui2
		_G.setGriefHidden = function(argument300)
			if screenGui2 then
				screenGui2.Enabled = not argument300
			end
		end
		local options73 = {
			Black = Color3.fromRGB(6, 8, 14),
			BgDark = Color3.fromRGB(9, 13, 24),
			BgPanel = Color3.fromRGB(13, 20, 38),
			Stroke = Color3.fromRGB(30, 46, 82),
			DarkBlue = Color3.fromRGB(18, 38, 78),
			LightBlue = Color3.fromRGB(92, 165, 255),
			BlueLine = Color3.fromRGB(60, 120, 220),
			White = Color3.fromRGB(255, 255, 255),
			TextDim = Color3.fromRGB(150, 165, 195),
		}
		Theme = {
			Background = options73.BgDark,
			Panel = options73.BgPanel,
			Row = options73.BgPanel,
			RowHover = options73.DarkBlue,
			Accent = options73.LightBlue,
			Green = Color3.fromRGB(100, 220, 130),
			Red = Color3.fromRGB(226, 70, 82),
			Text = options73.White,
			Dim = options73.TextDim,
			Stroke = options73.Stroke,
		}
		UITransparency = { Panel = 0, Row = 0, Outline = 0.4 }
		local gothamBold2 = Enum.Font.GothamBold
		UI = { Locked = false }
		createUICorner = function(parent, argument301)
			local uiCorner = Instance.new("UICorner")
			uiCorner.CornerRadius = UDim.new(0, argument301)
			uiCorner.Parent = parent
			return uiCorner
		end
		addOutline = function(parent)
			local uiStroke2 = Instance.new("UIStroke")
			uiStroke2.Color = Theme.Stroke
			uiStroke2.Thickness = 1
			uiStroke2.Transparency = UITransparency.Outline
			uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uiStroke2.Parent = parent
			return uiStroke2
		end
		makeDraggable = function(argument302, argument303)
			local enabled56 = false
			local position = nil
			local position2 = nil
			argument303.InputBegan:Connect(function(input)
				if UI.Locked then
					return
				end
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					enabled56 = true
					position = input.Position
					position2 = argument302.Position
				end
			end)
			UIS.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					if enabled56 then
						saveWindowPosition("GriefDetector", argument302)
					end
					enabled56 = false
				end
			end)
			UIS.InputChanged:Connect(function(input)
				if enabled56 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					if input.UserInputType == Enum.UserInputType.MouseMovement and not UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
						enabled56 = false
						saveWindowPosition("GriefDetector", argument302)
						return
					end
					local number64 = input.Position - position
					argument302.Position = UDim2.new(position2.X.Scale, position2.X.Offset + number64.X, position2.Y.Scale, position2.Y.Offset + number64.Y)
				end
			end)
		end
		applySavedPosition = function(argument304, argument305)
			restoreWindowPosition("GriefDetector", argument305)
		end
		panels = {}
		task.spawn(function()
			local items69 = {}
			local items70 = {}
			local items71 = {}
			local options74 = {
				balloon = true,
				inverse = true,
				inversed = true,
				jail = true,
				jumpscare = true,
				morph = true,
				nightvision = true,
				rocket = true,
				tiny = true,
				ragdoll = true,
			}
			local items72 = {
				{ kw = "dark matter slap", name = "Dark Matter Slap" },
				{ kw = "nuclear slap", name = "Nuclear Slap" },
				{ kw = "glitched slap", name = "Glitched Slap" },
				{ kw = "galaxy slap", name = "Galaxy Slap" },
				{ kw = "flame slap", name = "Flame Slap" },
				{ kw = "emerald slap", name = "Emerald Slap" },
				{ kw = "diamond slap", name = "Diamond Slap" },
				{ kw = "ruby slap", name = "Ruby Slap" },
				{ kw = "gold slap", name = "Gold Slap" },
				{ kw = "iron slap", name = "Iron Slap" },
				{ kw = "gummy slap", name = "Gummy Slap" },
				{ kw = "splatter slap", name = "Splatter Slap" },
				{ kw = "slap", name = "Slap" },
				{ kw = "airstrike", name = "Airstrike" },
				{ kw = "air strike", name = "Airstrike" },
				{ kw = "trap", name = "Trap" },
				{ kw = "rage table", name = "Rage Table" },
				{ kw = "taser", name = "Taser" },
				{ kw = "laser cape", name = "Laser Cape" },
				{ kw = "paintball", name = "Paintball Gun" },
				{ kw = "megaphone", name = "Megaphone" },
				{ kw = "gummy", name = "Gummy Slap" },
				{ kw = "subspace", name = "Subspace Mine" },
				{ kw = "mine", name = "Subspace Mine" },
				{ kw = "attack doge", name = "Attack Doge" },
				{ kw = "doge", name = "Attack Doge" },
				{ kw = "medusa", name = "Medusa's Head" },
				{ kw = "web slinger", name = "Web Slinger" },
				{ kw = "webslinger", name = "Web Slinger" },
				{ kw = "boogie", name = "Boogie Bomb" },
				{ kw = "body swap", name = "Body Swap Potion" },
				{ kw = "bodyswap", name = "Body Swap Potion" },
				{ kw = "bee launcher", name = "Bee Launcher" },
				{ kw = "beehive", name = "Beehive" },
				{ kw = "magnet", name = "Magnet" },
				{ kw = "heatseeker", name = "Heatseeker" },
				{ kw = "sentry", name = "All-Seeing Sentry" },
				{ kw = "rainbowrath", name = "Rainbowrath Sword" },
			}
			local function handleAction222(argument306)
				local text17 = tostring(argument306):lower()
				for _, value274 in ipairs(items72) do
					if text17:find(value274.kw, 1, true) then
						return value274.name
					end
				end
				return nil
			end
			local items73 = {
				{ kw = "boogie", name = "Boogie Bomb" },
				{ kw = "dancing", name = "Boogie Bomb" },
				{ kw = "dance", name = "Boogie Bomb" },
				{ kw = "bodyswap", name = "Body Swap Potion" },
				{ kw = "swapped", name = "Body Swap Potion" },
				{ kw = "swap", name = "Body Swap Potion" },
				{ kw = "gummy", name = "Gummy Slap" },
				{ kw = "splat", name = "Splatter Slap" },
				{ kw = "webbed", name = "Web Slinger" },
				{ kw = "web", name = "Web Slinger" },
				{ kw = "beehive", name = "Beehive" },
				{ kw = "bee", name = "Bee (inverted)" },
				{ kw = "stunned", name = "Taser / Stun" },
				{ kw = "stun", name = "Taser / Stun" },
				{ kw = "tased", name = "Taser" },
				{ kw = "frozen", name = "Freeze" },
				{ kw = "freeze", name = "Freeze" },
				{ kw = "paint", name = "Paintball Gun" },
				{ kw = "magnet", name = "Magnet" },
				{ kw = "medusa", name = "Medusa's Head" },
				{ kw = "petrif", name = "Medusa's Head" },
				{ kw = "stoned", name = "Medusa's Head" },
				{ kw = "subspace", name = "Subspace Mine" },
				{ kw = "doge", name = "Attack Doge" },
				{ kw = "lasered", name = "Laser Cape" },
				{ kw = "rage", name = "Rage Table" },
				{ kw = "invert", name = "Inverted Controls" },
			}
			local function handleAction223(argument307)
				local text18 = tostring(argument307):lower()
				for _, value275 in ipairs(items73) do
					if text18:find(value275.kw, 1, true) then
						return value275.name
					end
				end
				return nil
			end
			local entry100 = 6
			local number65 = 64 * 2 + entry100
			local number66 = 48 + number65 + 10
			local frame5 = Instance.new("Frame")
			frame5.Name = "GriefDetector"
			frame5.Size = UDim2.fromOffset(250, number66)
			frame5.Position = UDim2.new(1, -(250 + 8), 0.5, -number66 / 2)
			frame5.BackgroundColor3 = options73.BgDark
			frame5.BorderSizePixel = 0
			frame5.ClipsDescendants = true
			frame5.Active = true
			frame5.Parent = screenGui2
			if _G.__4HubRegisterScale then
				_G.__4HubRegisterScale(frame5)
			end
			createUICorner(frame5, 12)
			local instance4 = Instance.new("UIGradient")
			instance4.Rotation = 90
			local new = ColorSequenceKeypoint.new
			local bgDark = options73.BgDark
			instance4.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, options73.Black), new(1, bgDark) })
			instance4.Parent = frame5
			local color = Color3.fromRGB(190, 225, 255)
			local colorSequence = ColorSequence.new
			local items74 = {}
			local value276 = ColorSequenceKeypoint.new(0, options73.DarkBlue)
			local value277 = ColorSequenceKeypoint.new(0.18, options73.LightBlue)
			local value278 = ColorSequenceKeypoint.new(0.25, color)
			local value279 = ColorSequenceKeypoint.new(0.32, options73.LightBlue)
			local value280 = ColorSequenceKeypoint.new(0.5, options73.DarkBlue)
			local value281 = ColorSequenceKeypoint.new(0.68, options73.LightBlue)
			local value282 = ColorSequenceKeypoint.new(0.75, color)
			local value283 = ColorSequenceKeypoint.new(0.82, options73.LightBlue)
			local new2 = ColorSequenceKeypoint.new
			local darkBlue = options73.DarkBlue
			items74[1] = value276
			items74[2] = value277
			items74[3] = value278
			items74[4] = value279
			items74[5] = value280
			items74[6] = value281
			items74[7] = value282
			items74[8] = value283
			do
				local values = table.pack(new2(1, darkBlue))
				table.move(values, 1, values.n, 9, items74)
			end
			local value284 = colorSequence(items74)
			local instance5 = Instance.new("UIStroke")
			instance5.Thickness = 6
			instance5.Transparency = 0.6
			instance5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			instance5.Parent = frame5
			local instance6 = Instance.new("UIGradient")
			instance6.Color = value284
			instance6.Parent = instance5
			local uiStroke2 = Instance.new("UIStroke")
			uiStroke2.Thickness = 1.5
			uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uiStroke2.Parent = frame5
			local uiGradient = Instance.new("UIGradient")
			uiGradient.Color = value284
			uiGradient.Parent = uiStroke2
			_G.__4HubPulse(function(argument308)
				if not frame5.Parent then
					return
				end
				local rotation = argument308 * 100 % 360
				uiGradient.Rotation = rotation
				instance6.Rotation = rotation
				instance5.Transparency = 0.55 + 0.2 * math.sin(argument308 * 3)
			end)
			local instance7 = Instance.new("Frame")
			instance7.Size = UDim2.new(1, 0, 0, 42)
			instance7.BackgroundTransparency = 1
			instance7.Parent = frame5
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Font = gothamBold2
			textLabel.TextSize = 15
			textLabel.TextColor3 = options73.White
			textLabel.TextXAlignment = Enum.TextXAlignment.Center
			textLabel.Text = "GRIEF DETECTOR"
			textLabel.Parent = instance7
			local frame6 = Instance.new("Frame")
			frame6.Size = UDim2.new(1, -28, 0, 2)
			frame6.Position = UDim2.new(0, 14, 0, 40)
			frame6.BackgroundColor3 = options73.BlueLine
			frame6.BorderSizePixel = 0
			frame6.Parent = frame5
			createUICorner(frame6, 1)
			local uiGradient2 = Instance.new("UIGradient")
			local colorSequence2 = ColorSequence.new
			local items75 = {}
			local value285 = ColorSequenceKeypoint.new(0, options73.DarkBlue)
			local value286 = ColorSequenceKeypoint.new(0.5, options73.LightBlue)
			local new3 = ColorSequenceKeypoint.new
			local entry101 = 1
			local darkBlue2 = options73.DarkBlue
			items75[1] = value285
			items75[2] = value286
			do
				local values = table.pack(new3(entry101, darkBlue2))
				table.move(values, 1, values.n, 3, items75)
			end
			uiGradient2.Color = colorSequence2(items75)
			uiGradient2.Parent = frame6
			local instance8 = Instance.new("ScrollingFrame")
			instance8.Position = UDim2.new(0, 10, 0, 48)
			instance8.Size = UDim2.new(1, -20, 0, number65)
			instance8.BackgroundTransparency = 1
			instance8.BorderSizePixel = 0
			instance8.ScrollBarThickness = 3
			instance8.ScrollBarImageColor3 = options73.LightBlue
			instance8.ScrollingDirection = Enum.ScrollingDirection.Y
			instance8.ElasticBehavior = Enum.ElasticBehavior.Never
			instance8.CanvasSize = UDim2.new(0, 0, 0, 0)
			instance8.ScrollingEnabled = true
			instance8.Parent = frame5
			local instance9 = Instance.new("UIListLayout")
			instance9.Padding = UDim.new(0, entry100)
			instance9.SortOrder = Enum.SortOrder.LayoutOrder
			instance9.Parent = instance8
			instance9:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				instance8.CanvasSize = UDim2.new(0, 0, 0, instance9.AbsoluteContentSize.Y + 4)
			end)
			local function handleAction224()
				for _, child in ipairs(instance8:GetChildren()) do
					if not child:IsA("UIListLayout") then
						child:Destroy()
					end
				end
				if #items69 == 0 then
					local textLabel2 = Instance.new("TextLabel")
					textLabel2.Size = UDim2.new(1, 0, 0, 28)
					textLabel2.BackgroundTransparency = 1
					textLabel2.Text = "No griefs yet."
					textLabel2.TextColor3 = Theme.Dim
					textLabel2.Font = Enum.Font.GothamMedium
					textLabel2.TextSize = 13
					textLabel2.Parent = instance8
					return
				end
				for i = 1, math.min(#items69, 20) do
					local entry102 = items69[i]
					local frame7 = Instance.new("Frame")
					frame7.Size = UDim2.new(1, -4, 0, 64)
					frame7.BackgroundColor3 = Theme.Row
					frame7.BackgroundTransparency = UITransparency.Row
					frame7.BorderSizePixel = 0
					frame7.LayoutOrder = i
					frame7.Parent = instance8
					createUICorner(frame7, 8)
					local instance10 = Instance.new("UIStroke")
					instance10.Color = options73.Stroke
					instance10.Thickness = 1
					instance10.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					instance10.Parent = frame7
					local instance11 = Instance.new("Frame")
					instance11.Size = UDim2.new(0, 3, 0.6, 0)
					instance11.Position = UDim2.new(0, 0, 0.2, 0)
					instance11.BackgroundColor3 = i == 1 and options73.LightBlue or options73.DarkBlue
					instance11.BorderSizePixel = 0
					instance11.Parent = frame7
					createUICorner(instance11, 2)
					local imageLabel = Instance.new("ImageLabel")
					imageLabel.Size = UDim2.fromOffset(40, 40)
					imageLabel.Position = UDim2.new(0, 10, 0.5, -20)
					imageLabel.BackgroundColor3 = Theme.Panel
					imageLabel.BackgroundTransparency = 0.2
					imageLabel.BorderSizePixel = 0
					imageLabel.Parent = frame7
					createUICorner(imageLabel, 8)
					if entry102.userId then
						if items70[entry102.userId] then
							imageLabel.Image = items70[entry102.userId]
						else
							task.spawn(function()
								pcall(function()
									local userThumbnailAsync = service18:GetUserThumbnailAsync(entry102.userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
									items70[entry102.userId] = userThumbnailAsync
									if imageLabel.Parent then
										imageLabel.Image = userThumbnailAsync
									end
								end)
							end)
						end
					end
					local textLabel2 = Instance.new("TextLabel")
					textLabel2.Size = UDim2.new(1, -58, 0, 13)
					textLabel2.Position = UDim2.new(0, 52, 0, 4)
					textLabel2.BackgroundTransparency = 1
					textLabel2.Text = entry102.who
					textLabel2.TextColor3 = Theme.Text
					textLabel2.Font = Enum.Font.GothamBold
					textLabel2.TextSize = 12
					textLabel2.TextXAlignment = Enum.TextXAlignment.Left
					textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
					textLabel2.Parent = frame7
					local textLabel3 = Instance.new("TextLabel")
					textLabel3.Size = UDim2.new(1, -56, 0, 11)
					textLabel3.Position = UDim2.new(0, 52, 0, 18)
					textLabel3.BackgroundTransparency = 1
					textLabel3.Text = entry102.grief
					textLabel3.TextColor3 = Theme.Dim
					textLabel3.Font = Enum.Font.GothamMedium
					textLabel3.TextSize = 10
					textLabel3.TextXAlignment = Enum.TextXAlignment.Left
					textLabel3.TextTruncate = Enum.TextTruncate.AtEnd
					textLabel3.Parent = frame7
					local textLabel4 = Instance.new("TextLabel")
					textLabel4.Size = UDim2.new(1, -56, 0, 12)
					textLabel4.Position = UDim2.new(0, 52, 0, 31)
					textLabel4.BackgroundTransparency = 1
					local carried = entry102.carried
					if not carried then
						carried = (entry102.tool and entry102.tool .. "  —  " or "") .. (entry102.dist and entry102.dist .. "m" or "")
					end
					textLabel4.Text = carried
					textLabel4.TextColor3 = Theme.Text
					textLabel4.Font = Enum.Font.GothamBold
					textLabel4.TextSize = 10
					textLabel4.TextXAlignment = Enum.TextXAlignment.Left
					textLabel4.TextTruncate = Enum.TextTruncate.AtEnd
					textLabel4.Parent = frame7
					local textLabel5 = Instance.new("TextLabel")
					textLabel5.Size = UDim2.new(1, -56, 0, 12)
					textLabel5.Position = UDim2.new(0, 52, 0, 45)
					textLabel5.BackgroundTransparency = 1
					textLabel5.Text = entry102.carriedGen or ""
					textLabel5.TextColor3 = Color3.fromRGB(100, 220, 130)
					textLabel5.Font = Enum.Font.GothamBold
					textLabel5.TextSize = 10
					textLabel5.TextXAlignment = Enum.TextXAlignment.Left
					textLabel5.TextTruncate = Enum.TextTruncate.AtEnd
					textLabel5.Parent = frame7
				end
			end
			makeDraggable(frame5, instance7, "GriefDetector")
			applySavedPosition("GriefDetector", frame5)
			panels["Grief Detector"] = frame5
			handleAction224()
			local function handleAction225()
				local humanoidRootPart = localPlayer24.Character and localPlayer24.Character:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return nil
				end
				local huge = math.huge
				local huge2 = math.huge
				local value287 = nil
				local value288 = nil
				local name = nil
				for _, player_ in ipairs(service18:GetPlayers()) do
					if player_ ~= localPlayer24 and player_.Character then
						local humanoidRootPart2 = player_.Character:FindFirstChild("HumanoidRootPart")
						if humanoidRootPart2 then
							local magnitude = (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude
							if magnitude < 150 then
								if magnitude < huge2 then
									huge2 = magnitude
									value287 = player_
								end
								local tool = player_.Character:FindFirstChildOfClass("Tool")
								if tool and handleAction222(tool.Name) and magnitude < huge then
									name = tool.Name
									huge = magnitude
									value288 = player_
								end
							end
						end
					end
				end
				if value288 then
					return value288, name, math.floor(huge)
				end
				if value287 then
					return value287, nil, math.floor(huge2)
				end
				return nil
			end
			local function handleAction226()
				local humanoidRootPart = localPlayer24.Character and localPlayer24.Character:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return nil
				end
				local huge = math.huge
				local huge2 = math.huge
				local value289 = nil
				local name = nil
				local value290 = nil
				local name2 = nil
				for _, player_ in ipairs(service18:GetPlayers()) do
					if player_ ~= localPlayer24 and player_.Character then
						local humanoidRootPart2 = player_.Character:FindFirstChild("HumanoidRootPart")
						local tool = player_.Character:FindFirstChildOfClass("Tool")
						if humanoidRootPart2 and tool and handleAction222(tool.Name) then
							local magnitude = (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude
							if magnitude <= 20 then
								local text19 = tool.Name:lower()
								if text19:find("slap", 1, true) or text19:find("rainbowrath", 1, true) or text19:find("rage", 1, true) then
									if magnitude < huge2 then
										name = tool.Name
										huge2 = magnitude
										value289 = player_
									end
								end
								if magnitude < huge then
									name2 = tool.Name
									huge = magnitude
									value290 = player_
								end
							end
						end
					end
				end
				if value289 then
					return value289, name, math.floor(huge2)
				end
				if value290 then
					return value290, name2, math.floor(huge)
				end
				return nil
			end
			local items76 = nil
			local items77 = nil
			local items78 = nil
			local function handleAction227(argument309)
				local num = tonumber(argument309)
				if not num or num <= 0 then
					return nil
				end
				if num >= 1e9 then
					return string.format("$%.2fB/s", num / 1e9)
				end
				if num >= 1000000 then
					return string.format("$%.2fM/s", num / 1000000)
				end
				if num >= 1000 then
					return string.format("$%.1fk/s", num / 1000)
				end
				return "$" .. math.floor(num) .. "/s"
			end
			task.spawn(function()
				while true do
					task.wait(0.25)
					pcall(function()
						local character = localPlayer24.Character and localPlayer24.Character:FindFirstChild("HumanoidRootPart")
						if not character then
							return
						end
						for _, player_ in ipairs(service18:GetPlayers()) do
							if player_ ~= localPlayer24 and player_.Character then
								local tool = player_.Character:FindFirstChildOfClass("Tool")
								if tool then
									local text20 = tool.Name:lower()
									local humanoidRootPart = player_.Character:FindFirstChild("HumanoidRootPart")
									humanoidRootPart = humanoidRootPart and (humanoidRootPart.Position - character.Position).Magnitude
									if humanoidRootPart and humanoidRootPart <= 100 then
										if text20:find("boogie", 1, true) and humanoidRootPart <= 80 then
											items77 = { plr = player_, dist = math.floor(humanoidRootPart), t = os.clock() }
										elseif text20:find("airstrike", 1, true) or text20:find("air strike", 1, true) then
											items78 = { plr = player_, dist = math.floor(humanoidRootPart), t = os.clock() }
										end
									end
								end
							end
						end
					end)
					if localPlayer24:GetAttribute("Stealing") then
						local name = nil
						local value291 = nil
						pcall(function()
							local mynxxStealStatus = _G.Mynxx_StealStatus
							if mynxxStealStatus and mynxxStealStatus.target and mynxxStealStatus.target.name then
								name = mynxxStealStatus.target.name
								value291 = handleAction227(mynxxStealStatus.target.mps or mynxxStealStatus.target.value)
							end
						end)
						if name then
							items76 = { txt = tostring(name) .. "", gen = value291, t = os.clock() }
						end
					end
				end
			end)
			local function handleAction228(argument310, argument311, argument312, argument313)
				local now2 = os.clock()
				if now2 - (_G.__MynxxSelfCmdT or -100) < 3 then
					return
				end
				if items71[argument310] and now2 - items71[argument310] < 8 then
					return
				end
				items71[argument310] = now2
				if not argument311 then
					argument311, argument312, argument313 = handleAction225()
				end
				if argument310 == "Ragdoll / Slap" and argument312 then
					argument310 = handleAction222(argument312) or argument310
				end
				local items761 = items76 and now2 - items76.t < 10
				local txt = nil
				local gen = nil
				if items761 then
					txt = items76.txt
					gen = items76.gen
				end
				table.insert(items69, 1, {
					who = argument311 and argument311.DisplayName .. " (@" .. argument311.Name .. ")" or "Unknown",
					userId = argument311 and argument311.UserId or nil,
					grief = argument310,
					tool = argument312,
					dist = argument313,
					carried = txt,
					carriedGen = gen,
					t = now2,
				})
				while #items69 > 20 do
					table.remove(items69)
				end
				handleAction224()
				pcall(function()
					local uiStroke3 = frame5:FindFirstChildOfClass("UIStroke")
					if uiStroke3 then
						uiStroke3.Color = Theme.Accent
						uiStroke3.Transparency = 0
						task.delay(1, function()
							uiStroke3.Color = Theme.Stroke
							uiStroke3.Transparency = 0.35
						end)
					end
				end)
			end
			local function handleAction229(argument314, argument315)
				local attribute = argument314:GetAttribute(argument315)
				if attribute == false or attribute == nil then
					return
				end
				local text21 = tostring(argument315):lower()
				if text21 == "stealing" or text21 == "stealingindex" then
					return
				end
				if text21:sub(1, 7) == "ragdoll" then
					if type(attribute) == "number" and attribute <= Workspace:GetServerTimeNow() then
						return
					end
					local value292, value293, value294 = handleAction226()
					if value292 then
						handleAction228("Ragdoll / Slap", value292, value293, value294)
					else
						local items781 = items78
						if items78 then
							local t = items78.t
							items781 = os.clock() - t < 8
						end
						if items781 then
							handleAction228("Airstrike", items78.plr, "Airstrike", items78.dist)
						else
							handleAction228("Ragdoll / Slap")
						end
					end
					return
				end
				for k in pairs(options74) do
					if k ~= "ragdoll" and text21:sub(1, #k) == k then
						handleAction228(k:sub(1, 1):upper() .. k:sub(2) .. " (Admin Panel)")
						return
					end
				end
				local value295 = handleAction223(text21)
				if value295 then
					handleAction228(value295)
				end
			end
			local function handleAction230(argument316)
				if not argument316 then
					return
				end
				pcall(function()
					argument316.AttributeChanged:Connect(function(attribute)
						handleAction229(argument316, attribute)
					end)
				end)
			end
			local items79 = { "balloon", "rocket", "jail", "jumpscare", "nightvision" }
			local function handleAction231(argument317)
				if not argument317 then
					return
				end
				handleAction230(argument317)
				pcall(function()
					argument317.DescendantAdded:Connect(function(descendant)
						if descendant:IsA("Tool") or descendant:IsA("Accessory") then
							return
						end
						if descendant:FindFirstAncestorOfClass("Tool") then
							return
						end
						local text22 = descendant.Name:lower()
						for _, value296 in ipairs(items79) do
							if text22:find(value296, 1, true) then
								handleAction228(value296:sub(1, 1):upper() .. value296:sub(2) .. " (Admin Panel)")
								return
							end
						end
						local value297 = handleAction222(descendant.Name) or handleAction223(descendant.Name)
						if value297 then
							handleAction228(value297)
						end
					end)
				end)
				local humanoid = argument317:FindFirstChildOfClass("Humanoid")
				if humanoid then
					pcall(function()
						humanoid.StateChanged:Connect(function(old, new4)
							if new4 == Enum.HumanoidStateType.Ragdoll or new4 == Enum.HumanoidStateType.FallingDown or new4 == Enum.HumanoidStateType.Physics then
								local value298, value299, value300 = handleAction226()
								if value298 then
									handleAction228("Ragdoll / Slap", value298, value299, value300)
								else
									local items782 = items78
									if items78 then
										local t = items78.t
										items782 = os.clock() - t < 8
									end
									if items782 then
										handleAction228("Airstrike", items78.plr, "Airstrike", items78.dist)
									end
								end
							end
						end)
					end)
					pcall(function()
						humanoid.AnimationPlayed:Connect(function(argument318)
							local text23 = ""
							pcall(function()
								text23 = (argument318.Animation and argument318.Animation.Name or "") .. " " .. (argument318.Name or "")
							end)
							text23 = text23:lower()
							if text23:find("boogie", 1, true) then
								handleAction228("Boogie Bomb")
							elseif text23:find("dance", 1, true) or text23:find("twerk", 1, true) then
								local value301, value302, value303 = handleAction225()
								if value301 and value302 and value303 and value303 <= 80 then
									handleAction228("Boogie Bomb")
								end
							end
							return
						end)
					end)
				end
			end
			handleAction230(localPlayer24)
			if localPlayer24.Character then
				handleAction231(localPlayer24.Character)
			end
			localPlayer24.CharacterAdded:Connect(function(character)
				task.wait(0.2)
				handleAction231(character)
			end)
			local items80 = {
				{ kw = "boogie", name = "Boogie Bomb" },
				{ kw = "body swap", name = "Body Swap Potion" },
				{ kw = "bodyswap", name = "Body Swap Potion" },
				{ kw = "trap", name = "Trap" },
				{ kw = "subspace", name = "Subspace Mine" },
				{ kw = "beehive", name = "Beehive" },
				{ kw = "sentry", name = "All-Seeing Sentry" },
				{ kw = "rage table", name = "Rage Table" },
				{ kw = "gummy", name = "Gummy Slap" },
				{ kw = "medusa", name = "Medusa's Head" },
			}
			Workspace.DescendantAdded:Connect(function(descendant)
				local text24 = descendant.Name:lower()
				local name = nil
				for _, value304 in ipairs(items80) do
					if text24:find(value304.kw, 1, true) then
						name = value304.name
						break
					end
				end
				if not name then
					return
				end
				task.defer(function()
					pcall(function()
						local humanoidRootPart = localPlayer24.Character and localPlayer24.Character:FindFirstChild("HumanoidRootPart")
						if not humanoidRootPart then
							return
						end
						local position
						if descendant:IsA("BasePart") then
							position = descendant.Position
						else
							if not descendant:IsA("Model") then
								return
							end
							position = descendant:GetPivot().Position
						end
						if (position - humanoidRootPart.Position).Magnitude > 60 then
							return
						end
						for _, player_ in ipairs(service18:GetPlayers()) do
							if player_.Character and descendant:IsDescendantOf(player_.Character) then
								return
							end
						end
						handleAction228(name)
					end)
				end)
			end)
		end)
	end)
	do
		local service19 = game:GetService("Players")
		RunService2 = game:GetService("RunService")
		local Workspace2 = game:GetService("Workspace")
		local service20 = game:GetService("UserInputService")
		localPlayer22 = service19.LocalPlayer
		playerGui_ = localPlayer22:WaitForChild("PlayerGui")
		currentCamera = Workspace2.CurrentCamera
		touchEnabled1 = service20.TouchEnabled and not service20.KeyboardEnabled and not service20.MouseEnabled
	end
	local options75 = {
		Black = Color3.fromRGB(6, 8, 14),
		BgDark = Color3.fromRGB(9, 13, 24),
		BgPanel = Color3.fromRGB(13, 20, 38),
		Stroke = Color3.fromRGB(30, 46, 82),
		DarkBlue = Color3.fromRGB(18, 38, 78),
		LightBlue = Color3.fromRGB(92, 165, 255),
		BlueLine = Color3.fromRGB(60, 120, 220),
		White = Color3.fromRGB(255, 255, 255),
		TextDim = Color3.fromRGB(150, 165, 195),
	}
	local gothamMedium2 = Enum.Font.GothamMedium
	local gothamBold2 = Enum.Font.GothamBold
	task.spawn(function()
		if touchEnabled1 then
			return
		end
		if playerGui_:FindFirstChild("RiftStatusHUD") then
			playerGui_.RiftStatusHUD:Destroy()
		end
		local function handleAction232(argument319, argument320)
			local instance4 = Instance.new(argument319)
			local value305 = pairs
			local argument3201 = argument320 or {}
			for k, value306 in value305(argument3201) do
				instance4[k] = value306
			end
			return instance4
		end
		local function handleAction233(parent, argument321)
			local instance4 = Instance.new("UICorner")
			instance4.CornerRadius = UDim.new(0, argument321 or 8)
			instance4.Parent = parent
			return instance4
		end
		local ScreenGui = handleAction232("ScreenGui", {
			Name = "RiftStatusHUD",
			ResetOnSpawn = false,
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			Parent = playerGui_,
		})
		local Frame = handleAction232("Frame", {
			Name = "Outer",
			AnchorPoint = Vector2.new(0.5, 1),
			Size = UDim2.new(0, 348, 0, 58),
			Position = UDim2.new(0.5, 0, 1, -86),
			BackgroundColor3 = options75.BgDark,
			BorderSizePixel = 0,
			Active = false,
			Parent = ScreenGui,
		})
		handleAction233(Frame, 12)
		local uiScale = Instance.new("UIScale")
		uiScale.Parent = Frame
		local function handleAction234()
			local viewportSize = currentCamera and currentCamera.ViewportSize or Vector2.new(1920, 1080)
			uiScale.Scale = math.clamp(math.min(viewportSize.X / 1920, viewportSize.Y / 1080), 0.75, 1)
		end
		handleAction234()
		if currentCamera then
			currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(handleAction234)
		end
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Rotation = 90
		local new = ColorSequenceKeypoint.new
		local entry103 = 1
		local bgDark = options75.BgDark
		uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, options75.Black), new(entry103, bgDark) })
		uiGradient.Parent = Frame
		local uiStroke2 = Instance.new("UIStroke")
		uiStroke2.Thickness = 2
		uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke2.Parent = Frame
		local uiGradient2 = Instance.new("UIGradient")
		local colorSequence = ColorSequence.new
		local items81 = {}
		local value307 = ColorSequenceKeypoint.new(0, options75.DarkBlue)
		local value308 = ColorSequenceKeypoint.new(0.35, options75.DarkBlue)
		local value309 = ColorSequenceKeypoint.new(0.5, options75.LightBlue)
		local value310 = ColorSequenceKeypoint.new(0.65, options75.DarkBlue)
		local new2 = ColorSequenceKeypoint.new
		local darkBlue = options75.DarkBlue
		items81[1] = value307
		items81[2] = value308
		items81[3] = value309
		items81[4] = value310
		do
			local values = table.pack(new2(1, darkBlue))
			table.move(values, 1, values.n, 5, items81)
		end
		uiGradient2.Color = colorSequence(items81)
		uiGradient2.Parent = uiStroke2
		local uiStroke3 = Instance.new("UIStroke")
		uiStroke3.Thickness = 5
		uiStroke3.Transparency = 0.75
		uiStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke3.Parent = Frame
		local uiGradient3 = Instance.new("UIGradient")
		local colorSequence2 = ColorSequence.new
		local items82 = {}
		local value311 = ColorSequenceKeypoint.new(0, options75.DarkBlue)
		local value312 = ColorSequenceKeypoint.new(0.5, options75.LightBlue)
		local new3 = ColorSequenceKeypoint.new
		local darkBlue2 = options75.DarkBlue
		items82[1] = value311
		items82[2] = value312
		do
			local values = table.pack(new3(1, darkBlue2))
			table.move(values, 1, values.n, 3, items82)
		end
		uiGradient3.Color = colorSequence2(items82)
		uiGradient3.Parent = uiStroke3
		_G.__4HubPulse(function(argument322)
			if not uiStroke2.Parent then
				return
			end
			local rotation = argument322 * 120 % 360
			local number67 = argument322 * 0.6 % 1 * 2 - 1
			uiGradient2.Rotation = rotation
			uiGradient2.Offset = Vector2.new(number67, 0)
			uiGradient3.Rotation = rotation
			uiGradient3.Offset = Vector2.new(number67, 0)
			uiStroke3.Transparency = 0.85 + 0.18 * math.abs(number67)
		end)
		local ImageLabel = handleAction232("ImageLabel", {
			Name = "Dot",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0, 28, 0.5, 0),
			Size = UDim2.new(0, 40, 0, 40),
			BackgroundColor3 = options75.BgDark,
			BackgroundTransparency = 0,
			Image = "rbxassetid://84149277273810",
			ResampleMode = Enum.ResamplerMode.Default,
			ScaleType = Enum.ScaleType.Fit,
			BorderSizePixel = 0,
			ZIndex = 2,
			Parent = Frame,
		})
		handleAction233(ImageLabel, 8)
		handleAction232("UIStroke", {
			Color = options75.LightBlue,
			Thickness = 1,
			Transparency = 0.35,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Parent = ImageLabel,
		})
		handleAction232("TextLabel", {
			Name = "Title",
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 58, 0, 6),
			Size = UDim2.new(0, 150, 0, 15),
			Font = gothamBold2,
			Text = "4Hub HUB",
			TextSize = 15,
			TextColor3 = options75.White,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 2,
			Parent = Frame,
		}).AutoLocalize = false
		local TextLabel = handleAction232("TextLabel", {
			Name = "Link",
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 58, 0, 23),
			Size = UDim2.new(0, 150, 0, 15),
			Font = gothamBold2,
			Text = "discord.gg/4Hubhub",
			TextSize = 13,
			TextColor3 = options75.LightBlue,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 2,
			Parent = Frame,
		})
		TextLabel.AutoLocalize = false
		local uiGradient4 = Instance.new("UIGradient")
		local function handleAction235(argument323)
			local lightBlue = argument323 or options75.LightBlue
			local color, value313, value314 = Color3.toHSV(lightBlue)
			local color2 = Color3.fromHSV(color, math.max(0, value313 * 0.35), math.min(1, value314 + 0.15))
			local value315 = uiGradient4
			local colorSequence3 = ColorSequence.new
			local items83 = {}
			local value316 = ColorSequenceKeypoint.new(0, lightBlue)
			local value317 = ColorSequenceKeypoint.new(0.34, lightBlue)
			local value318 = ColorSequenceKeypoint.new(0.44, color2)
			local value319 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255))
			local value320 = ColorSequenceKeypoint.new(0.56, color2)
			local value321 = ColorSequenceKeypoint.new(0.66, lightBlue)
			local new4 = ColorSequenceKeypoint.new
			items83[1] = value316
			items83[2] = value317
			items83[3] = value318
			items83[4] = value319
			items83[5] = value320
			items83[6] = value321
			do
				local values = table.pack(new4(1, lightBlue))
				table.move(values, 1, values.n, 7, items83)
			end
			value315.Color = colorSequence3(items83)
		end
		handleAction235(options75.LightBlue)
		if _G.__4HubOnTheme then
			_G.__4HubOnTheme(function(argument324)
				handleAction235(argument324 and argument324.LightBlue or options75.LightBlue)
			end)
		end
		uiGradient4.Parent = TextLabel
		local service21 = game:GetService("RunService")
		local entry104 = 0
		local connection_ = nil
		connection_ = service21.RenderStepped:Connect(function(deltaTime)
			if _G.__4HubDead or not TextLabel.Parent then
				if connection_ then
					connection_:Disconnect()
				end
				return
			end
			entry104 = (entry104 + (deltaTime or 0) * 0.28) % 1
			uiGradient4.Offset = Vector2.new(entry104 * 2.5 - 1.25, 0)
		end)
		handleAction232("TextLabel", {
			Name = "Credit",
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 58, 0, 40),
			Size = UDim2.new(0, 150, 0, 13),
			Font = gothamMedium2,
			Text = "made by @ljsvrpt",
			TextSize = 10,
			TextColor3 = options75.TextDim,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 2,
			Parent = Frame,
		}).AutoLocalize = false
		handleAction232("Frame", {
			Position = UDim2.new(1, -132, 0.5, -14),
			Size = UDim2.new(0, 1, 0, 28),
			BackgroundColor3 = options75.BlueLine,
			BackgroundTransparency = 0.25,
			BorderSizePixel = 0,
			ZIndex = 2,
			Parent = Frame,
		})
		handleAction232("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -118, 0, 8),
			Size = UDim2.new(0, 40, 0, 15),
			Font = gothamBold2,
			Text = "FPS",
			TextSize = 10,
			TextColor3 = options75.TextDim,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 2,
			Parent = Frame,
		}).AutoLocalize = false
		local TextLabel2 = handleAction232("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -74, 0, 8),
			Size = UDim2.new(0, 68, 0, 15),
			Font = gothamBold2,
			Text = "0",
			TextSize = 14,
			TextColor3 = options75.LightBlue,
			TextXAlignment = Enum.TextXAlignment.Right,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 2,
			Parent = Frame,
		})
		TextLabel2.AutoLocalize = false
		handleAction232("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -118, 0, 28),
			Size = UDim2.new(0, 40, 0, 15),
			Font = gothamBold2,
			Text = "PING",
			TextSize = 10,
			TextColor3 = options75.TextDim,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 2,
			Parent = Frame,
		}).AutoLocalize = false
		local TextLabel3 = handleAction232("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -74, 0, 28),
			Size = UDim2.new(0, 66, 0, 15),
			Font = gothamBold2,
			Text = "0ms",
			TextSize = 14,
			TextColor3 = options75.LightBlue,
			TextXAlignment = Enum.TextXAlignment.Right,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 2,
			Parent = Frame,
		})
		TextLabel3.AutoLocalize = false
		if _G.__4HubOnTheme then
			_G.__4HubOnTheme(function(argument325)
				local lightBlue = argument325 and argument325.LightBlue or options75.LightBlue
				TextLabel.TextColor3 = lightBlue
				TextLabel2.TextColor3 = lightBlue
				TextLabel3.TextColor3 = lightBlue
			end)
		end
		local number68 = 0
		local now2 = tick()
		RunService2.Heartbeat:Connect(function()
			number68 += 1
			local now3 = tick()
			if now3 - now2 >= 1 then
				TextLabel2.Text = tostring(number68)
				number68 = 0
				now2 = now3
			end
		end)
		task.spawn(function()
			while Frame and Frame.Parent do
				local number69 = math.floor(localPlayer22:GetNetworkPing() * 1000)
				TextLabel3.Text = tostring(number69) .. "ms"
				task.wait(0.25)
			end
		end)
	end)
end
do
	local function handleAction236()
		local players18 = game:GetService("Players")
		local TweenService2 = game:GetService("TweenService")
		game:GetService("UserInputService")
		game:GetService("RunService")
		game:GetService("Workspace")
		local localPlayer25 = players18.LocalPlayer
		local playerGui_ = localPlayer25:WaitForChild("PlayerGui")
		local options76 = {
			Black = Color3.fromRGB(6, 8, 14),
			BgDark = Color3.fromRGB(9, 13, 24),
			BgPanel = Color3.fromRGB(13, 20, 38),
			BgSel = Color3.fromRGB(20, 42, 86),
			Stroke = Color3.fromRGB(30, 46, 82),
			DarkBlue = Color3.fromRGB(18, 38, 78),
			LightBlue = Color3.fromRGB(92, 165, 255),
			BlueLine = Color3.fromRGB(60, 120, 220),
			White = Color3.fromRGB(255, 255, 255),
			TextDim = Color3.fromRGB(150, 165, 195),
		}
		local gothamMedium2 = Enum.Font.GothamMedium
		local gothamBold2 = Enum.Font.GothamBold
		local function handleAction237(parent, argument326)
			local instance4 = Instance.new("UICorner")
			instance4.CornerRadius = UDim.new(0, argument326 or 8)
			instance4.Parent = parent
			return instance4
		end
		local function createUIStroke2(parent, color, thickness, transparency)
			local uiStroke2 = Instance.new("UIStroke")
			uiStroke2.Color = color or options76.Stroke
			uiStroke2.Thickness = thickness or 1
			uiStroke2.Transparency = transparency or 0
			uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uiStroke2.Parent = parent
			return uiStroke2
		end
		local function handleAction238(argument327)
			return string.format("#%02X%02X%02X", math.floor(argument327.R * 255 + 0.5), math.floor(argument327.G * 255 + 0.5), math.floor(argument327.B * 255 + 0.5))
		end
		local value322 = nil
		_G.SetAutoGrabTarget = function(selectedTargetPrompt)
			value322 = selectedTargetPrompt
			_G.SelectedTargetPrompt = selectedTargetPrompt
		end
		local function handleAction239(argument328)
			local character = localPlayer25.Character
			if not character then
				return math.huge
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return math.huge
			end
			local parent = argument328.Parent
			if parent and parent:IsA("Attachment") then
				parent = parent.Parent
			end
			if parent and parent:IsA("BasePart") then
				return (parent.Position - humanoidRootPart.Position).Magnitude
			end
			return math.huge
		end
		local function handleAction240(argument329)
			if argument329.ObjectText and argument329.ObjectText ~= "" then
				return argument329.ObjectText
			end
			local parent = argument329.Parent
			if parent and parent.Name ~= "" then
				return parent.Name
			end
			return "Unknown Pet"
		end
		local stealTargetUI = playerGui_:FindFirstChild("StealTargetUI")
		if stealTargetUI then
			stealTargetUI:Destroy()
		end
		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "StealTargetUI"
		screenGui2.ResetOnSpawn = false
		screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui2.IgnoreGuiInset = true
		screenGui2.Parent = playerGui_
		_G.setStealTargetHidden = function(argument330)
			if screenGui2 then
				screenGui2.Enabled = not argument330
			end
		end
		local udim22 = UDim2.fromOffset(292, 300)
		local frame5 = Instance.new("Frame")
		frame5.Name = "Window"
		frame5.AnchorPoint = Vector2.new(0.5, 0)
		frame5.Size = udim22
		frame5.Position = UDim2.new(0.75, 0, 0, 16)
		frame5.BackgroundColor3 = options76.BgDark
		frame5.BorderSizePixel = 0
		frame5.ClipsDescendants = true
		frame5.Active = true
		frame5.Parent = screenGui2
		if _G.__4HubRegisterScale then
			_G.__4HubRegisterScale(frame5)
		end
		handleAction237(frame5, 12)
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Rotation = 90
		local new = ColorSequenceKeypoint.new
		local bgDark = options76.BgDark
		uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, options76.Black), new(1, bgDark) })
		uiGradient.Parent = frame5
		local uiStroke2 = Instance.new("UIStroke")
		uiStroke2.Thickness = 2.5
		uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke2.Parent = frame5
		local uiGradient2 = Instance.new("UIGradient")
		local colorSequence = ColorSequence.new
		local items84 = {}
		local value323 = ColorSequenceKeypoint.new(0, options76.DarkBlue)
		local value324 = ColorSequenceKeypoint.new(0.5, options76.LightBlue)
		local new2 = ColorSequenceKeypoint.new
		local darkBlue = options76.DarkBlue
		items84[1] = value323
		items84[2] = value324
		do
			local values = table.pack(new2(1, darkBlue))
			table.move(values, 1, values.n, 3, items84)
		end
		uiGradient2.Color = colorSequence(items84)
		uiGradient2.Parent = uiStroke2
		local sg = nil
		_G.__4HubSpin(uiGradient2, 90)
		_G.__4HubPulse(function(argument331)
			if sg then
				sg.Rotation = argument331 * 150 % 360
			end
		end)
		local instance4 = Instance.new("Frame")
		instance4.Name = "Header"
		instance4.Size = UDim2.new(1, 0, 0, 42)
		instance4.BackgroundTransparency = 1
		instance4.Active = true
		instance4.Parent = frame5
		local instance5 = Instance.new("TextLabel")
		instance5.Name = "Title"
		instance5.Size = UDim2.new(1, 0, 0, 42)
		instance5.BackgroundTransparency = 1
		instance5.Font = gothamBold2
		instance5.Text = "Steal Target"
		instance5.TextColor3 = options76.White
		instance5.TextSize = 15
		instance5.TextXAlignment = Enum.TextXAlignment.Center
		instance5.Parent = instance4
		local frame6 = Instance.new("Frame")
		frame6.Name = "HeaderLine"
		frame6.Size = UDim2.new(1, -28, 0, 2)
		frame6.Position = UDim2.new(0, 14, 0, 40)
		frame6.BackgroundColor3 = options76.BlueLine
		frame6.BorderSizePixel = 0
		frame6.Parent = frame5
		handleAction237(frame6, 1)
		local instance6 = Instance.new("UIGradient")
		local colorSequence2 = ColorSequence.new
		local items85 = {}
		local value325 = ColorSequenceKeypoint.new(0, options76.DarkBlue)
		local value326 = ColorSequenceKeypoint.new(0.5, options76.LightBlue)
		local new3 = ColorSequenceKeypoint.new
		local entry105 = 1
		local darkBlue2 = options76.DarkBlue
		items85[1] = value325
		items85[2] = value326
		do
			local values = table.pack(new3(entry105, darkBlue2))
			table.move(values, 1, values.n, 3, items85)
		end
		instance6.Color = colorSequence2(items85)
		instance6.Parent = frame6
		local textBox = Instance.new("TextBox")
		textBox.Name = "Search"
		textBox.Position = UDim2.fromOffset(12, 48)
		textBox.Size = UDim2.new(1, -24, 0, 20)
		textBox.BackgroundColor3 = Color3.fromRGB(28, 40, 68)
		textBox.BorderSizePixel = 0
		textBox.Font = gothamMedium2
		textBox.PlaceholderText = "Search brainrot…"
		textBox.PlaceholderColor3 = options76.TextDim
		textBox.Text = ""
		textBox.TextColor3 = options76.White
		textBox.TextSize = 12
		textBox.TextXAlignment = Enum.TextXAlignment.Left
		textBox.ClearTextOnFocus = false
		textBox.Active = true
		textBox.Parent = frame5
		handleAction237(textBox, 6)
		createUIStroke2(textBox, options76.Stroke, 1)
		local uiPadding = Instance.new("UIPadding")
		uiPadding.PaddingLeft = UDim.new(0, 10)
		uiPadding.PaddingRight = UDim.new(0, 10)
		uiPadding.Parent = textBox
		local text25 = ""
		local scrollingFrame = Instance.new("ScrollingFrame")
		scrollingFrame.Name = "Body"
		scrollingFrame.Position = UDim2.fromOffset(0, 74)
		scrollingFrame.Size = UDim2.new(1, 0, 1, -74)
		scrollingFrame.BackgroundTransparency = 1
		scrollingFrame.BorderSizePixel = 0
		scrollingFrame.ScrollBarThickness = 3
		scrollingFrame.ScrollBarImageColor3 = options76.LightBlue
		scrollingFrame.ScrollBarImageTransparency = 0.35
		scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		scrollingFrame.Active = true
		scrollingFrame.Parent = frame5
		local uiPadding2 = Instance.new("UIPadding")
		uiPadding2.PaddingLeft = UDim.new(0, 12)
		uiPadding2.PaddingRight = UDim.new(0, 12)
		uiPadding2.PaddingBottom = UDim.new(0, 12)
		uiPadding2.Parent = scrollingFrame
		local instance7 = Instance.new("UIListLayout")
		instance7.Padding = UDim.new(0, 8)
		instance7.SortOrder = Enum.SortOrder.LayoutOrder
		instance7.Parent = scrollingFrame
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "Empty"
		textLabel.Size = UDim2.new(1, 0, 0, 30)
		textLabel.BackgroundTransparency = 1
		textLabel.Font = gothamMedium2
		textLabel.Text = "No targets in range…"
		textLabel.TextColor3 = options76.TextDim
		textLabel.TextSize = 12
		textLabel.LayoutOrder = 9999
		textLabel.Visible = false
		textLabel.Parent = scrollingFrame
		local items86 = {}
		local value327 = nil
		local value328 = nil
		local tweenInfo = TweenInfo.new(0.18, Enum.EasingStyle.Quad)
		local function handleAction241()
			local text251 = text25
			if text251 == "" then
				for _, value329 in pairs(items86) do
					value329.frame.Visible = true
				end
				return
			end
			local entry106 = false
			for k, value330 in pairs(items86) do
				local visible = tostring(value330.label and value330.label.Text or handleAction240(k)):lower():find(text251, 1, true) ~= nil
				value330.frame.Visible = visible
				if visible then
					entry106 = true
				end
			end
			if not entry106 then
				for _, value331 in pairs(items86) do
					value331.frame.Visible = true
				end
			end
		end
		textBox:GetPropertyChangedSignal("Text"):Connect(function()
			text25 = textBox.Text:lower():gsub("^%s+", ""):gsub("%s+$", "")
			handleAction241()
		end)
		local function handleAction242(argument332)
			local instance8 = Instance.new("TextButton")
			instance8.Name = "Target"
			instance8.Size = UDim2.new(1, 0, 0, 66)
			instance8.BackgroundColor3 = options76.BgDark
			instance8.AutoButtonColor = false
			instance8.Text = ""
			instance8.BorderSizePixel = 0
			instance8.Parent = scrollingFrame
			handleAction237(instance8, 8)
			local value332 = createUIStroke2(instance8, options76.Stroke, 1)
			local frame7 = Instance.new("Frame")
			frame7.Size = UDim2.new(0, 3, 0.55, 0)
			frame7.Position = UDim2.new(0, 0, 0.225, 0)
			frame7.BackgroundColor3 = options76.DarkBlue
			frame7.BorderSizePixel = 0
			frame7.Parent = instance8
			handleAction237(frame7, 2)
			local frame8 = Instance.new("Frame")
			frame8.AnchorPoint = Vector2.new(0, 0.5)
			frame8.Position = UDim2.new(0, 6, 0.5, 0)
			frame8.Size = UDim2.fromOffset(60, 60)
			frame8.BackgroundColor3 = options76.DarkBlue
			frame8.BorderSizePixel = 0
			frame8.ClipsDescendants = true
			frame8.Parent = instance8
			handleAction237(frame8, 8)
			createUIStroke2(frame8, options76.LightBlue, 1)
			local enabled57 = false
			local function handleAction243()
				local enabled571 = enabled57
				local enabled5711
				if enabled57 then
					enabled5711 = enabled571
				else
					enabled5711 = not _G.__4HubBrainrotViewport
				end
				if enabled5711 then
					return enabled57
				end
				if _G.__4HubBrainrotViewport(frame8, _G.__4HubPromptIndex and _G.__4HubPromptIndex(argument332) or handleAction240(argument332), _G.__4HubPromptModel and _G.__4HubPromptModel(argument332)) then
					enabled57 = true
					frame8:SetAttribute("4HubImgSet", true)
				end
				return enabled57
			end
			handleAction243()
			if not enabled57 then
				task.spawn(function()
					for i = 1, 80 do
						if not frame8.Parent then
							return
						end
						if handleAction243() then
							return
						end
						task.wait(0.1)
					end
				end)
			end
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.Size = UDim2.new(1, -84, 0, 14)
			textLabel2.Position = UDim2.fromOffset(74, 4)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Font = gothamBold2
			textLabel2.Text = handleAction240(argument332)
			textLabel2.TextColor3 = options76.White
			textLabel2.TextSize = 12
			textLabel2.TextXAlignment = Enum.TextXAlignment.Left
			textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel2.Parent = instance8
			local textLabel3 = Instance.new("TextLabel")
			textLabel3.Size = UDim2.new(1, -84, 0, 11)
			textLabel3.Position = UDim2.fromOffset(74, 19)
			textLabel3.BackgroundTransparency = 1
			textLabel3.Font = gothamMedium2
			textLabel3.Text = "Owner: ..."
			textLabel3.TextColor3 = options76.TextDim
			textLabel3.TextSize = 10
			textLabel3.TextXAlignment = Enum.TextXAlignment.Left
			textLabel3.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel3.Parent = instance8
			local instance9 = Instance.new("TextLabel")
			instance9.Size = UDim2.new(1, -84, 0, 11)
			instance9.Position = UDim2.fromOffset(74, 30)
			instance9.BackgroundTransparency = 1
			instance9.Font = gothamMedium2
			instance9.RichText = true
			instance9.Text = "Mutation: Normal"
			instance9.TextColor3 = options76.TextDim
			instance9.TextSize = 10
			instance9.TextXAlignment = Enum.TextXAlignment.Left
			instance9.Parent = instance8
			local textLabel4 = Instance.new("TextLabel")
			textLabel4.Size = UDim2.new(1, -84, 0, 11)
			textLabel4.Position = UDim2.fromOffset(74, 41)
			textLabel4.BackgroundTransparency = 1
			textLabel4.Font = gothamMedium2
			textLabel4.Text = "Rarity: ..."
			textLabel4.TextColor3 = options76.TextDim
			textLabel4.TextSize = 10
			textLabel4.TextXAlignment = Enum.TextXAlignment.Left
			textLabel4.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel4.Parent = instance8
			local textLabel5 = Instance.new("TextLabel")
			textLabel5.Size = UDim2.new(1, -84, 0, 13)
			textLabel5.Position = UDim2.fromOffset(74, 52)
			textLabel5.BackgroundTransparency = 1
			textLabel5.Font = gothamBold2
			textLabel5.RichText = true
			textLabel5.Text = "Gen: ..."
			textLabel5.TextColor3 = options76.TextDim
			textLabel5.TextSize = 11
			textLabel5.TextXAlignment = Enum.TextXAlignment.Left
			textLabel5.Parent = instance8
			local options77
			options77 = {
				frame = instance8,
				sub = instance9,
				price = textLabel5,
				imgBox = frame8,
				traitBox = nil,
				label = textLabel2,
				owner = textLabel3,
				rarity = textLabel4,
				imgSet = enabled57,
				gen = 0,
				prompt = argument332,
				selected = false,
				sg = nil,
				setSelected = function(selected)
					options77.selected = selected
					if selected then
						TweenService2:Create(instance8, tweenInfo, { BackgroundColor3 = options76.BgSel }):Play()
						TweenService2:Create(value332, tweenInfo, { Color = options76.LightBlue }):Play()
						value332.Thickness = 1.6
						TweenService2:Create(frame7, tweenInfo, { BackgroundColor3 = options76.LightBlue }):Play()
						TweenService2:Create(textLabel2, tweenInfo, { TextColor3 = options76.LightBlue }):Play()
						if not options77.sg then
							local uiGradient3 = Instance.new("UIGradient")
							local colorSequence3 = ColorSequence.new
							local items87 = {}
							local value333 = ColorSequenceKeypoint.new(0, options76.DarkBlue)
							local value334 = ColorSequenceKeypoint.new(0.5, options76.LightBlue)
							local new4 = ColorSequenceKeypoint.new
							local darkBlue3 = options76.DarkBlue
							items87[1] = value333
							items87[2] = value334
							do
								local values = table.pack(new4(1, darkBlue3))
								table.move(values, 1, values.n, 3, items87)
							end
							uiGradient3.Color = colorSequence3(items87)
							uiGradient3.Parent = value332
							options77.sg = uiGradient3
						end
						sg = options77.sg
					else
						if options77.sg then
							options77.sg:Destroy()
							options77.sg = nil
						end
						TweenService2:Create(instance8, tweenInfo, { BackgroundColor3 = options76.BgDark }):Play()
						TweenService2:Create(value332, tweenInfo, { Color = options76.Stroke }):Play()
						value332.Thickness = 1
						TweenService2:Create(frame7, tweenInfo, { BackgroundColor3 = options76.DarkBlue }):Play()
						TweenService2:Create(textLabel2, tweenInfo, { TextColor3 = options76.White }):Play()
					end
				end,
			}
			instance8.MouseEnter:Connect(function()
				if options77.selected then
					return
				end
				local options78 = { Color = options76.LightBlue }
				TweenService2:Create(value332, TweenInfo.new(0.15), options78):Play()
				local options79 = { BackgroundColor3 = options76.LightBlue }
				TweenService2:Create(frame7, TweenInfo.new(0.15), options79):Play()
			end)
			instance8.MouseLeave:Connect(function()
				if options77.selected then
					return
				end
				local options80 = { Color = options76.Stroke }
				TweenService2:Create(value332, TweenInfo.new(0.15), options80):Play()
				local options81 = { BackgroundColor3 = options76.DarkBlue }
				TweenService2:Create(frame7, TweenInfo.new(0.15), options81):Play()
			end)
			instance8.MouseButton1Click:Connect(function()
				if value327 == argument332 then
					value327 = nil
					if _G.__4HubStealTargetPrevMode and _G.__4HubSetGrabMode then
						_G.__4HubSetGrabMode(_G.__4HubStealTargetPrevMode)
					end
					_G.__4HubStealTargetPrevMode = nil
				else
					if _G.__4HubStealTargetPrevMode == nil then
						_G.__4HubStealTargetPrevMode = _G.__4HubGrabMode or "Nearest"
					end
					value327 = argument332
					if _G.__4HubSetGrabMode then
						_G.__4HubSetGrabMode("Priority")
					end
				end
				value328 = nil
				sg = nil
				for k, value335 in pairs(items86) do
					value335.setSelected(k == value327)
				end
				_G.SetAutoGrabTarget(value327)
			end)
			items86[argument332] = options77
			return options77
		end
		_G.__4HubHighlightPrompt = function(argument333)
			if value327 ~= nil then
				value328 = nil
				return
			end
			if argument333 == value328 then
				return
			end
			value328 = argument333
			sg = nil
			for k, value336 in pairs(items86) do
				value336.setSelected(k == argument333 and argument333 ~= nil)
			end
		end
		_G.__4HubClearStealSelection = function()
			if value327 == nil then
				return
			end
			value327 = nil
			_G.__4HubStealTargetPrevMode = nil
			value328 = nil
			sg = nil
			for _, value337 in pairs(items86) do
				value337.setSelected(false)
			end
			if _G.SetAutoGrabTarget then
				_G.SetAutoGrabTarget(nil)
			end
		end
		local function handleAction244()
			local items88 = {}
			local value338 = ipairs
			local 4HubStealPrompts = _G.__4HubStealPrompts and _G.__4HubStealPrompts() or {}
			for _, 4HubStealPrompt in value338(4HubStealPrompts) do
				if 4HubStealPrompt.Parent then
					items88[4HubStealPrompt] = true
				end
			end
			for k, value339 in pairs(items86) do
				if not items88[k] or not k.Parent then
					if value327 == k then
						value327 = nil
						sg = nil
						_G.SetAutoGrabTarget(nil)
					end
					if value328 == k then
						value328 = nil
					end
					value339.frame:Destroy()
					items86[k] = nil
				end
			end
			for k in pairs(items88) do
				if not items86[k] then
					handleAction242(k)
				end
			end
			local items89 = {}
			for k, value340 in pairs(items86) do
				table.insert(items89, { o = value340, d = handleAction239(k) })
			end
			table.sort(items89, function(argument334, argument335)
				local gen = argument334.o.gen or 0
				local gen2 = argument335.o.gen or 0
				if gen ~= gen2 then
					return gen > gen2
				end
				return argument334.d < argument335.d
			end)
			for i, value341 in ipairs(items89) do
				value341.o.frame.LayoutOrder = i
			end
			textLabel.Visible = #items89 == 0
			handleAction241()
		end
		task.spawn(function()
			while screenGui2.Parent do
				if not screenGui2.Enabled then
					task.wait(0.5)
				else
					for k, value342 in pairs(items86) do
						if k.Parent then
							local gen = 0
							local text26 = "Normal"
							local number70 = 0
							local value343 = nil
							if _G.__4HubPromptInfo then
								local ok, result, result2, result3, result4 = pcall(_G.__4HubPromptInfo, k)
								gen = 0
								text26 = "Normal"
								number70 = 0
								value343 = nil
								if ok then
									gen = result or 0
									text26 = result2 or "Normal"
									if result3 then
										number70 = result3
										value343 = result4
									else
										number70 = 0
										value343 = result4
									end
								end
							end
							value342.gen = gen
							if value342.owner then
								value342.owner.Text = "Owner: " .. tostring(value343 or _G.__4HubPromptOwner and _G.__4HubPromptOwner(k) or "Unknown")
							end
							local text27 = tostring(text26)
							if text27 == "" or text27:lower() == "none" then
								text27 = "Normal"
							end
							value342.sub.Text = "Mutation: <font color=\"" .. handleAction238(_G.__4HubMutColor and _G.__4HubMutColor(text26) or Color3.fromRGB(200, 200, 210)) .. "\">" .. text27 .. "</font>"
							if value342.rarity then
								local 4HubPromptRarity = _G.__4HubPromptRarity and _G.__4HubPromptRarity(k) or ""
								value342.rarity.Text = "Rarity: " .. (4HubPromptRarity ~= "" and 4HubPromptRarity or "...")
							end
							if number70 > 0 then
								value342.price.Text = "Gen: " .. (_G.__4HubMoney and _G.__4HubMoney(number70) or "$" .. tostring(gen)) .. "/s"
							else
								value342.price.Text = "Gen: ..."
							end
							value342.price.TextColor3 = Color3.fromRGB(80, 225, 130)
							if value342.imgBox and not value342.imgBox:GetAttribute("4HubImgSet") and _G.__4HubBrainrotViewport then
								if _G.__4HubBrainrotViewport(value342.imgBox, _G.__4HubPromptIndex and _G.__4HubPromptIndex(k) or handleAction240(k), _G.__4HubPromptModel and _G.__4HubPromptModel(k)) then
									value342.imgBox:SetAttribute("4HubImgSet", true)
								end
							end
							if value342.traitBox then
								local x = value342.sub.AbsoluteSize.X
								if x and x > 0 then
									value342.traitBox.Position = UDim2.fromOffset(46 + x + 6, 23)
								end
								local 4HubPromptTraits = _G.__4HubPromptTraits and _G.__4HubPromptTraits(k) or {}
								if _G.__4HubRenderTraits then
									_G.__4HubRenderTraits(value342.traitBox, 4HubPromptTraits, 14)
								end
							end
						end
					end
					task.wait(0.5)
				end
			end
		end)
		task.spawn(function()
			while screenGui2.Parent do
				if screenGui2.Enabled then
					handleAction244()
				end
				task.wait(screenGui2.Enabled and 0.75 or 1.5)
			end
		end)
		handleAction244()
		if _G.__4HubRegisterDrag then
			_G.__4HubRegisterDrag(frame5, instance4, "StealTargetWin", UDim2.new(0.72, 0, 0, 16))
		end
		frame5.Size = UDim2.fromOffset(0, 0)
		uiStroke2.Transparency = 1
		TweenService2:Create(frame5, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = udim22 }):Play()
		TweenService2:Create(uiStroke2, TweenInfo.new(0.4), { Transparency = 0 }):Play()
	end
	handleAction236()
end
do
	local function handleAction245()
		local players19 = game:GetService("Players")
		local TweenService2 = game:GetService("TweenService")
		game:GetService("UserInputService")
		game:GetService("RunService")
		local playerGui_ = players19.LocalPlayer:WaitForChild("PlayerGui")
		local options82 = {
			Black = Color3.fromRGB(6, 8, 14),
			BgDark = Color3.fromRGB(9, 13, 24),
			BgPanel = Color3.fromRGB(13, 20, 38),
			Stroke = Color3.fromRGB(30, 46, 82),
			DarkBlue = Color3.fromRGB(18, 38, 78),
			LightBlue = Color3.fromRGB(92, 165, 255),
			BlueLine = Color3.fromRGB(60, 120, 220),
			White = Color3.fromRGB(255, 255, 255),
			TextDim = Color3.fromRGB(150, 165, 195),
			ToggleOff = Color3.fromRGB(40, 52, 82),
		}
		local gothamMedium2 = Enum.Font.GothamMedium
		local gothamBold2 = Enum.Font.GothamBold
		local function handleAction246(parent, argument336)
			local instance4 = Instance.new("UICorner")
			instance4.CornerRadius = UDim.new(0, argument336 or 8)
			instance4.Parent = parent
			return instance4
		end
		local function createUIStroke2(parent, color, thickness)
			local uiStroke2 = Instance.new("UIStroke")
			uiStroke2.Color = color or options82.Stroke
			uiStroke2.Thickness = thickness or 1
			uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uiStroke2.Parent = parent
			return uiStroke2
		end
		local targetControlsUI = playerGui_:FindFirstChild("TargetControlsUI")
		if targetControlsUI then
			targetControlsUI:Destroy()
		end
		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "TargetControlsUI"
		screenGui2.ResetOnSpawn = false
		screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui2.IgnoreGuiInset = true
		screenGui2.Parent = playerGui_
		_G.setTargetControlsHidden = function(argument337)
			if screenGui2 then
				screenGui2.Enabled = not argument337
			end
		end
		local udim22 = UDim2.fromOffset(250, 304)
		local instance4 = Instance.new("Frame")
		instance4.Name = "Window"
		instance4.AnchorPoint = Vector2.new(0, 1)
		instance4.Size = udim22
		instance4.Position = UDim2.new(0, 272, 1, -170)
		instance4.BackgroundColor3 = options82.BgDark
		instance4.BorderSizePixel = 0
		instance4.ClipsDescendants = true
		instance4.Active = true
		instance4.Parent = screenGui2
		if _G.__4HubRegisterScale then
			_G.__4HubRegisterScale(instance4)
		end
		handleAction246(instance4, 12)
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Rotation = 90
		local new = ColorSequenceKeypoint.new
		local bgDark = options82.BgDark
		uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, options82.Black), new(1, bgDark) })
		uiGradient.Parent = instance4
		local uiStroke2 = Instance.new("UIStroke")
		uiStroke2.Thickness = 2.5
		uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke2.Parent = instance4
		local uiGradient2 = Instance.new("UIGradient")
		local colorSequence = ColorSequence.new
		local items90 = {}
		local value344 = ColorSequenceKeypoint.new(0, options82.DarkBlue)
		local value345 = ColorSequenceKeypoint.new(0.5, options82.LightBlue)
		local new2 = ColorSequenceKeypoint.new
		local entry107 = 1
		local darkBlue = options82.DarkBlue
		items90[1] = value344
		items90[2] = value345
		do
			local values = table.pack(new2(entry107, darkBlue))
			table.move(values, 1, values.n, 3, items90)
		end
		uiGradient2.Color = colorSequence(items90)
		uiGradient2.Parent = uiStroke2
		_G.__4HubSpin(uiGradient2, 90)
		local instance5 = Instance.new("Frame")
		instance5.Name = "Header"
		instance5.Size = UDim2.new(1, 0, 0, 42)
		instance5.BackgroundTransparency = 1
		instance5.Active = true
		instance5.Parent = instance4
		local instance6 = Instance.new("TextButton")
		instance6.Name = "Minimise"
		instance6.AnchorPoint = Vector2.new(1, 0)
		instance6.Position = UDim2.new(1, -12, 0, 11)
		instance6.Size = UDim2.fromOffset(20, 20)
		instance6.BackgroundColor3 = options82.DarkBlue
		instance6.AutoButtonColor = false
		instance6.Font = gothamBold2
		instance6.Text = "–"
		instance6.TextColor3 = options82.LightBlue
		instance6.TextSize = 18
		instance6.ZIndex = 6
		instance6.Parent = instance5
		handleAction246(instance6, 6)
		createUIStroke2(instance6, options82.LightBlue, 1)
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "Title"
		textLabel.Size = UDim2.new(1, -80, 0, 42)
		textLabel.Position = UDim2.fromOffset(40, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Font = gothamBold2
		textLabel.Text = "Target Controls"
		textLabel.TextColor3 = options82.White
		textLabel.TextSize = 15
		textLabel.TextXAlignment = Enum.TextXAlignment.Center
		textLabel.Parent = instance5
		local frame5 = Instance.new("Frame")
		frame5.Name = "HeaderLine"
		frame5.Size = UDim2.new(1, -28, 0, 2)
		frame5.Position = UDim2.new(0, 14, 0, 40)
		frame5.BackgroundColor3 = options82.BlueLine
		frame5.BorderSizePixel = 0
		frame5.Parent = instance4
		handleAction246(frame5, 1)
		local instance7 = Instance.new("UIGradient")
		local colorSequence2 = ColorSequence.new
		local items91 = {}
		local value346 = ColorSequenceKeypoint.new(0, options82.DarkBlue)
		local value347 = ColorSequenceKeypoint.new(0.5, options82.LightBlue)
		local new3 = ColorSequenceKeypoint.new
		local entry108 = 1
		local darkBlue2 = options82.DarkBlue
		items91[1] = value346
		items91[2] = value347
		do
			local values = table.pack(new3(entry108, darkBlue2))
			table.move(values, 1, values.n, 3, items91)
		end
		instance7.Color = colorSequence2(items91)
		instance7.Parent = frame5
		local scrollingFrame = Instance.new("ScrollingFrame")
		scrollingFrame.Name = "Body"
		scrollingFrame.Position = UDim2.fromOffset(0, 48)
		scrollingFrame.Size = UDim2.new(1, 0, 1, -48)
		scrollingFrame.BackgroundTransparency = 1
		scrollingFrame.BorderSizePixel = 0
		scrollingFrame.ScrollBarThickness = 0
		scrollingFrame.ScrollingEnabled = false
		scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		scrollingFrame.Active = true
		scrollingFrame.Parent = instance4
		local uiPadding = Instance.new("UIPadding")
		uiPadding.PaddingLeft = UDim.new(0, 12)
		uiPadding.PaddingRight = UDim.new(0, 12)
		uiPadding.PaddingBottom = UDim.new(0, 12)
		uiPadding.Parent = scrollingFrame
		local instance8 = Instance.new("UIListLayout")
		instance8.Padding = UDim.new(0, 8)
		instance8.SortOrder = Enum.SortOrder.LayoutOrder
		instance8.Parent = scrollingFrame
		local function handleAction247(name, layoutOrder, argument338, argument339)
			local argument3381 = argument338 or false
			local frame6 = Instance.new("Frame")
			frame6.Name = name
			frame6.Size = UDim2.new(1, 0, 0, 34)
			frame6.BackgroundColor3 = options82.BgDark
			frame6.BorderSizePixel = 0
			frame6.LayoutOrder = layoutOrder
			frame6.Parent = scrollingFrame
			handleAction246(frame6, 8)
			local value348 = createUIStroke2(frame6, options82.Stroke, 1)
			local frame7 = Instance.new("Frame")
			frame7.Size = UDim2.new(0, 3, 0.55, 0)
			frame7.Position = UDim2.new(0, 0, 0.225, 0)
			frame7.BackgroundColor3 = options82.DarkBlue
			frame7.BorderSizePixel = 0
			frame7.Parent = frame6
			handleAction246(frame7, 2)
			local textButton3 = Instance.new("TextButton")
			textButton3.Size = UDim2.new(1, 0, 1, 0)
			textButton3.BackgroundTransparency = 1
			textButton3.Text = ""
			textButton3.ZIndex = 0
			textButton3.Parent = frame6
			textButton3.MouseEnter:Connect(function()
				local options83 = { Color = options82.LightBlue }
				TweenService2:Create(value348, TweenInfo.new(0.15), options83):Play()
				local options84 = { BackgroundColor3 = options82.LightBlue }
				TweenService2:Create(frame7, TweenInfo.new(0.15), options84):Play()
			end)
			textButton3.MouseLeave:Connect(function()
				local options85 = { Color = options82.Stroke }
				TweenService2:Create(value348, TweenInfo.new(0.15), options85):Play()
				local options86 = { BackgroundColor3 = options82.DarkBlue }
				TweenService2:Create(frame7, TweenInfo.new(0.15), options86):Play()
			end)
			local instance9 = Instance.new("TextLabel")
			instance9.Size = UDim2.new(1, -66, 1, 0)
			instance9.Position = UDim2.fromOffset(12, 0)
			instance9.BackgroundTransparency = 1
			instance9.Font = gothamMedium2
			instance9.Text = name
			instance9.TextColor3 = options82.White
			instance9.TextSize = 13
			instance9.TextXAlignment = Enum.TextXAlignment.Left
			instance9.TextTruncate = Enum.TextTruncate.AtEnd
			instance9.Parent = frame6
			local textButton4 = Instance.new("TextButton")
			textButton4.AnchorPoint = Vector2.new(1, 0.5)
			textButton4.Position = UDim2.new(1, -12, 0.5, 0)
			textButton4.Size = UDim2.fromOffset(40, 20)
			textButton4.BackgroundColor3 = argument3381 and options82.LightBlue or options82.ToggleOff
			textButton4.AutoButtonColor = false
			textButton4.Text = ""
			textButton4.Parent = frame6
			handleAction246(textButton4, 10)
			local frame8 = Instance.new("Frame")
			frame8.Size = UDim2.fromOffset(14, 14)
			frame8.Position = argument3381 and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
			frame8.BackgroundColor3 = options82.White
			frame8.BorderSizePixel = 0
			frame8.Parent = textButton4
			handleAction246(frame8, 7)
			local function handleAction248()
				local lightBlue = _G.__4HubAccentCur and _G.__4HubAccentCur.LightBlue or options82.LightBlue
				TweenService2:Create(textButton4, TweenInfo.new(0.18), { BackgroundColor3 = argument3381 and lightBlue or options82.ToggleOff }):Play()
				TweenService2:Create(frame8, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {
					Position = argument3381 and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7),
				}):Play()
			end
			if _G.__4HubOnTheme then
				_G.__4HubOnTheme(function()
					handleAction248()
				end)
			end
			textButton4.MouseButton1Click:Connect(function()
				argument3381 = not argument3381
				handleAction248()
				if argument339 then
					task.spawn(argument339, argument3381)
				end
			end)
			return {
				Set = function(argument340)
					argument3381 = argument340
					handleAction248()
					if argument339 then
						task.spawn(argument339, argument340)
					end
				end,
				Get = function()
					return argument3381
				end,
			}
		end
		local entry109 = 0
		local function handleAction249()
			entry109 += 1
			return entry109
		end
		local TC_AutoSteal = getSavedChoice("TC_AutoSteal")
		local 4HubAutoSteal = TC_AutoSteal == nil and true or TC_AutoSteal == "1"
		_G.__4HubAutoSteal = 4HubAutoSteal
		handleAction247("Auto Steal", handleAction249(), 4HubAutoSteal, function(4HubAutoSteal2)
			_G.__4HubAutoSteal = 4HubAutoSteal2
			saveChoice("TC_AutoSteal", 4HubAutoSteal2 and "1" or "0")
		end)
		local items92 = {}
		local enabled58 = false
		local function handleAction250(argument341, argument342)
			local value349 = nil
			local matchesCondition6 = _G.__4HubGrabMode == argument342
			local function handleAction251(argument343)
				if enabled58 then
					return
				end
				if argument343 then
					if _G.__4HubClearStealSelection then
						pcall(_G.__4HubClearStealSelection)
					end
					_G.__4HubSetGrabMode(argument342)
				elseif _G.__4HubGrabMode == argument342 then
					enabled58 = true
					value349.Set(true)
					enabled58 = false
				end
			end
			value349 = handleAction247
			value349 = value349(argument341, handleAction249(), matchesCondition6, handleAction251)
			items92[argument342] = value349
			return value349
		end
		handleAction250("Priority", "Priority")
		handleAction250("Nearest", "Nearest")
		handleAction250("Highest", "Highest")
		_G.__4HubTC_ApplyMode = function(argument344)
			enabled58 = true
			for k, value350 in pairs(items92) do
				if value350.Get() ~= k == argument344 then
					value350.Set(k == argument344)
				end
			end
			enabled58 = false
		end
		_G.__4HubTC_ApplyMode(_G.__4HubGrabMode or "Nearest")
		handleAction247("Auto Turret", handleAction249(), getSavedChoice("TC_AutoTurret") == "1", function(argument345)
			saveChoice("TC_AutoTurret", argument345 and "1" or "0")
		end)
		local TC_AutoKick = getSavedToggle("TC_AutoKick")
		handleAction247("Auto Kick", handleAction249(), TC_AutoKick, function(argument346)
			if _G.__4HubAutoKickMainToggle then
				_G.__4HubAutoKickMainToggle.Set(argument346)
			end
			saveToggle("TC_AutoKick", argument346)
		end)
		if _G.__4HubRegisterDrag then
			_G.__4HubRegisterDrag(instance4, instance5, "TargetControlsWin", UDim2.new(0, 272, 1, -170))
		end
		local enabled59 = false
		local entry110 = false
		local tweenInfo = TweenInfo.new(0.26, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		local function handleAction252(argument347)
			if entry110 or argument347 == enabled59 then
				return
			end
			entry110 = true
			enabled59 = argument347
			frame5.Visible = not argument347
			instance6.Text = argument347 and "+" or "–"
			local tween = TweenService2:Create(instance4, tweenInfo, { Size = argument347 and UDim2.fromOffset(250, 42) or udim22 })
			tween:Play()
			tween.Completed:Once(function()
				if not argument347 then
					frame5.Visible = true
				end
				entry110 = false
			end)
		end
		instance6.MouseButton1Click:Connect(function()
			handleAction252(not enabled59)
		end)
		instance6.MouseEnter:Connect(function()
			local options87 = { BackgroundColor3 = options82.BlueLine }
			TweenService2:Create(instance6, TweenInfo.new(0.12), options87):Play()
		end)
		instance6.MouseLeave:Connect(function()
			local options88 = { BackgroundColor3 = options82.DarkBlue }
			TweenService2:Create(instance6, TweenInfo.new(0.12), options88):Play()
		end)
		instance4.Size = UDim2.fromOffset(0, 0)
		uiStroke2.Transparency = 1
		TweenService2:Create(instance4, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = udim22 }):Play()
		TweenService2:Create(uiStroke2, TweenInfo.new(0.4), { Transparency = 0 }):Play()
	end
	handleAction245()
end
do
	local function handleAction253()
		local value351 = nil
		local value352 = nil
		local now2 = 0
		local number71 = 0
		local number72 = 0
		local now3 = 0
		local number73 = 40
		local now4 = os.clock()
		local number74 = 3
		local number75 = 3
		local number76 = 1.5
		local function handleAction254()
			if os.clock() - now4 < number74 then
				return 0.1
			end
			return 0.5
		end
		local function handleAction255(argument348)
			local entry111 = "table"
			if type(argument348) ~= entry111 then
				return 0
			end
			local ok, result = pcall(function()
				local number77 = 0
				local number78 = 0
				for _, value353 in next, argument348, nil do
					number77 += 1
					local matchesCondition7 = type(value353) == "table"
					if matchesCondition7 then
						local entry112 = "table"
						matchesCondition7 = type(rawget(value353, "CacheTable")) == entry112
					end
					if matchesCondition7 then
						number78 += 1
					end
					if not (number77 >= 200) then
						continue
					end
					break
				end
				return number78
			end)
			return ok and result or 0
		end
		local function handleAction256()
			if value352 then
				return value352
			end
			local ok, result = pcall(function()
				return require(game:GetService("ReplicatedStorage").Packages.Synchronizer)
			end)
			if ok and type(result) == "table" then
				value352 = result
				return value352
			end
			local ok2, result2 = pcall(function()
				local packages = game:GetService("ReplicatedStorage"):FindFirstChild("Packages")
				packages = packages and packages:FindFirstChild("Synchronizer")
				if not packages then
					return nil
				end
				return require(packages)
			end)
			if ok2 and type(result2) == "table" then
				value352 = result2
			end
			return value352
		end
		local getupvalue_ = debug and debug.getupvalue or getupvalue
		local function handleAction257(argument349)
			if type(getupvalue_) ~= "function" then
				return nil
			end
			local value354 = nil
			local entry113 = 0
			local function handleAction258(argument350)
				local value355 = handleAction255(argument350)
				if value355 > entry113 then
					value354 = argument350
					entry113 = value355
				end
			end
			local ok, result = pcall(getupvalue_, argument349.Get, 9)
			if ok and type(result) == "table" then
				handleAction258(rawget(result, 3))
				if entry113 > 0 then
					return value354
				end
				handleAction258(result)
				if 0 < entry113 then
					return value354
				end
			end
			return nil
		end
		local function handleAction259(argument351)
			local entry114 = "function"
			if type(getupvalue_) ~= entry114 then
				return nil
			end
			local value356 = nil
			local number79 = 0
			local function handleAction260(argument352)
				local value357 = handleAction255(argument352)
				if value357 > number79 then
					value356 = argument352
					number79 = value357
				end
			end
			for _, value358 in next, argument351, nil do
				if type(value358) == "function" then
					for i = 1, 24 do
						local ok, result = pcall(getupvalue_, value358, i)
						if ok then
							if type(result) == "table" then
								handleAction260(result)
								for i2 = 1, 4 do
									handleAction260(rawget(result, i2))
								end
							end
							continue
						end
						break
					end
				end
			end
			return value356
		end
		local function handleAction261()
			if value351 then
				return value351
			end
			if os.clock() - now2 <= handleAction254() then
				return nil
			end
			now2 = os.clock()
			if not pcall(function()
				local value359 = handleAction256()
				if not value359 or number71 >= number73 then
					return
				end
				number71 += 1
				local value360 = handleAction257(value359)
				if not value360 and number72 < number75 and os.clock() - now3 > number76 then
					now3 = os.clock()
					number72 += 1
					value360 = handleAction259(value359)
				end
				if value360 then
					value351 = value360
				end
			end) then
				number71 += 1
			end
			return value351
		end
		_G.XenSyncAll = function()
			return handleAction261()
		end
		_G.XenSyncGet = function(argument353)
			local value361 = handleAction261()
			if not value361 or argument353 == nil then
				return nil
			end
			local ok, result = pcall(rawget, value361, argument353)
			if ok and type(result) == "table" then
				return result
			end
			local ok2, result2 = pcall(function()
				return value361[argument353]
			end)
			if ok2 and type(result2) == "table" then
				return result2
			end
			return nil
		end
		_G.sProp = function(argument354, argument355)
			local entry115 = "table"
			if type(argument354) ~= entry115 or argument355 == nil then
				return nil
			end
			local value = rawget(argument354, "CacheTable")
			if type(value) ~= "table" then
				local ok, result = pcall(function()
					return argument354.CacheTable
				end)
				if ok then
					local entry116 = "table"
					ok = type(result) == entry116
				end
				if ok then
					value = result
				end
			end
			if type(value) ~= "table" then
				return nil
			end
			local value2 = rawget(value, argument355)
			if value2 ~= nil then
				return value2
			end
			local ok, result = pcall(function()
				return value[argument355]
			end)
			if ok then
				return result
			end
			return nil
		end
	end
	handleAction253()
end
_G.__4HubAnimalAt = _G.__4HubAnimalAt or function()
	return nil
end
do
	local function handleAction262()
		local ReplicatedStorage_ = game:GetService("ReplicatedStorage")
		local Workspace2 = game:GetService("Workspace")
		local Animals = nil
		local Mutations = nil
		local Traits = nil
		pcall(function()
			Animals = require(ReplicatedStorage_:WaitForChild("Datas", 20):WaitForChild("Animals", 20))
		end)
		pcall(function()
			Mutations = require(ReplicatedStorage_.Datas:WaitForChild("Mutations", 20))
		end)
		pcall(function()
			Traits = require(ReplicatedStorage_.Datas:WaitForChild("Traits", 20))
		end)
		local NumberUtils = nil
		pcall(function()
			NumberUtils = require(ReplicatedStorage_:WaitForChild("Utils", 20):WaitForChild("NumberUtils", 20))
		end)
		task.spawn(function()
			local localPlayer26 = game:GetService("Players").LocalPlayer
			local plots = Workspace2:WaitForChild("Plots", 30)
			if not plots then
				return
			end
			local function handleAction263(argument356)
				local ok, result = pcall(function()
					return argument356:GetPivot().Position
				end)
				if ok and result and result.Magnitude > 1 then
					return result
				end
				if argument356.PrimaryPart then
					return argument356.PrimaryPart.Position
				end
				local basePart = argument356:FindFirstChildWhichIsA("BasePart", true)
				return basePart and basePart.Position or nil
			end
			local function handleAction264()
				for _, child in ipairs(plots:GetChildren()) do
					local value362 = handleAction263(child)
					if value362 then
						task.spawn(function()
							pcall(function()
								localPlayer26:RequestStreamAroundAsync(value362)
							end)
						end)
					end
				end
			end
			for i = 1, 6 do
				handleAction264()
				task.wait(0.5)
			end
			plots.ChildAdded:Connect(function()
				task.defer(handleAction264)
			end)
		end)
		_G.__4HubMoney = function(argument357)
			local argument3571 = argument357 or 0
			if NumberUtils then
				local ok, result = pcall(function()
					return NumberUtils:ToString(argument3571)
				end)
				if ok and result then
					return "$" .. result
				end
			end
			if argument3571 >= 1e12 then
				return string.format("$%.1fT", argument3571 / 1e12)
			end
			if argument3571 >= 1e9 then
				return string.format("$%.1fB", argument3571 / 1e9)
			end
			if argument3571 >= 1000000 then
				return string.format("$%.1fM", argument3571 / 1000000)
			end
			if argument3571 >= 1000 then
				return string.format("$%.1fK", argument3571 / 1000)
			end
			return "$" .. tostring(math.floor(argument3571))
		end
		setmetatable({}, { __mode = "k" })
		local items93 = {}
		if type(Animals) == "table" then
			for k, Animal in pairs(Animals) do
				if type(Animal) == "table" and Animal.DisplayName then
					items93[Animal.DisplayName] = k
					items93[Animal.DisplayName:lower()] = k
				end
				items93[k] = k
				items93[k:lower()] = k
			end
		end
		local options89 = {
			K = 1000,
			M = 1000000,
			B = 1e9,
			T = 1e12,
			Q = 1e15,
			Qi = 1e18,
			Sx = 1e21,
			Sp = 1e24,
			Oc = 1e27,
		}
		local function handleAction265(argument358)
			if type(argument358) ~= "string" then
				return nil
			end
			local match, value363 = argument358:match("%$%s*([%d%.]+)%s*(%a*)%s*/[sS]")
			if not match then
				match, value363 = argument358:match("([%d%.]+)%s*(%a*)")
			end
			match = match and tonumber(match)
			if not match then
				return nil
			end
			if value363 and value363 ~= "" then
				local entry117 = options89[value363]
				if not entry117 then
					entry117 = options89[value363:sub(1, 1):upper() .. (value363:sub(2) or "")]
				end
				if entry117 then
					match *= entry117
				end
			end
			return match
		end
		local function handleAction266(argument359)
			if not argument359 then
				return nil
			end
			for _, descendant in ipairs(argument359:GetDescendants()) do
				if descendant:IsA("TextLabel") and descendant.Name == "Generation" and type(descendant.Text) == "string" and descendant.Text ~= "" then
					local value364 = handleAction265(descendant.Text)
					if value364 then
						return value364
					end
				end
			end
			for _, descendant in ipairs(argument359:GetDescendants()) do
				if descendant:IsA("TextLabel") and type(descendant.Text) == "string" and descendant.Text:find("/[sS]") then
					local value365 = handleAction265(descendant.Text)
					if value365 then
						return value365
					end
				end
			end
			return nil
		end
		local function handleAction267(argument360, argument361, argument362)
			local entry118 = Animals and Animals[argument360]
			local generation = type(entry118) == "table" and entry118.Generation or 0
			if generation == 0 then
				return 0
			end
			local argument3611 = argument361 and argument361 ~= "None" and argument361 ~= "" and type(Mutations) == "table"
			local number80 = 1
			if argument3611 then
				local entry119 = Mutations[argument361] or Mutations[tostring(argument361):gsub("%s+", "")]
				if entry119 and entry119.Modifier then
					number80 = 1 + entry119.Modifier
				end
			end
			if type(argument362) == "table" and type(Traits) == "table" then
				for _, value366 in ipairs(argument362) do
					local entry120 = Traits[value366]
					if entry120 and entry120.MultiplierModifier then
						number80 += entry120.MultiplierModifier
					end
				end
			end
			return math.floor(generation * number80)
		end
		local function handleAction268(argument363)
			if argument363.ObjectText and argument363.ObjectText ~= "" then
				return argument363.ObjectText
			end
			local parent = argument363.Parent
			if parent and parent.Name ~= "" then
				return parent.Name
			end
			return "Brainrot"
		end
		local function handleAction269(parent2)
			local animalPodiums = parent2:FindFirstAncestor("AnimalPodiums")
			if not animalPodiums then
				return nil
			end
			for i = 1, 20 do
				if not (not parent2 or parent2.Parent == animalPodiums) then
					parent2 = parent2.Parent
					continue
				end
				break
			end
			if parent2 and parent2.Parent == animalPodiums then
				return parent2, animalPodiums.Parent
			end
			return nil
		end
		local function handleAction270(argument364)
			local value367 = nil
			for _, value368 in ipairs(argument364) do
				if value368:IsA("Model") then
					local name = value368.Name
					if name ~= "Base" and name ~= "Claim" and name ~= "Decorations" and name ~= "Spawn" then
						if Animals and Animals[name] then
							return value368, name, true
						end
						value367 = value367 or value368
					end
				end
			end
			return value367, value367 and value367.Name, false
		end
		local function handleAction271(argument365)
			local value369, name, value370 = handleAction270(argument365:GetChildren())
			if not value370 then
				local value371, value372, value373 = handleAction270(argument365:GetDescendants())
				if value373 then
					name = value372
					value370 = value373
					value369 = value371
				elseif not value369 then
					name = value372
					value369 = value371
				end
			end
			local attribute = nil
			if value369 then
				attribute = value369:GetAttribute("Mutation") or value369:GetAttribute("__mutation")
				if not name and value369.Name then
					name = value369.Name
				end
			end
			local value374
			if not value370 and (attribute == nil or attribute == "") then
				for _, descendant in ipairs(argument365:GetDescendants()) do
					local attribute2 = descendant:GetAttribute("Mutation")
					if attribute2 ~= nil and attribute2 ~= "" then
						attribute = attribute2
						break
					end
				end
				value374 = attribute
			else
				value374 = attribute
			end
			return value369, value374, name
		end
		local localPlayer27 = game:GetService("Players").LocalPlayer
		local function handleAction272(argument366)
			if not argument366 then
				return "Unknown"
			end
			local plotSign = argument366:FindFirstChild("PlotSign")
			local text28 = ""
			pcall(function()
				local surfaceGui = plotSign and plotSign:FindFirstChildWhichIsA("SurfaceGui", true)
				local textControl4 = surfaceGui and surfaceGui:FindFirstChildWhichIsA("TextLabel", true)
				if textControl4 then
					text28 = textControl4.Text or ""
				end
			end)
			if text28 == "" and plotSign then
				local textControl5 = plotSign:FindFirstChildWhichIsA("TextLabel", true)
				if textControl5 then
					text28 = textControl5.Text or ""
				end
			end
			local text29 = text28:lower()
			if text29:find("your base", 1, true) or text29:find("my base", 1, true) then
				return localPlayer27.DisplayName
			end
			if text28 ~= "" then
				local match = text28:match("^(.-)'") or text28
				if match and match ~= "" then
					local value375 = ipairs
					local players20 = game:GetService("Players")
					for _, player_ in value375(players20:GetPlayers()) do
						if player_.DisplayName == match or player_.Name == match then
							return player_.DisplayName
						end
					end
					if not text29:find("base", 1, true) then
						return text28
					end
					return match
				end
			end
			return "Unknown"
		end
		local function handleAction273(argument367, argument368)
			if type(argument367) ~= "table" or argument368 == nil then
				return nil
			end
			local sProp = _G.sProp and _G.sProp(argument367, argument368)
			if sProp ~= nil then
				return sProp
			end
			pcall(function()
				sProp = rawget(argument367, argument368)
			end)
			if sProp ~= nil then
				return sProp
			end
			pcall(function()
				local entry121 = "function"
				if type(argument367.Get) == entry121 then
					sProp = argument367:Get(argument368)
				end
			end)
			return sProp
		end
		local function handleAction274(argument369)
			if not argument369 or not _G.XenSyncGet then
				return nil
			end
			local value376 = _G.XenSyncGet(argument369.Name)
			if type(value376) == "table" then
				return value376
			end
			local attribute = nil
			pcall(function()
				attribute = argument369:GetAttribute("Order")
			end)
			if attribute ~= nil then
				local value377 = _G.XenSyncGet("Plot" .. tostring(attribute))
				if type(value377) == "table" then
					return value377
				end
			end
			return nil
		end
		local function handleAction275(argument370, argument371)
			if not argument370 or argument371 == nil then
				return nil
			end
			local value378 = handleAction274(argument370)
			if not value378 then
				return nil
			end
			local animalList = handleAction273(value378, "AnimalList")
			if type(animalList) ~= "table" then
				animalList = handleAction273(value378, "Animals")
			end
			local entry122 = "table"
			if type(animalList) ~= entry122 then
				return nil
			end
			local entry123 = animalList[argument371]
			if entry123 == nil and tonumber(argument371) then
				entry123 = animalList[tonumber(argument371)]
			end
			if type(entry123) == "string" then
				return entry123, nil, nil
			end
			if type(entry123) ~= "table" then
				return nil
			end
			local index = entry123.Index or entry123.AnimalIndex or entry123.Animal or entry123.Name
			if type(index) ~= "string" then
				return nil
			end
			return index, entry123.Mutation, entry123.Traits
		end
		local function handleAction276(argument372, argument373)
			if not argument372 or not argument373 then
				return nil
			end
			local value379 = nil
			local value380 = nil
			for _, child in ipairs(argument372:GetChildren()) do
				if child:IsA("Model") then
					if items93[child.Name] or items93[child.Name:lower()] then
						local ok, result = pcall(function()
							return child:GetPivot().Position
						end)
						if ok then
							local magnitude = (result - argument373).Magnitude
							if not value379 or magnitude < value379 then
								value380 = child
								value379 = magnitude
							end
						end
					end
				end
			end
			if value380 and value379 and value379 <= 14 then
				return value380
			end
			return nil
		end
		local function handleAction277(argument374)
			local value381, value382 = handleAction269(argument374)
			local value383 = handleAction268(argument374)
			local entry124 = items93[value383] or items93[value383:lower()] or value383
			local value = nil
			if value381 then
				local position = nil
				pcall(function()
					position = value381:GetPivot().Position
				end)
				value = handleAction276(value382, position) or select(1, handleAction271(value381))
				if value and value.Name then
					entry124 = items93[value.Name] or items93[value.Name:lower()] or entry124
				end
			end
			local entry125 = false
			local items94 = nil
			local text30 = "None"
			if value381 then
				local value384, value385, value386 = handleAction275(value382, value381.Name)
				items94 = nil
				if value384 then
					if value385 ~= nil and value385 ~= "" and value385 ~= "None" then
						text30 = value385
					end
					items94 = nil
					if type(value386) == "table" then
						items94 = value386
					end
					entry125 = true
					entry124 = value384
				end
			end
			local matchesCondition8
			if value then
				matchesCondition8 = text30 == "None" or text30 == nil or text30 == ""
			else
				matchesCondition8 = value
			end
			local attribute
			if matchesCondition8 then
				attribute = value:GetAttribute("Mutation") or value:GetAttribute("__mutation")
				if attribute == nil or attribute == "" then
					for _, descendant in ipairs(value:GetDescendants()) do
						local attribute2 = descendant:GetAttribute("Mutation")
						if attribute2 ~= nil and attribute2 ~= "" then
							attribute = attribute2
							break
						end
					end
				end
				if not (attribute ~= nil and attribute ~= "") then
					attribute = text30
				end
			else
				attribute = text30
			end
			if not items94 or type(items94) == "table" and #items94 == 0 then
				local attribute2 = value and (value:GetAttribute("Traits") or value:GetAttribute("Trait"))
				local entry126 = "table"
				if type(attribute2) ~= entry126 and value then
					for _, descendant in ipairs(value:GetDescendants()) do
						local attribute3 = descendant:GetAttribute("Traits") or descendant:GetAttribute("Trait")
						if type(attribute3) == "table" then
							attribute2 = attribute3
							break
						end
					end
				end
				if type(attribute2) ~= "table" and value then
					local traits = value:FindFirstChild("Traits")
					if traits then
						attribute2 = {}
						for _, child in ipairs(traits:GetChildren()) do
							attribute2[#attribute2 + 1] = child.Name
						end
						if #attribute2 == 0 then
							attribute2 = nil
						end
					end
				end
				if type(attribute2) == "table" then
					items94 = attribute2
				end
			end
			local matchesCondition9 = attribute and attribute ~= "None" and attribute ~= "" and tostring(attribute) or "Normal"
			local value387 = handleAction267(entry124, attribute, items94)
			if type(value387) ~= "number" or value387 <= 0 then
				value387 = handleAction266(value)
			end
			if (type(value387) ~= "number" or value387 <= 0) and value381 then
				value387 = handleAction266(value381)
			end
			local value388 = handleAction272(value382)
			local entry127 = "table"
			items94 = type(items94) == entry127 and items94 or {}
			local entry128 = Animals and Animals[entry124]
			local text31 = ""
			if type(entry128) == "table" then
				text31 = tostring(entry128.Rarity or entry128.rarity or "")
			end
			_G.__4HubMutDbg = { name = value383, index = entry124, mut = matchesCondition9, gen = value387, hasModel = value ~= nil, viaChannel = entry125 }
			return {
				gen = value387 or 0,
				mut = matchesCondition9,
				val = value387 or 0,
				model = value,
				owner = value388,
				traits = items94,
				index = entry124,
				rarity = text31,
			}
		end
		local obj = setmetatable({}, { __mode = "k" })
		local function handleAction278(argument375)
			local entry129 = obj[argument375]
			if entry129 then
				local gen1 = entry129.info.gen and entry129.info.gen > 0 and 3.5 or 0.4
				local t = entry129.t
				if tick() - t < gen1 then
					return entry129.info
				end
			end
			local value389 = handleAction277(argument375)
			obj[argument375] = { info = value389, t = tick() }
			return value389
		end
		_G.__4HubPromptGen = function(argument376)
			return handleAction278(argument376).gen
		end
		_G.__4HubPromptInfo = function(argument377)
			local value390 = handleAction278(argument377)
			return value390.gen, value390.mut, value390.val, value390.owner
		end
		_G.__4HubPromptOwner = function(argument378)
			return handleAction278(argument378).owner or "Unknown"
		end
		_G.__4HubPromptRarity = function(argument379)
			return handleAction278(argument379).rarity or ""
		end
		_G.__4HubPromptModel = function(argument380)
			return handleAction278(argument380).model
		end
		_G.__4HubPromptTraits = function(argument381)
			return handleAction278(argument381).traits or {}
		end
		_G.__4HubPromptIndex = function(argument382)
			return handleAction278(argument382).index
		end
		_G.__4HubRenderTraits = function()
		end
		local items95 = {}
		local function handleAction279(argument383)
			if type(argument383) == "number" then
				return "rbxassetid://" .. tostring(argument383)
			end
			if type(argument383) == "string" and argument383 ~= "" then
				if argument383:find("rbx") then
					return argument383
				end
				if argument383:match("^%d+$") then
					return "rbxassetid://" .. argument383
				end
			end
			return nil
		end
		_G.__4HubTraitIcon = function(argument384)
			if argument384 == nil then
				return nil
			end
			local text32 = tostring(argument384)
			local entry130 = items95[text32]
			if entry130 ~= nil then
				return entry130 ~= false and entry130 or nil
			end
			local value391 = nil
			if type(Traits) == "table" then
				local entry132 = Traits[text32] or Traits[text32:gsub("%s+", "")]
				if type(entry132) == "table" then
					value391 = handleAction279(entry132.Icon or entry132.Image or entry132.ImageId or entry132.Thumbnail or entry132.Asset or entry132.Texture or entry132.ImageID)
					if not value391 and type(entry132.Icon) == "table" then
						value391 = handleAction279(entry132.Icon.Image or entry132.Icon.Texture or entry132.Icon.Id)
					end
					local enabled60 = not value391
					if enabled60 then
						local entry133 = "table"
						enabled60 = type(entry132.Display) == entry133
					end
					if enabled60 then
						value391 = handleAction279(entry132.Display.Icon or entry132.Display.Image)
					end
				end
			end
			if not value391 then
				pcall(function()
					for _, value392 in ipairs({ "TraitIcons", "Traits", "Images", "Assets", "Icons" }) do
						local value393 = ReplicatedStorage_:FindFirstChild(value392, true)
						if value393 then
							local value394 = value393:FindFirstChild(text32)
							if not value394 then
								local findFirstChild = value393.FindFirstChild
								local text33 = text32:gsub("%s+", "")
								value394 = findFirstChild(value393, text33)
							end
							if value394 then
								if value394:IsA("ImageLabel") or value394:IsA("ImageButton") or value394:IsA("Decal") or value394:IsA("Texture") then
									value391 = handleAction279(value394.Image or value394.Texture)
									if value391 then
										return
									end
								end
								local imageLabel = value394:FindFirstChildWhichIsA("ImageLabel", true) or value394:FindFirstChildWhichIsA("Decal", true)
								if imageLabel then
									value391 = handleAction279(imageLabel.Image or imageLabel.Texture)
									if value391 then
										return
									end
									continue
								end
							end
						end
					end
				end)
			end
			items95[text32] = value391 or false
			return value391
		end
		local value395 = nil
		local animals = nil
		local function handleAction280(argument385)
			if type(Animals) == "table" and Animals[argument385] and type(Animals[argument385]) == "table" and Animals[argument385].DisplayName then
				return Animals[argument385].DisplayName
			end
			return argument385
		end
		local function handleAction281(argument386, argument387)
			if not argument386 then
				return nil
			end
			local value396 = handleAction280(argument387)
			for _, value397 in ipairs({ value396, argument387 }) do
				if value397 then
					local value398 = argument386:FindFirstChild(value397)
					if value398 then
						return value398
					end
				end
			end
			local entry134 = items93[argument387]
			if not entry134 then
				entry134 = items93[tostring(argument387):lower()]
			end
			if entry134 then
				local value399 = argument386:FindFirstChild(entry134)
				if value399 then
					return value399
				end
			end
			local text34 = tostring(argument387):lower()
			local text35 = tostring(value396):lower()
			for _, child in ipairs(argument386:GetChildren()) do
				local text36 = child.Name:lower()
				if text36 == text34 or text36 == text35 then
					return child
				end
			end
			return nil
		end
		local function handleAction282()
			if value395 and value395.Parent then
				return value395
			end
			pcall(function()
				for _, value400 in ipairs({
					function()
						return ReplicatedStorage_:FindFirstChild("Models")
					end,
					function()
						return ReplicatedStorage_:FindFirstChild("Assets") and ReplicatedStorage_.Assets:FindFirstChild("Models")
					end,
					function()
						return ReplicatedStorage_:FindFirstChild("Shared")
					end,
				}) do
					local value401 = value400()
					local animals2 = value401 and value401:FindFirstChild("Animals")
					if animals2 then
						value395 = animals2
						return
					end
				end
				for _, descendant in ipairs(ReplicatedStorage_:GetDescendants()) do
					if descendant.Name == "Animals" and descendant:FindFirstChildWhichIsA("Model") then
						value395 = descendant
						return
					end
				end
			end)
			return value395
		end
		_G.__4HubBrainrotModel = function(argument388)
			if not argument388 then
				return nil
			end
			local value402 = tostring
			return handleAction281(handleAction282(), value402(argument388))
		end
		local function handleAction283(argument389)
			if not animals then
				pcall(function()
					local animations = ReplicatedStorage_:FindFirstChild("Animations")
					animals = animations and animations:FindFirstChild("Animals")
				end)
			end
			local idle = handleAction281(animals, tostring(argument389))
			if idle then
				idle = idle:FindFirstChild("Idle") or idle:FindFirstChildWhichIsA("Animation")
			end
			return idle and idle:IsA("Animation") and idle or nil
		end
		local function createViewportFrame(parent, argument390, argument391)
			if not parent then
				return nil
			end
			local argument3911 = _G.__4HubBrainrotModel(argument390) or argument391
			if not argument3911 or not argument3911:IsA("Model") then
				return nil
			end
			for _, child in ipairs(parent:GetChildren()) do
				if child:IsA("ViewportFrame") then
					child:Destroy()
				end
			end
			local viewportFrame = Instance.new("ViewportFrame")
			viewportFrame.Size = UDim2.fromScale(1, 1)
			viewportFrame.BackgroundTransparency = 1
			viewportFrame.BorderSizePixel = 0
			viewportFrame.Ambient = Color3.fromRGB(255, 255, 255)
			viewportFrame.LightColor = Color3.fromRGB(255, 255, 255)
			viewportFrame.LightDirection = Vector3.new(-0.4, -0.7, -0.6)
			viewportFrame.Parent = parent
			local worldModel = Instance.new("WorldModel", viewportFrame)
			local camera = Instance.new("Camera", viewportFrame)
			viewportFrame.CurrentCamera = camera
			if not pcall(function()
				local clone_ = argument3911:Clone()
				for _, descendant in ipairs(clone_:GetDescendants()) do
					if descendant:IsA("Script") or descendant:IsA("LocalScript") then
						descendant:Destroy()
					end
				end
				clone_.Parent = worldModel
				camera.FieldOfView = 40
				pcall(function()
					clone_:PivotTo(CFrame.new())
				end)
				local boundingBox, value403 = clone_:GetBoundingBox()
				local number81 = math.max(value403.Magnitude / 2, 1) / math.tan(math.rad(camera.FieldOfView * 0.5)) * 1.15
				local position = boundingBox.Position
				camera.CFrame = CFrame.new(position + Vector3.new(0, value403.Y * 0.25, number81), position)
				local entry135 = 0
				local connection_ = nil
				connection_ = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
					if not viewportFrame.Parent then
						connection_:Disconnect()
						return
					end
					if not viewportFrame.Visible then
						return
					end
					entry135 += deltaTime
					if entry135 < 0.067 then
						return
					end
					entry135 = 0
					local value404 = math.rad(os.clock() * 45 % 360)
					local number82 = value403.Y * 0.25
					local number811 = number81
					camera.CFrame = CFrame.new(position + Vector3.new(number81 * math.sin(value404), number82, number811 * math.cos(value404)), position)
				end)
				task.spawn(function()
					local value405 = handleAction283(argument390)
					if not value405 or not clone_.Parent then
						return
					end
					pcall(function()
						local humanoid = clone_:FindFirstChildOfClass("Humanoid")
						local animationController = clone_:FindFirstChildOfClass("AnimationController")
						local animator
						if humanoid then
							animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)
						elseif animationController then
							animator = animationController:FindFirstChildOfClass("Animator") or Instance.new("Animator", animationController)
						else
							local new = Instance.new
							local animationController2 = Instance.new("AnimationController", clone_)
							animator = new("Animator", animationController2)
						end
						local value406 = animator:LoadAnimation(value405)
						value406.Looped = true
						value406:Play(0)
						task.delay(0.05, function()
							pcall(function()
								if value406 then
									value406.TimePosition = 0.2
									value406:AdjustSpeed(0)
								end
							end)
						end)
					end)
				end)
			end) then
				viewportFrame:Destroy()
				return nil
			end
			return viewportFrame
		end
		_G.__4HubBrainrotViewport = function(argument392, argument393, argument394)
			return createViewportFrame(argument392, argument393, argument394)
		end
		local items96 = {}
		local now2 = 0
		_G.__4HubStealPrompts = function()
			if tick() - now2 < 0.6 then
				return items96
			end
			now2 = tick()
			local items97 = {}
			local plots = Workspace2:FindFirstChild("Plots")
			if plots then
				for _, child in ipairs(plots:GetChildren()) do
					local animalPodiums = child:FindFirstChild("AnimalPodiums")
					if animalPodiums then
						for _, child2 in ipairs(animalPodiums:GetChildren()) do
							local base = child2:FindFirstChild("Base")
							base = base and base:FindFirstChild("Spawn")
							local promptAttachment = base and base:FindFirstChild("PromptAttachment")
							if promptAttachment then
								for _, child3 in ipairs(promptAttachment:GetChildren()) do
									if child3:IsA("ProximityPrompt") and child3.ActionText and child3.ActionText:lower():find("steal") then
										items97[#items97 + 1] = child3
									end
								end
							end
						end
					end
				end
			end
			items96 = items97
			return items97
		end
		local options90 = {
			gold = Color3.fromRGB(255, 222, 89),
			diamond = Color3.fromRGB(37, 196, 254),
			bloodrot = Color3.fromRGB(145, 0, 27),
			rainbow = Color3.fromRGB(255, 0, 251),
			candy = Color3.fromRGB(255, 70, 246),
			lava = Color3.fromRGB(255, 149, 0),
			galaxy = Color3.fromRGB(170, 60, 255),
			yinyang = Color3.fromRGB(255, 255, 255),
			radioactive = Color3.fromRGB(104, 245, 0),
			cursed = Color3.fromRGB(245, 56, 56),
			divine = Color3.fromRGB(255, 209, 59),
			cyber = Color3.fromRGB(121, 219, 255),
			phantom = Color3.fromRGB(210, 210, 220),
		}
		local color = Color3.fromRGB(150, 165, 195)
		_G.__4HubMutColor = function(argument395)
			local text37 = tostring(argument395 or ""):gsub("%s+", ""):lower()
			if text37 == "" or text37 == "none" or text37 == "normal" then
				return color
			end
			return options90[text37] or Color3.fromRGB(180, 150, 255)
		end
		local colorSequence = ColorSequence.new
		local items98 = {}
		local value407 = ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 235, 255))
		local value408 = ColorSequenceKeypoint.new(0.3, Color3.fromRGB(90, 150, 255))
		local value409 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(180, 120, 255))
		local value410 = ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 230, 230))
		local new = ColorSequenceKeypoint.new
		local color2 = Color3.fromRGB
		items98[1] = value407
		items98[2] = value408
		items98[3] = value409
		items98[4] = value410
		do
			local values = table.pack(new(1, color2(120, 235, 255)))
			table.move(values, 1, values.n, 5, items98)
		end
		local value411 = colorSequence(items98)
		local items99 = {}
		local enabled61 = false
		local function handleAction284()
			if enabled61 or not _G.__4HubPulse then
				return
			end
			enabled61 = true
			_G.__4HubPulse(function(argument396)
				local number83 = argument396 * 0.5 % 2 - 1
				local number84 = #items99
				local entry136 = 0
				for i = 1, number84 do
					local entry137 = items99[i]
					if entry137 and entry137.Parent then
						entry136 += 1
						items99[entry136] = entry137
						if entry137.Enabled then
							entry137.Offset = Vector2.new(number83, 0)
						end
					end
				end
				for i = entry136 + 1, number84 do
					items99[i] = nil
				end
			end)
		end
		local function handleAction285(argument397, argument398)
			if argument397 == "phantom" then
				local colorSequence2 = ColorSequence.new
				local items100 = {}
				local value412 = ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 24))
				local value413 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255))
				items100[1] = value412
				items100[2] = value413
				do
					local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 24)))
					table.move(values, 1, values.n, 3, items100)
				end
				return colorSequence2(items100)
			end
			if argument397 == "rainbow" then
				return value411
			end
			local color3 = Color3.new(argument398.R * 0.45, argument398.G * 0.45, argument398.B * 0.45)
			local min = math.min
			local number85 = argument398.B + 0.55
			local color4 = Color3.new(math.min(1, argument398.R + 0.55), math.min(1, argument398.G + 0.55), min(1, number85))
			local colorSequence2 = ColorSequence.new
			local items101 = {}
			local value414 = ColorSequenceKeypoint.new(0, color3)
			local value415 = ColorSequenceKeypoint.new(0.42, argument398)
			local value416 = ColorSequenceKeypoint.new(0.5, color4)
			local value417 = ColorSequenceKeypoint.new(0.58, argument398)
			local new2 = ColorSequenceKeypoint.new
			items101[1] = value414
			items101[2] = value415
			items101[3] = value416
			items101[4] = value417
			do
				local values = table.pack(new2(1, color3))
				table.move(values, 1, values.n, 5, items101)
			end
			return colorSequence2(items101)
		end
		_G.__4HubMutStyle = function(parent, argument399)
			if not parent then
				return
			end
			local text38 = tostring(argument399 or ""):gsub("%s+", ""):lower()
			local 4HubMutGrad = parent:FindFirstChild("4HubMutGrad")
			if text38 == "" or text38 == "none" or text38 == "normal" then
				if 4HubMutGrad then
					4HubMutGrad.Enabled = false
				end
				parent.TextColor3 = color
				return
			end
			if text38 == "yinyang" then
				if 4HubMutGrad then
					4HubMutGrad.Enabled = false
				end
				parent.TextColor3 = Color3.fromRGB(255, 255, 255)
				return
			end
			if not 4HubMutGrad then
				4HubMutGrad = Instance.new("UIGradient")
				4HubMutGrad.Name = "4HubMutGrad"
				4HubMutGrad.Parent = parent
				items99[#items99 + 1] = 4HubMutGrad
				handleAction284()
			end
			if 4HubMutGrad:GetAttribute("4HubMut") ~= text38 then
				4HubMutGrad.Color = handleAction285(text38, options90[text38] or Color3.fromRGB(180, 150, 255))
				4HubMutGrad:SetAttribute("4HubMut", text38)
			end
			4HubMutGrad.Enabled = true
			parent.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
	end
	handleAction262()
end
do
	local function handleAction286()
		local players21 = game:GetService("Players")
		local service22 = game:GetService("RunService")
		game:GetService("Workspace")
		local options91 = {
			VeryDark = Color3.fromRGB(4, 7, 20),
			Dark = Color3.fromRGB(7, 12, 32),
			Navy = Color3.fromRGB(16, 28, 70),
			Cyan = Color3.fromRGB(60, 210, 255),
			Blue = Color3.fromRGB(70, 130, 255),
			Purple = Color3.fromRGB(150, 110, 255),
			Dim = Color3.fromRGB(150, 165, 195),
			Green = Color3.fromRGB(80, 225, 130),
		}
		local gothamBold2 = Enum.Font.GothamBold
		local function createUICorner2(parent, argument400)
			local uiCorner = Instance.new("UICorner")
			uiCorner.CornerRadius = UDim.new(0, argument400 or 8)
			uiCorner.Parent = parent
			return uiCorner
		end
		local function handleAction287(parent, color, thickness, transparency)
			local instance4 = Instance.new("UIStroke")
			instance4.Color = color or options91.Cyan
			instance4.Thickness = thickness or 1
			instance4.Transparency = transparency or 0
			instance4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			instance4.Parent = parent
			return instance4
		end
		local function handleAction288()
			return _G.__4HubAccentCur and _G.__4HubAccentCur.LightBlue or options91.Cyan
		end
		local function handleAction289()
			local value418 = handleAction288()
			local value = select(1, Color3.toHSV(value418))
			local colorSequence = ColorSequence.new
			local items102 = {}
			local value419 = ColorSequenceKeypoint.new(0, Color3.fromHSV(value, 0.75, 1))
			local value420 = ColorSequenceKeypoint.new(0.5, value418)
			local new = ColorSequenceKeypoint.new
			local color = Color3.fromHSV
			local number86 = (value + 0.08) % 1
			local entry138 = 1
			items102[1] = value419
			items102[2] = value420
			do
				local values = table.pack(new(1, color(number86, 0.62, entry138)))
				table.move(values, 1, values.n, 3, items102)
			end
			return colorSequence(items102)
		end
		local number87 = 112
		local entry139 = 28
		local enabled62 = false
		local number88 = 0
		local folder3 = nil
		local items103 = {}
		local function handleAction290(argument401)
			local parent = argument401.Parent
			if parent and parent:IsA("Attachment") then
				parent = parent.Parent
			end
			if parent and parent:IsA("BasePart") then
				return parent
			end
			return nil
		end
		local function handleAction291(argument402)
			if argument402.ObjectText and argument402.ObjectText ~= "" then
				return argument402.ObjectText
			end
			local parent = argument402.Parent
			if parent and parent.Name ~= "" and parent.Name ~= "AnimalOverlap" then
				return parent.Name
			end
			return "Brainrot"
		end
		local function handleAction292(argument403)
			local value421 = handleAction290(argument403)
			if not value421 then
				return nil
			end
			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Name = "BrainrotMarker"
			billboardGui.Adornee = value421
			billboardGui.Size = UDim2.fromOffset(112, entry139)
			billboardGui.StudsOffset = Vector3.new(0, 3.8, 0)
			billboardGui.AlwaysOnTop = true
			billboardGui.MaxDistance = 1200
			billboardGui.LightInfluence = 0
			billboardGui.ResetOnSpawn = false
			billboardGui.Parent = folder3
			local instance4 = Instance.new("Frame")
			instance4.Size = UDim2.new(1, 8, 1, 8)
			instance4.Position = UDim2.new(0, -4, 0, -4)
			instance4.BackgroundColor3 = handleAction288()
			instance4.BackgroundTransparency = 0.9
			instance4.BorderSizePixel = 0
			instance4.Parent = billboardGui
			createUICorner2(instance4, 12)
			local instance5 = Instance.new("Frame")
			instance5.Size = UDim2.new(1, 0, 1, 0)
			instance5.BackgroundColor3 = options91.VeryDark
			instance5.BackgroundTransparency = 0.28
			instance5.BorderSizePixel = 0
			instance5.Parent = billboardGui
			createUICorner2(instance5, 8)
			local instance6 = Instance.new("UIGradient")
			instance6.Rotation = 90
			local new = ColorSequenceKeypoint.new
			local veryDark = options91.VeryDark
			instance6.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, options91.Dark), new(1, veryDark) })
			instance6.Transparency = NumberSequence.new(0.1)
			instance6.Parent = instance5
			local value422 = handleAction287(instance5, options91.Cyan, 1.8, 0.05)
			local uiGradient = Instance.new("UIGradient")
			uiGradient.Color = handleAction289()
			uiGradient.Parent = value422
			local instance7 = Instance.new("TextLabel")
			instance7.BackgroundTransparency = 1
			instance7.Position = UDim2.fromOffset(4, 2)
			instance7.Size = UDim2.fromOffset(12, 12)
			instance7.Font = gothamBold2
			instance7.Text = "★"
			instance7.TextColor3 = Color3.fromRGB(255, 215, 45)
			instance7.TextSize = 12
			instance7.Visible = false
			instance7.Parent = instance5
			local instance8 = Instance.new("TextLabel")
			instance8.BackgroundTransparency = 1
			instance8.Position = UDim2.fromOffset(18, 2)
			instance8.AutomaticSize = Enum.AutomaticSize.X
			instance8.Size = UDim2.fromOffset(0, 12)
			instance8.Font = gothamBold2
			instance8.Text = "Normal"
			instance8.TextColor3 = options91.Dim
			instance8.TextSize = 10
			instance8.TextXAlignment = Enum.TextXAlignment.Left
			instance8.Parent = instance5
			local frame5 = Instance.new("Frame")
			frame5.BackgroundTransparency = 1
			frame5.ClipsDescendants = true
			frame5.Position = UDim2.fromOffset(70, 2)
			frame5.Size = UDim2.fromOffset(30, 12)
			frame5.Parent = instance5
			local textLabel = Instance.new("TextLabel")
			textLabel.BackgroundTransparency = 1
			textLabel.Position = UDim2.fromOffset(8, 15)
			textLabel.Size = UDim2.new(1, -58, 0, 12)
			textLabel.Font = gothamBold2
			textLabel.Text = handleAction291(argument403)
			textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			textLabel.TextSize = 11
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.TextYAlignment = Enum.TextYAlignment.Center
			textLabel.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel.Parent = instance5
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.AnchorPoint = Vector2.new(1, 1)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Position = UDim2.new(1, -6, 1, -2)
			textLabel2.Size = UDim2.fromOffset(52, 12)
			textLabel2.Font = gothamBold2
			textLabel2.Text = ""
			textLabel2.TextColor3 = Color3.fromRGB(80, 225, 230)
			textLabel2.TextSize = 10
			textLabel2.TextXAlignment = Enum.TextXAlignment.Right
			textLabel2.Parent = instance5
			local options92 = {
				gui = billboardGui,
				grad = uiGradient,
				glow = instance4,
				name = textLabel,
				mut = instance8,
				price = textLabel2,
				star = instance7,
				traitBox = frame5,
			}
			items103[argument403] = options92
			return options92
		end
		if _G.__4HubOnTheme then
			_G.__4HubOnTheme(function()
				for _, value423 in pairs(items103) do
					pcall(function()
						if value423.grad and value423.grad.Parent then
							value423.grad.Color = handleAction289()
						end
						if value423.glow and value423.glow.Parent then
							value423.glow.BackgroundColor3 = handleAction288()
						end
					end)
				end
			end)
		end
		local function handleAction293(argument404)
			local entry140 = items103[argument404]
			if not entry140 then
				return
			end
			if entry140.gui then
				pcall(function()
					entry140.gui:Destroy()
				end)
			end
			items103[argument404] = nil
		end
		local function handleAction294()
			for k in pairs(items103) do
				handleAction293(k)
			end
		end
		local function handleAction295()
			if not enabled62 or not folder3 then
				return
			end
			local items104 = {}
			local value424 = ipairs
			local 4HubStealPrompts = _G.__4HubStealPrompts and _G.__4HubStealPrompts() or {}
			for _, 4HubStealPrompt in value424(4HubStealPrompts) do
				if 4HubStealPrompt.Parent then
					items104[4HubStealPrompt] = true
				end
			end
			for k in pairs(items103) do
				if not items104[k] or not k.Parent then
					handleAction293(k)
				end
			end
			local number89 = -1
			local value425 = nil
			for k in pairs(items104) do
				local entry141 = items103[k] or handleAction292(k)
				if entry141 then
					local value426 = handleAction291(k)
					if entry141.name.Text ~= value426 then
						entry141.name.Text = value426
					end
					local value427 = handleAction290(k)
					if value427 and entry141.gui.Adornee ~= value427 then
						entry141.gui.Adornee = value427
					end
					local number90 = 0
					local text39 = "Normal"
					local number91 = 0
					if _G.__4HubPromptInfo then
						local ok, result, result2, result3 = pcall(_G.__4HubPromptInfo, k)
						if ok then
							number90 = result or number90
							text39 = result2 or text39
							number91 = result3 or 0
						end
					end
					local text = tostring(text39)
					if text == "" or text:lower() == "none" then
						text = "Normal"
					end
					entry141.mut.Text = text
					if _G.__4HubMutStyle then
						_G.__4HubMutStyle(entry141.mut, text39)
					elseif _G.__4HubMutColor then
						entry141.mut.TextColor3 = _G.__4HubMutColor(text39)
					end
					entry141.price.Text = _G.__4HubMoney and _G.__4HubMoney(number91) or "$" .. tostring(number90)
					if entry141.traitBox then
						local x = entry141.mut.AbsoluteSize.X
						if x and x > 0 then
							entry141.traitBox.Position = UDim2.fromOffset(18 + x + 5, 2)
							entry141.traitBox.Size = UDim2.fromOffset(math.max(12, number87 - 8 - 18 + x + 5), 12)
						end
						local 4HubPromptTraits = _G.__4HubPromptTraits and _G.__4HubPromptTraits(k) or {}
						if _G.__4HubRenderTraits then
							_G.__4HubRenderTraits(entry141.traitBox, 4HubPromptTraits, 12)
						end
					end
					if number89 < number90 then
						number89 = number90
						value425 = k
					end
				end
			end
			for k, value428 in pairs(items103) do
				if value428.star then
					value428.star.Visible = value425 ~= nil and k == value425
				end
			end
		end
		local number92 = 0
		service22.RenderStepped:Connect(function(deltaTime)
			if not enabled62 then
				return
			end
			number92 += deltaTime or 0
			if number92 < 0.05 then
				return
			end
			number92 = 0
			local rotation = tick() * 120 % 360
			for _, value429 in pairs(items103) do
				if value429.grad and value429.grad.Parent then
					value429.grad.Rotation = rotation
				end
			end
		end)
		_G.__4HubSetBrainrotESP = function(argument405)
			if argument405 then
				if enabled62 then
					return
				end
				enabled62 = true
				if not folder3 or not folder3.Parent then
					folder3 = Instance.new("Folder")
					folder3.Name = "\5"
					folder3.Parent = _G.__4HubEspGuiHolder()
				end
				number88 += 1
				local number881 = number88
				task.spawn(function()
					while enabled62 and number881 == number88 do
						pcall(handleAction295)
						task.wait(0.4)
					end
				end)
			else
				enabled62 = false
				number88 += 1
				handleAction294()
			end
		end
	end
	handleAction286()
end
do
	local function handleAction296()
		local players22 = game:GetService("Players")
		local RunService2 = game:GetService("RunService")
		local Workspace2 = game:GetService("Workspace")
		local localPlayer28 = players22.LocalPlayer
		local color = Color3.fromRGB(60, 210, 255)
		local enabled63 = false
		local part = nil
		local value430 = nil
		local number93 = 0
		local connection_ = nil
		local function handleAction297(argument406)
			local parent = argument406.Parent
			if parent and parent:IsA("Attachment") then
				parent = parent.Parent
			end
			if parent and parent:IsA("BasePart") then
				return parent
			end
			return nil
		end
		local function handleAction298()
			local value431 = ipairs
			local 4HubStealPrompts = _G.__4HubStealPrompts and _G.__4HubStealPrompts() or {}
			local number94 = -1
			local value432 = nil
			for _, 4HubStealPrompt in value431(4HubStealPrompts) do
				if 4HubStealPrompt.Parent then
					local value433 = handleAction297(4HubStealPrompt)
					if value433 then
						local entry142 = 0
						if _G.__4HubPromptGen then
							local ok, result = pcall(_G.__4HubPromptGen, 4HubStealPrompt)
							entry142 = ok and type(result) == "number" and result or 0
						end
						if number94 < entry142 then
							number94 = entry142
							value432 = value433
						end
					end
				end
			end
			value430 = value432
		end
		_G.__4HubSetBrainrotLine = function(argument407)
			if argument407 then
				if enabled63 then
					return
				end
				enabled63 = true
				local brainrotLineBeam = Workspace2:FindFirstChild("BrainrotLine_Beam")
				if brainrotLineBeam then
					brainrotLineBeam:Destroy()
				end
				part = Instance.new("Part")
				part.Name = "BrainrotLine_Beam"
				part.Anchored = true
				part.CanCollide = false
				part.CanTouch = false
				part.CanQuery = false
				part.CastShadow = false
				part.Material = Enum.Material.Neon
				if _G.__4HubEspBind then
					_G.__4HubEspBind(part, "Color", color, "color3")
				else
					part.Color = color
				end
				part.Transparency = 1
				part.Size = Vector3.new(0.18, 0.18, 1)
				part.Parent = Workspace2
				number93 += 1
				local number931 = number93
				task.spawn(function()
					while enabled63 and number931 == number93 do
						pcall(handleAction298)
						task.wait(0.5)
					end
				end)
				if connection_ then
					connection_:Disconnect()
				end
				connection_ = RunService2.RenderStepped:Connect(function()
					if not enabled63 or not part then
						return
					end
					local character = localPlayer28.Character
					character = character and character:FindFirstChild("HumanoidRootPart")
					if not character or not value430 or not value430.Parent then
						part.Transparency = 1
						return
					end
					local position = character.Position
					local position2 = value430.Position
					local magnitude = (position2 - position).Magnitude
					if magnitude < 1 then
						part.Transparency = 1
						return
					end
					part.Transparency = 0
					part.Size = Vector3.new(0.18, 0.18, magnitude)
					part.CFrame = CFrame.lookAt((position + position2) / 2, position2)
				end)
			else
				enabled63 = false
				number93 += 1
				if connection_ then
					connection_:Disconnect()
					connection_ = nil
				end
				if part then
					part:Destroy()
					part = nil
				end
				value430 = nil
			end
		end
	end
	handleAction296()
end
task.defer(function()
	_G.__4HubReady = true
	local GrabMode = getSavedChoice("GrabMode") or "Nearest"
	_G.__4HubGrabMode = GrabMode
	if _G.__4HubTC_ApplyMode then
		pcall(_G.__4HubTC_ApplyMode, GrabMode)
	end
end)
do
	local function handleAction299()
		local TweenService2 = game:GetService("TweenService")
		local UserInputService = game:GetService("UserInputService")
		_G.__4HubProxRadius = getSavedNumber("ProxStuds") or 15
		local number95 = 1
		local number96 = 50
		local instance4 = Instance.new("Frame")
		instance4.Name = "ProxStudsPopup"
		instance4.AnchorPoint = Vector2.new(0.5, 0.5)
		instance4.Position = UDim2.new(0.5, 0, 0.5, 0)
		instance4.Size = UDim2.fromOffset(210, 110)
		instance4.BackgroundColor3 = themeColors.BgPanel
		instance4.BorderSizePixel = 0
		instance4.Visible = false
		instance4.ClipsDescendants = true
		instance4.Active = true
		instance4.ZIndex = 40
		instance4.Parent = frame
		createUICorner(instance4, 10)
		createUIStroke(instance4, themeColors.LightBlue, 1)
		local textLabel = Instance.new("TextLabel")
		textLabel.BackgroundTransparency = 1
		textLabel.Position = UDim2.fromOffset(12, 8)
		textLabel.Size = UDim2.new(1, -40, 0, 16)
		textLabel.Font = gothamBold
		textLabel.Text = "Proximity Studs"
		textLabel.TextColor3 = themeColors.White
		textLabel.TextSize = 13
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.ZIndex = 41
		textLabel.Parent = instance4
		local instance5 = Instance.new("TextButton")
		instance5.AnchorPoint = Vector2.new(1, 0)
		instance5.Position = UDim2.new(1, -8, 0, 6)
		instance5.Size = UDim2.fromOffset(18, 18)
		instance5.BackgroundTransparency = 1
		instance5.Font = gothamBold
		instance5.Text = "X"
		instance5.TextColor3 = themeColors.TextDim
		instance5.TextSize = 13
		instance5.ZIndex = 41
		instance5.Parent = instance4
		instance5.MouseEnter:Connect(function()
			instance5.TextColor3 = themeColors.White
		end)
		instance5.MouseLeave:Connect(function()
			instance5.TextColor3 = themeColors.TextDim
		end)
		local frame5 = Instance.new("Frame")
		frame5.Position = UDim2.fromOffset(10, 30)
		frame5.Size = UDim2.new(1, -20, 0, 1)
		frame5.BackgroundColor3 = themeColors.Stroke
		frame5.BorderSizePixel = 0
		frame5.ZIndex = 41
		frame5.Parent = instance4
		local instance6 = Instance.new("TextLabel")
		instance6.BackgroundTransparency = 1
		instance6.Position = UDim2.fromOffset(12, 40)
		instance6.Size = UDim2.new(1, -24, 0, 16)
		instance6.Font = gothamMedium
		instance6.Text = "Studs"
		instance6.TextColor3 = themeColors.TextDim
		instance6.TextSize = 12
		instance6.TextXAlignment = Enum.TextXAlignment.Left
		instance6.ZIndex = 41
		instance6.Parent = instance4
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.BackgroundTransparency = 1
		textLabel2.AnchorPoint = Vector2.new(1, 0)
		textLabel2.Position = UDim2.new(1, -12, 0, 40)
		textLabel2.Size = UDim2.fromOffset(40, 16)
		textLabel2.Font = gothamBold
		textLabel2.TextColor3 = themeColors.LightBlue
		textLabel2.TextSize = 12
		textLabel2.TextXAlignment = Enum.TextXAlignment.Right
		textLabel2.ZIndex = 41
		textLabel2.Parent = instance4
		local frame6 = Instance.new("Frame")
		frame6.Position = UDim2.fromOffset(12, 74)
		frame6.Size = UDim2.new(1, -24, 0, 6)
		frame6.BackgroundColor3 = themeColors.ToggleOff
		frame6.BorderSizePixel = 0
		frame6.ZIndex = 41
		frame6.Parent = instance4
		createUICorner(frame6, 3)
		local frame7 = Instance.new("Frame")
		frame7.Size = UDim2.new(0, 0, 1, 0)
		frame7.BackgroundColor3 = themeColors.LightBlue
		frame7.BorderSizePixel = 0
		frame7.ZIndex = 42
		frame7.Parent = frame6
		createUICorner(frame7, 3)
		local instance7 = Instance.new("UIGradient")
		local new = ColorSequenceKeypoint.new
		local entry143 = 1
		local lightBlue = themeColors.LightBlue
		instance7.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, themeColors.DarkBlue), new(entry143, lightBlue) })
		instance7.Parent = frame7
		local frame8 = Instance.new("Frame")
		frame8.AnchorPoint = Vector2.new(0.5, 0.5)
		frame8.Size = UDim2.fromOffset(14, 14)
		frame8.BackgroundColor3 = themeColors.White
		frame8.BorderSizePixel = 0
		frame8.ZIndex = 43
		frame8.Parent = frame6
		createUICorner(frame8, 7)
		local instance8 = Instance.new("TextButton")
		instance8.BackgroundTransparency = 1
		instance8.Text = ""
		instance8.Size = UDim2.new(1, 0, 4, 0)
		instance8.Position = UDim2.new(0, 0, -1.5, 0)
		instance8.ZIndex = 44
		instance8.Parent = frame6
		local function handleAction300(argument408, argument409)
			local 4HubProxRadius = math.clamp(math.floor(argument408 + 0.5), 1, 50)
			local number97 = (4HubProxRadius - number95) / (number96 - number95)
			frame7.Size = UDim2.new(number97, 0, 1, 0)
			frame8.Position = UDim2.new(number97, 0, 0.5, 0)
			textLabel2.Text = tostring(4HubProxRadius)
			_G.__4HubProxRadius = 4HubProxRadius
			if argument409 then
				saveNumber("ProxStuds", 4HubProxRadius)
			end
		end
		handleAction300(_G.__4HubProxRadius, false)
		local enabled64 = false
		local function handleAction301(argument410)
			local entry144 = 0
			local number98 = number96 - number95
			handleAction300(number95 + math.clamp((argument410 - frame6.AbsolutePosition.X) / math.max(frame6.AbsoluteSize.X, 1), entry144, 1) * number98, true)
		end
		instance8.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				enabled64 = true
				handleAction301(input.Position.X)
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if enabled64 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				handleAction301(input.Position.X)
			end
		end)
		UserInputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				enabled64 = false
			end
			return
		end)
		local enabled65 = false
		local function handleAction302()
			enabled65 = false
			TweenService2:Create(instance4, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.fromOffset(0, 0) }):Play()
			task.delay(0.14, function()
				if not enabled65 then
					instance4.Visible = false
				end
			end)
		end
		instance5.MouseButton1Click:Connect(handleAction302)
		_G.__4HubOpenProxPopup = function()
			enabled65 = not enabled65
			if enabled65 then
				instance4.Visible = true
				instance4.Size = UDim2.fromOffset(0, 0)
				TweenService2:Create(instance4, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(210, 110) }):Play()
			else
				handleAction302()
			end
		end
	end
	handleAction299()
end
do
	local function handleAction303()
		local players23 = game:GetService("Players")
		local RunService2 = game:GetService("RunService")
		local Workspace2 = game:GetService("Workspace")
		local localPlayer29 = players23.LocalPlayer
		local playerGui_ = localPlayer29:WaitForChild("PlayerGui")
		local color = Color3.fromRGB(60, 150, 255)
		local items105 = { "balloon", "inverse", "jail", "jumpscare", "morph", "ragdoll", "rocket", "tiny" }
		local options93 = {
			ragdoll = 30,
			jail = 60,
			rocket = 120,
			balloon = 30,
			inverse = 30,
			jumpscare = 30,
			tiny = 30,
			morph = 30,
		}
		local function handleAction304()
			return _G.__4HubProxRadius or 15
		end
		local items106 = {}
		local function handleAction305(argument411)
			local adminPanel = playerGui_:FindFirstChild("AdminPanel")
			if not adminPanel then
				return nil
			end
			local ok, result = pcall(function()
				return adminPanel.AdminPanel.Content.ScrollingFrame
			end)
			if not ok or not result then
				return nil
			end
			local value434 = result:FindFirstChild(argument411)
			if not value434 then
				return nil
			end
			local timer = value434:FindFirstChild("Timer")
			if not timer or not timer.Visible then
				return 0
			end
			return tonumber(timer.Text:match("%d+")) or 0
		end
		local function handleAction306(argument412)
			local value435 = handleAction305(argument412)
			if value435 == nil then
				local entry145 = items106[argument412]
				local entry146 = options93[argument412] or 0
				return entry145 and entry146 > 0 and tick() - entry145 < entry146
			end
			return value435 > 0
		end
		local function handleAction307(argument413)
			items106[argument413] = tick()
		end
		local function handleAction308(argument414)
			if not argument414 then
				return false
			end
			local enabled66 = false
			local function handleAction309(argument415)
				if not argument415 or not getconnections then
					return
				end
				local ok, result = pcall(getconnections, argument415)
				if ok and result then
					for _, value436 in ipairs(result) do
						if value436.Fire then
							pcall(function()
								value436:Fire()
							end)
							enabled66 = true
						elseif value436.Function then
							pcall(value436.Function)
							enabled66 = true
						end
					end
				end
			end
			pcall(function()
				handleAction309(argument414.Activated)
			end)
			pcall(function()
				handleAction309(argument414.MouseButton1Click)
			end)
			if not enabled66 and typeof(firesignal) == "function" then
				pcall(firesignal, argument414.MouseButton1Click)
				pcall(firesignal, argument414.Activated)
				enabled66 = true
			end
			return enabled66
		end
		local function handleAction310(argument416, argument417)
			local value437 = argument416:FindFirstChild(argument417)
			if value437 then
				return value437
			end
			for _, descendant in ipairs(argument416:GetDescendants()) do
				if descendant.Name == argument417 and descendant:IsA("GuiButton") then
					return descendant
				end
			end
			return nil
		end
		local function handleAction311(argument418, argument419)
			local value438 = argument418:FindFirstChild(argument419.Name)
			if value438 and value438:IsA("GuiButton") then
				return value438
			end
			for _, descendant in ipairs(argument418:GetDescendants()) do
				if descendant:IsA("GuiButton") then
					if descendant.Name == argument419.Name then
						return descendant
					end
					local enabled67 = descendant:FindFirstChildWhichIsA("TextLabel")
					if enabled67 then
						enabled67 = enabled67.Text == argument419.Name or enabled67.Text == argument419.DisplayName
					end
					if enabled67 then
						return descendant
					end
				end
			end
			return nil
		end
		local function handleAction312(argument420, argument421)
			if not argument420 or not argument421 or argument421 == "" then
				return false
			end
			local adminPanel = playerGui_:FindFirstChild("AdminPanel") or playerGui_:WaitForChild("AdminPanel", 3)
			if not adminPanel then
				return false
			end
			local value = select(2, pcall(function()
				return adminPanel.AdminPanel.Content.ScrollingFrame
			end))
			local value439 = value and handleAction310(value, argument421) or handleAction310(adminPanel, argument421)
			if not value439 then
				return false
			end
			if not handleAction308(value439) then
				return false
			end
			task.wait(0.03)
			local value2 = select(2, pcall(function()
				return adminPanel.AdminPanel.Profiles.ScrollingFrame
			end))
			local value440 = value2 and handleAction311(value2, argument420)
			if not value440 then
				task.wait(0.04)
				value440 = value2 and handleAction311(value2, argument420)
			end
			value440 = value440 or handleAction311(adminPanel, argument420)
			if not value440 then
				return false
			end
			handleAction308(value440)
			handleAction307(argument421)
			if _G.__4HubNotify then
				_G.__4HubNotify(tostring(argument421):gsub("^%l", string.upper), "on " .. (argument420.DisplayName or argument420.Name))
			end
			return true
		end
		local items107 = {}
		local function handleAction313(argument422)
			local 4HubProxOrder = _G.__4HubProxOrder or items105
			for i = 1, #4HubProxOrder do
				local entry147 = 4HubProxOrder[i]
				if not handleAction306(entry147) then
					return entry147, i + 1
				end
			end
			return nil, argument422
		end
		local enabled68 = false
		local function handleAction314(argument423)
			local entry148 = items107[argument423]
			if not entry148 then
				return
			end
			local value441, value442 = handleAction313(entry148.index)
			if not value441 then
				return
			end
			entry148.index = value442
			if enabled68 then
				return
			end
			enabled68 = true
			task.spawn(function()
				pcall(handleAction312, argument423, value441)
				enabled68 = false
			end)
		end
		local enabled69 = false
		local part = nil
		local connection_ = nil
		local number99 = 0
		local function 4HubSetProximityAP(argument424)
			local argument4241 = argument424 and true or false
			if argument4241 == enabled69 then
				return
			end
			enabled69 = argument4241
			if enabled69 then
				local proximityAPRing = Workspace2:FindFirstChild("ProximityAP_Ring")
				if proximityAPRing then
					proximityAPRing:Destroy()
				end
				part = Instance.new("Part")
				part.Name = "ProximityAP_Ring"
				part.Shape = Enum.PartType.Cylinder
				part.Anchored = true
				part.CanCollide = false
				part.CanTouch = false
				part.CanQuery = false
				part.CastShadow = false
				part.Material = Enum.Material.Neon
				part.Transparency = 0.6
				part.Color = color
				part.Size = Vector3.new(0.2, handleAction304() * 2, handleAction304() * 2)
				part.Parent = Workspace2
				if connection_ then
					connection_:Disconnect()
				end
				connection_ = RunService2.Heartbeat:Connect(function()
					if not enabled69 or not part then
						return
					end
					local character = localPlayer29.Character
					character = character and character:FindFirstChild("HumanoidRootPart")
					if character then
						local value443 = handleAction304()
						part.Transparency = 0.6
						part.Size = Vector3.new(0.2, value443 * 2, value443 * 2)
						part.CFrame = character.CFrame * CFrame.Angles(0, 0, 1.5707963267948966) - Vector3.new(0, 2.8, 0)
						part.Color = color
						return
					end
					part.Transparency = 1
					return
				end)
				number99 += 1
				local number991 = number99
				task.spawn(function()
					while enabled69 and number991 == number99 do
						local now2 = tick()
						local character = localPlayer29.Character
						character = character and character:FindFirstChild("HumanoidRootPart")
						if character then
							local value444 = handleAction304()
							for _, player_ in ipairs(players23:GetPlayers()) do
								local matchesCondition10 = player_ ~= localPlayer29
								if matchesCondition10 then
									matchesCondition10 = not (_G.__4HubIsBlacklisted and _G.__4HubIsBlacklisted(player_))
								end
								if matchesCondition10 and player_.Character and player_.Character:FindFirstChild("HumanoidRootPart") then
									if (player_.Character.HumanoidRootPart.Position - character.Position).Magnitude <= value444 then
										if not items107[player_] then
											items107[player_] = { index = 1, nextTime = now2 + 0.4 }
											handleAction314(player_)
										elseif items107[player_].nextTime <= now2 then
											items107[player_].nextTime = now2 + 0.4
											handleAction314(player_)
										end
									else
										items107[player_] = nil
									end
								end
							end
						end
						task.wait(0.05)
					end
				end)
			else
				number99 += 1
				if connection_ then
					connection_:Disconnect()
					connection_ = nil
				end
				if part then
					part:Destroy()
					part = nil
				end
				items107 = {}
			end
			if _G.__4HubProxAPNotify then
				_G.__4HubProxAPNotify(enabled69)
			end
		end
		_G.__4HubSetProximityAP = 4HubSetProximityAP
		_G.__4HubToggleProximityAP = function()
			4HubSetProximityAP(not enabled69)
		end
		players23.PlayerRemoving:Connect(function(player_)
			items107[player_] = nil
		end)
	end
	handleAction303()
end
do
	local function handleAction315()
		local players24 = game:GetService("Players")
		local service23 = game:GetService("RunService")
		local UserInputService = game:GetService("UserInputService")
		local Workspace2 = game:GetService("Workspace")
		local CoreGui = game:GetService("CoreGui")
		local localPlayer30 = players24.LocalPlayer
		local playerGui_ = localPlayer30:WaitForChild("PlayerGui")
		local color = Color3.fromRGB(92, 165, 255)
		local color2 = Color3.fromRGB(40, 110, 220)
		local items108 = { "balloon", "inverse", "jail", "jumpscare", "morph", "ragdoll", "rocket", "tiny" }
		local options94 = {
			ragdoll = 30,
			jail = 60,
			rocket = 120,
			balloon = 30,
			inverse = 30,
			jumpscare = 30,
			tiny = 30,
			morph = 30,
		}
		local items109 = {}
		local function handleAction316(argument425)
			local adminPanel = playerGui_:FindFirstChild("AdminPanel")
			if not adminPanel then
				return nil
			end
			local ok, result = pcall(function()
				return adminPanel.AdminPanel.Content.ScrollingFrame
			end)
			if not ok or not result then
				return nil
			end
			local value445 = result:FindFirstChild(argument425)
			if not value445 then
				return nil
			end
			local timer = value445:FindFirstChild("Timer")
			if not timer or not timer.Visible then
				return 0
			end
			return tonumber(timer.Text:match("%d+")) or 0
		end
		local function handleAction317(argument426)
			local value446 = handleAction316(argument426)
			if value446 ~= nil then
				return value446 > 0
			end
			local entry149 = items109[argument426]
			local entry150 = options94[argument426] or 0
			return entry149 and entry150 > 0 and tick() - entry149 < entry150
		end
		local function handleAction318(argument427)
			items109[argument427] = tick()
		end
		local function handleAction319(argument428, argument429)
			local value447 = argument428:FindFirstChild(argument429)
			if value447 then
				return value447
			end
			for _, descendant in ipairs(argument428:GetDescendants()) do
				if descendant.Name == argument429 and descendant:IsA("GuiButton") then
					return descendant
				end
			end
			return nil
		end
		local function handleAction320(argument430, argument431)
			local value448 = argument430:FindFirstChild(argument431.Name)
			if value448 and value448:IsA("GuiButton") then
				return value448
			end
			for _, descendant in ipairs(argument430:GetDescendants()) do
				if descendant:IsA("GuiButton") then
					if descendant.Name == argument431.Name then
						return descendant
					end
					local textLabel = descendant:FindFirstChildWhichIsA("TextLabel")
					if textLabel then
						textLabel = textLabel.Text == argument431.Name or textLabel.Text == argument431.DisplayName
					end
					if textLabel then
						return descendant
					end
				end
			end
			return nil
		end
		local function handleAction321(argument432)
			if not argument432 then
				return false
			end
			local enabled70 = false
			local function handleAction322(argument433)
				if not argument433 or not getconnections then
					return
				end
				local ok, result = pcall(getconnections, argument433)
				if ok and result then
					for _, value449 in ipairs(result) do
						if value449.Fire then
							pcall(function()
								value449:Fire()
							end)
							enabled70 = true
						elseif value449.Function then
							pcall(value449.Function)
							enabled70 = true
						end
					end
				end
			end
			pcall(function()
				handleAction322(argument432.Activated)
			end)
			pcall(function()
				handleAction322(argument432.MouseButton1Click)
			end)
			if not enabled70 and typeof(firesignal) == "function" then
				pcall(firesignal, argument432.MouseButton1Click)
				pcall(firesignal, argument432.Activated)
				enabled70 = true
			end
			return enabled70
		end
		local function handleAction323(argument434, argument435)
			if not argument434 or not argument435 or argument435 == "" then
				return false
			end
			local adminPanel = playerGui_:FindFirstChild("AdminPanel") or playerGui_:WaitForChild("AdminPanel", 3)
			if not adminPanel then
				return false
			end
			local value = select(2, pcall(function()
				return adminPanel.AdminPanel.Content.ScrollingFrame
			end))
			local value450 = value and handleAction319(value, argument435) or handleAction319(adminPanel, argument435)
			if not value450 then
				return false
			end
			if not handleAction321(value450) then
				return false
			end
			task.wait(0.03)
			local value2 = select(2, pcall(function()
				return adminPanel.AdminPanel.Profiles.ScrollingFrame
			end))
			local value451 = value2 and handleAction320(value2, argument434)
			if not value451 then
				task.wait(0.04)
				value451 = value2 and handleAction320(value2, argument434)
			end
			value451 = value451 or handleAction320(adminPanel, argument434)
			if not value451 then
				return false
			end
			handleAction321(value451)
			handleAction318(argument435)
			if _G.__4HubNotify then
				_G.__4HubNotify(tostring(argument435):gsub("^%l", string.upper), "on " .. (argument434.DisplayName or argument434.Name))
			end
			return true
		end
		local highlight = Instance.new("Highlight")
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.OutlineColor = color
		highlight.OutlineTransparency = 0
		highlight.FillColor = color2
		highlight.FillTransparency = 0.55
		highlight.Adornee = nil
		highlight.Enabled = false
		pcall(function()
			highlight.Parent = CoreGui
		end)
		if not highlight.Parent then
			highlight.Parent = playerGui_
		end
		local function handleAction324(argument436, argument437, argument438, argument439)
			local number100 = argument439 / 2
			local number101 = argument438 - Vector3.new(number100, number100, number100)
			local number102 = argument438 + Vector3.new(number100, number100, number100)
			local vector = Vector3.new(argument437.X == 0 and 0.0001 or argument437.X, argument437.Y == 0 and 0.0001 or argument437.Y, argument437.Z == 0 and 0.0001 or argument437.Z)
			local number103 = (number101.X - argument436.X) / vector.X
			local number104 = (number102.X - argument436.X) / vector.X
			if not (number104 < number103) then
				local number1041 = number104
				number104 = number103
				number103 = number1041
			end
			local number105 = (number101.Y - argument436.Y) / vector.Y
			local number106 = (number102.Y - argument436.Y) / vector.Y
			if not (number106 < number105) then
				local number1051 = number105
				number105 = number106
				number106 = number1051
			end
			if number104 > number105 or number106 > number103 then
				return false
			end
			if not (number104 < number106) then
				number106 = number104
			end
			if not (number105 < number103) then
				number105 = number103
			end
			local number107 = (number101.Z - argument436.Z) / vector.Z
			local number108 = (number102.Z - argument436.Z) / vector.Z
			local number1071
			if number107 > number108 then
				number1071 = number107
			else
				number1071 = number108
				number108 = number107
			end
			return not (number106 > number1071 or number108 > number105)
		end
		local function handleAction325()
			local currentCamera = Workspace2.CurrentCamera
			if not currentCamera then
				return nil
			end
			local mouseLocation = UserInputService:GetMouseLocation()
			local value452 = currentCamera:ViewportPointToRay(mouseLocation.X, mouseLocation.Y)
			local huge = math.huge
			local value453 = nil
			for _, player_ in ipairs(players24:GetPlayers()) do
				local matchesCondition11 = player_ ~= localPlayer30
				if matchesCondition11 then
					matchesCondition11 = not (_G.__4HubIsBlacklisted and _G.__4HubIsBlacklisted(player_))
				end
				if matchesCondition11 and player_.Character and player_.Character:FindFirstChild("HumanoidRootPart") then
					if handleAction324(value452.Origin, value452.Direction, player_.Character.HumanoidRootPart.Position, 8) then
						local magnitude = (value452.Origin - player_.Character.HumanoidRootPart.Position).Magnitude
						if magnitude < huge then
							huge = magnitude
							value453 = player_
						end
					end
				end
			end
			return value453
		end
		local enabled = false
		local enabled71 = false
		service23.RenderStepped:Connect(function()
			if not enabled then
				if highlight.Adornee then
					highlight.Adornee = nil
				end
				return
			end
			local player1 = handleAction325()
			highlight.Adornee = player1 and player1.Character or nil
		end)
		UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if not enabled then
				return
			end
			if gameProcessed or input.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return
			end
			if enabled71 then
				return
			end
			local value454 = handleAction325()
			if not value454 then
				return
			end
			local 4HubClickOrder = _G.__4HubClickOrder or items108
			local value455 = nil
			for i = 1, #4HubClickOrder do
				local entry151 = 4HubClickOrder[i]
				if not handleAction317(entry151) then
					value455 = entry151
					break
				end
			end
			if not value455 then
				return
			end
			enabled71 = true
			task.spawn(function()
				pcall(handleAction323, value454, value455)
				enabled71 = false
			end)
		end)
		local function 4HubSetClickAP(argument440)
			local argument4401 = argument440 and true or false
			if argument4401 == enabled then
				return
			end
			enabled = argument4401
			highlight.Enabled = enabled
			if not enabled then
				highlight.Adornee = nil
			end
			if _G.__4HubClickAPNotify then
				_G.__4HubClickAPNotify(enabled)
			end
		end
		_G.__4HubSetClickAP = 4HubSetClickAP
		_G.__4HubToggleClickAP = function()
			4HubSetClickAP(not enabled)
		end
	end
	handleAction315()
end
do
	local function handleAction326()
		local service24 = game:GetService("Players")
		local Workspace2 = game:GetService("Workspace")
		local localPlayer31 = service24.LocalPlayer
		local playerGui_ = localPlayer31:WaitForChild("PlayerGui")
		local items110 = { "balloon", "inverse", "jail", "jumpscare", "morph", "ragdoll", "rocket", "tiny" }
		local options95 = {
			ragdoll = 30,
			jail = 60,
			rocket = 120,
			balloon = 30,
			inverse = 30,
			jumpscare = 30,
			tiny = 30,
			morph = 30,
		}
		local items111 = {}
		local function handleAction327(argument441)
			local adminPanel = playerGui_:FindFirstChild("AdminPanel")
			if not adminPanel then
				return nil
			end
			local ok, result = pcall(function()
				return adminPanel.AdminPanel.Content.ScrollingFrame
			end)
			if not ok or not result then
				return nil
			end
			local value456 = result:FindFirstChild(argument441)
			if not value456 then
				return nil
			end
			local timer = value456:FindFirstChild("Timer")
			if not timer or not timer.Visible then
				return 0
			end
			return tonumber(timer.Text:match("%d+")) or 0
		end
		local function handleAction328(argument442)
			local value457 = handleAction327(argument442)
			if value457 ~= nil then
				return value457 > 0
			end
			local entry152 = items111[argument442]
			local entry153 = options95[argument442] or 0
			return entry152 and entry153 > 0 and tick() - entry152 < entry153
		end
		local function handleAction329(argument443)
			items111[argument443] = tick()
		end
		local function handleAction330(argument444)
			if not argument444 then
				return false
			end
			local enabled72 = false
			local function handleAction331(argument445)
				if not argument445 or not getconnections then
					return
				end
				local ok, result = pcall(getconnections, argument445)
				if ok and result then
					for _, value458 in ipairs(result) do
						if value458.Fire then
							pcall(function()
								value458:Fire()
							end)
							enabled72 = true
						elseif value458.Function then
							pcall(value458.Function)
							enabled72 = true
						end
					end
				end
			end
			pcall(function()
				handleAction331(argument444.Activated)
			end)
			pcall(function()
				handleAction331(argument444.MouseButton1Click)
			end)
			if not enabled72 and typeof(firesignal) == "function" then
				pcall(firesignal, argument444.MouseButton1Click)
				pcall(firesignal, argument444.Activated)
				enabled72 = true
			end
			return enabled72
		end
		local function handleAction332(argument446, argument447)
			local value459 = argument446:FindFirstChild(argument447)
			if value459 then
				return value459
			end
			for _, descendant in ipairs(argument446:GetDescendants()) do
				if descendant.Name == argument447 and descendant:IsA("GuiButton") then
					return descendant
				end
			end
			return nil
		end
		local function handleAction333(argument448, argument449)
			local value460 = argument448:FindFirstChild(argument449.Name)
			if value460 and value460:IsA("GuiButton") then
				return value460
			end
			for _, descendant in ipairs(argument448:GetDescendants()) do
				if descendant:IsA("GuiButton") then
					if descendant.Name == argument449.Name then
						return descendant
					end
					local textControl6 = descendant:FindFirstChildWhichIsA("TextLabel")
					local matchesCondition12
					if textControl6 then
						matchesCondition12 = textControl6.Text == argument449.Name or textControl6.Text == argument449.DisplayName
					else
						matchesCondition12 = textControl6
					end
					if matchesCondition12 then
						return descendant
					end
				end
			end
			return nil
		end
		local function handleAction334(argument450, argument451)
			if not argument450 or not argument451 or argument451 == "" then
				return false
			end
			local adminPanel = playerGui_:FindFirstChild("AdminPanel") or playerGui_:WaitForChild("AdminPanel", 3)
			if not adminPanel then
				return false
			end
			local value = select(2, pcall(function()
				return adminPanel.AdminPanel.Content.ScrollingFrame
			end))
			local value461 = value and handleAction332(value, argument451) or handleAction332(adminPanel, argument451)
			if not value461 then
				return false
			end
			if not handleAction330(value461) then
				return false
			end
			task.wait(0.02)
			local value2 = select(2, pcall(function()
				return adminPanel.AdminPanel.Profiles.ScrollingFrame
			end))
			local value462 = value2 and handleAction333(value2, argument450)
			if not value462 then
				task.wait(0.03)
				value462 = value2 and handleAction333(value2, argument450)
			end
			value462 = value462 or handleAction333(adminPanel, argument450)
			if not value462 then
				return false
			end
			handleAction330(value462)
			handleAction329(argument451)
			if _G.__4HubNotify then
				_G.__4HubNotify(tostring(argument451):gsub("^%l", string.upper), "on " .. (argument450.DisplayName or argument450.Name))
			end
			return true
		end
		local function handleAction335(argument452)
			if not argument452 then
				return nil
			end
			if _G.XenSyncGet then
				local sProp = nil
				pcall(function()
					local value463 = _G.XenSyncGet(argument452.Name)
					if value463 then
						sProp = _G.sProp and _G.sProp(value463, "Owner") or value463:Get("Owner")
					end
				end)
				if sProp then
					if typeof(sProp) == "Instance" and sProp:IsA("Player") then
						return sProp
					end
					if type(sProp) == "table" and sProp.Name then
						return service24:FindFirstChild(sProp.Name)
					end
					if type(sProp) == "number" then
						return service24:GetPlayerByUserId(sProp)
					end
				end
			end
			local plotSign = argument452:FindFirstChild("PlotSign")
			local textLabel = plotSign and plotSign:FindFirstChild("SurfaceGui") and plotSign.SurfaceGui:FindFirstChild("Frame") and plotSign.SurfaceGui.Frame:FindFirstChild("TextLabel")
			if not textLabel and plotSign then
				textLabel = plotSign:FindFirstChildWhichIsA("TextLabel", true)
			end
			if textLabel then
				local text = textLabel.Text
				local match = text and text:match("^(.-)'") or text
				if match and match ~= "" then
					for _, player_ in ipairs(service24:GetPlayers()) do
						if player_.DisplayName == match or player_.Name == match then
							return player_
						end
					end
				end
			end
			return nil
		end
		local function handleAction336(argument453)
			local plots = Workspace2:FindFirstChild("Plots")
			if not plots then
				return nil
			end
			local huge = math.huge
			local value464 = nil
			for _, child in ipairs(plots:GetChildren()) do
				local position
				if child:IsA("Model") then
					position = child.PrimaryPart and child.PrimaryPart.Position or child:GetPivot().Position
				else
					position = nil
					if child:IsA("BasePart") then
						position = child.Position
					end
				end
				if position then
					local value465 = math.sqrt((argument453.X - position.X) ^ 2 + (argument453.Z - position.Z) ^ 2)
					if value465 < huge then
						huge = value465
						value464 = child
					end
				end
			end
			if value464 and huge < 70 then
				return value464
			end
			return nil
		end
		local function handleAction337()
			local character = localPlayer31.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			if not character then
				return nil
			end
			local value466 = handleAction336(character.Position)
			if not value466 then
				return nil
			end
			return handleAction335(value466)
		end
		local enabled73 = false
		local function handleAction338(argument454)
			if enabled73 or not argument454 then
				return
			end
			if _G.__4HubIsBlacklisted and _G.__4HubIsBlacklisted(argument454) then
				return
			end
			local 4HubSpamOrder = _G.__4HubSpamOrder or items110
			local 4HubSpamMode = _G.__4HubSpamMode or "Full"
			local items112 = {}
			for _, value467 in ipairs(4HubSpamOrder) do
				if not handleAction328(value467) then
					items112[#items112 + 1] = value467
				end
			end
			if #items112 == 0 then
				return
			end
			enabled73 = true
			task.spawn(function()
				if 4HubSpamMode == "Single" then
					for _, value468 in ipairs(items112) do
						pcall(handleAction334, argument454, value468)
						task.wait(0.12)
					end
				else
					for _, value469 in ipairs(items112) do
						pcall(handleAction334, argument454, value469)
						task.wait(0.045)
					end
				end
				task.wait(0.2)
				enabled73 = false
			end)
		end
		_G.__4HubSpamBaseOwner = function()
			local value470 = handleAction337()
			if value470 and value470 ~= localPlayer31 then
				handleAction338(value470)
			end
		end
	end
	handleAction326()
end
do
	local function handleAction339()
		local Workspace2 = game:GetService("Workspace")
		local entry154 = false
		local obj = setmetatable({}, { __mode = "k" })
		local connection_ = nil
		local number109 = 0
		local connection_2 = nil
		local function handleAction340(argument455)
			if not argument455 then
				return
			end
			pcall(function()
				argument455:AdjustSpeed(0)
			end)
			pcall(function()
				argument455:Stop(0)
			end)
		end
		local function handleAction341(argument456)
			if not argument456 then
				return
			end
			pcall(function()
				for _, value471 in ipairs(argument456:GetPlayingAnimationTracks()) do
					handleAction340(value471)
				end
			end)
			if obj[argument456] then
				return
			end
			local ok, result = pcall(function()
				return argument456.AnimationPlayed:Connect(function(argument457)
					if entry154 then
						handleAction340(argument457)
					end
				end)
			end)
			if ok then
				obj[argument456] = result
			end
		end
		local function handleAction342(argument458)
			if not argument458 then
				return
			end
			for _, descendant in ipairs(argument458:GetDescendants()) do
				if descendant:IsA("Animator") then
					handleAction341(descendant)
				end
			end
		end
		local function handleAction343()
			local plots = Workspace2:FindFirstChild("Plots")
			if plots then
				for _, child in ipairs(plots:GetChildren()) do
					handleAction342(child)
				end
			end
			handleAction342(Workspace2:FindFirstChild("RenderedMovingAnimals"))
			handleAction342(Workspace2:FindFirstChild("Animals"))
			handleAction342(Workspace2:FindFirstChild("RenderedCharacters"))
		end
		_G.__4HubSetNoBrainrotAnims = function(argument459)
			local argument4591 = argument459 and true or false
			if argument4591 == entry154 then
				return
			end
			entry154 = argument4591
			if entry154 then
				number109 += 1
				local number1091 = number109
				pcall(handleAction343)
				if connection_ then
					connection_:Disconnect()
					connection_ = nil
				end
				if connection_2 then
					connection_2:Disconnect()
					connection_2 = nil
				end
				local plots = Workspace2:FindFirstChild("Plots")
				if plots then
					connection_ = plots.DescendantAdded:Connect(function(descendant)
						if not entry154 then
							return
						end
						if descendant:IsA("Animator") then
							task.defer(function()
								if entry154 then
									handleAction341(descendant)
								end
							end)
						end
					end)
				end
				local renderedMovingAnimals = Workspace2:FindFirstChild("RenderedMovingAnimals")
				if renderedMovingAnimals then
					connection_2 = renderedMovingAnimals.DescendantAdded:Connect(function(descendant)
						if not entry154 then
							return
						end
						if descendant:IsA("Animator") then
							task.defer(function()
								if entry154 then
									handleAction341(descendant)
								end
								return
							end)
						end
					end)
				end
				task.spawn(function()
					while entry154 and number1091 == number109 do
						task.wait(1.5)
						if entry154 then
							pcall(handleAction343)
						end
					end
				end)
			else
				number109 += 1
				if connection_ then
					connection_:Disconnect()
					connection_ = nil
				end
				if connection_2 then
					connection_2:Disconnect()
					connection_2 = nil
				end
				for _, connection9 in pairs(obj) do
					pcall(function()
						connection9:Disconnect()
					end)
				end
				obj = setmetatable({}, { __mode = "k" })
			end
		end
	end
	handleAction339()
end
do
	local function handleAction344()
		local Lighting = game:GetService("Lighting")
		local enabled74 = false
		local items113 = nil
		local items114 = {}
		_G.__4HubSetDarkSky = function(argument460)
			local argument4601 = argument460 and true or false
			if argument4601 == enabled74 then
				return
			end
			enabled74 = argument4601
			if enabled74 then
				items113 = {
					ClockTime = Lighting.ClockTime,
					Brightness = Lighting.Brightness,
					Ambient = Lighting.Ambient,
					OutdoorAmbient = Lighting.OutdoorAmbient,
					EnvD = Lighting.EnvironmentDiffuseScale,
					EnvS = Lighting.EnvironmentSpecularScale,
					GS = Lighting.GlobalShadows,
					FE = Lighting.FogEnd,
				}
				pcall(function()
					Lighting.ClockTime = 0
					Lighting.Brightness = 2
					Lighting.Ambient = Color3.fromRGB(200, 200, 205)
					Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
					Lighting.EnvironmentDiffuseScale = 1
					Lighting.EnvironmentSpecularScale = 0
					Lighting.GlobalShadows = false
					Lighting.FogEnd = 1e9
				end)
				items114 = {}
				for _, child in ipairs(Lighting:GetChildren()) do
					if child:IsA("Sky") and child.Name ~= "4HubDarkSky" then
						items114[#items114 + 1] = child
						pcall(function()
							child.Parent = nil
						end)
					end
				end
				local 4HubDarkSky = Lighting:FindFirstChild("4HubDarkSky")
				if not 4HubDarkSky then
					4HubDarkSky = Instance.new("Sky")
					4HubDarkSky.Name = "4HubDarkSky"
				end
				pcall(function()
					4HubDarkSky.CelestialBodiesShown = false
					4HubDarkSky.StarCount = 0
					4HubDarkSky.MoonTextureId = ""
					4HubDarkSky.SunTextureId = ""
					4HubDarkSky.SkyboxBk = ""
					4HubDarkSky.SkyboxFt = ""
					4HubDarkSky.SkyboxLf = ""
					4HubDarkSky.SkyboxRt = ""
					4HubDarkSky.SkyboxUp = ""
					4HubDarkSky.SkyboxDn = ""
				end)
				4HubDarkSky.Parent = Lighting
				if items114.__conn then
					pcall(function()
						items114.__conn:Disconnect()
					end)
				end
				items114.__conn = Lighting.ChildAdded:Connect(function(child)
					if not enabled74 then
						return
					end
					if child:IsA("Sky") and child.Name ~= "4HubDarkSky" then
						items114[#items114 + 1] = child
						task.defer(function()
							pcall(function()
								child.Parent = nil
							end)
						end)
					end
				end)
				pcall(function()
					local terrain = workspace:FindFirstChildOfClass("Terrain")
					terrain = terrain and terrain:FindFirstChildOfClass("Clouds")
					if terrain then
						terrain.Enabled = false
					end
				end)
				local 4HubDarkAtmo = Lighting:FindFirstChild("4HubDarkAtmo")
				if not 4HubDarkAtmo then
					4HubDarkAtmo = Instance.new("Atmosphere")
					4HubDarkAtmo.Name = "4HubDarkAtmo"
				end
				pcall(function()
					4HubDarkAtmo.Density = 0.28
					4HubDarkAtmo.Offset = 0
					4HubDarkAtmo.Color = Color3.new(0, 0, 0)
					4HubDarkAtmo.Decay = Color3.new(0, 0, 0)
					4HubDarkAtmo.Glare = 0
					4HubDarkAtmo.Haze = 0
				end)
				4HubDarkAtmo.Parent = Lighting
			else
				if items114.__conn then
					pcall(function()
						items114.__conn:Disconnect()
					end)
				end
				local 4HubDarkSky = Lighting:FindFirstChild("4HubDarkSky")
				if 4HubDarkSky then
					4HubDarkSky:Destroy()
				end
				local 4HubDarkAtmo = Lighting:FindFirstChild("4HubDarkAtmo")
				if 4HubDarkAtmo then
					4HubDarkAtmo:Destroy()
				end
				for _, value472 in ipairs(items114) do
					pcall(function()
						value472.Parent = Lighting
					end)
				end
				items114 = {}
				pcall(function()
					local terrain = workspace:FindFirstChildOfClass("Terrain")
					terrain = terrain and terrain:FindFirstChildOfClass("Clouds")
					if terrain then
						terrain.Enabled = true
					end
				end)
				if items113 then
					pcall(function()
						Lighting.ClockTime = items113.ClockTime
						Lighting.Brightness = items113.Brightness
						Lighting.Ambient = items113.Ambient
						Lighting.OutdoorAmbient = items113.OutdoorAmbient
						Lighting.EnvironmentDiffuseScale = items113.EnvD
						Lighting.EnvironmentSpecularScale = items113.EnvS
						Lighting.GlobalShadows = items113.GS
						Lighting.FogEnd = items113.FE
					end)
				end
			end
		end
	end
	handleAction344()
end
do
	local function handleAction345()
		local localPlayer32 = game:GetService("Players").LocalPlayer
		_G.__4HubSetAutoInvis = function(argument461)
			_G.__4HubAutoInvis = argument461 and true or false
		end
		local enabled75 = false
		local function handleAction346()
			if not _G.__4HubAutoInvis then
				return
			end
			if localPlayer32:GetAttribute("Stealing") == true then
				if not _G.invisibleStealEnabled then
					enabled75 = true
					if _G.toggleInvisibleSteal then
						pcall(_G.toggleInvisibleSteal)
					end
				end
			else
				if enabled75 and _G.invisibleStealEnabled then
					if _G.toggleInvisibleSteal then
						pcall(_G.toggleInvisibleSteal)
					end
				end
				enabled75 = false
			end
		end
		pcall(function()
			localPlayer32:GetAttributeChangedSignal("Stealing"):Connect(handleAction346)
		end)
		task.spawn(function()
			while true do
				handleAction346()
				task.wait(0.15)
			end
		end)
		local number110 = 0
		local function handleAction347()
			if tick() - number110 < 2.5 then
				return
			end
			number110 = tick()
			if _G.__4HubReset then
				_G.__4HubReset()
			end
		end
		local function handleAction348(argument462)
			local 4HubAutoResetBalloon = _G.__4HubAutoResetBalloon
			local pos
			if 4HubAutoResetBalloon then
				pos = tostring(argument462):lower():find("balloon", 1, true)
			else
				pos = 4HubAutoResetBalloon
			end
			return pos
		end
		local function handleAction349(argument463)
			local 4HubAutoResetMorph = _G.__4HubAutoResetMorph
			local pos
			if 4HubAutoResetMorph then
				pos = tostring(argument463):lower():find("morph", 1, true)
			else
				pos = 4HubAutoResetMorph
			end
			return pos
		end
		local function handleAction350(argument464)
			if handleAction348(argument464) or handleAction349(argument464) then
				handleAction347()
			end
		end
		local function handleAction351(argument465, argument466)
			local attribute = argument465:GetAttribute(argument466)
			if attribute == nil or attribute == false then
				return
			end
			handleAction350(argument466)
		end
		local function handleAction352(argument467)
			pcall(function()
				argument467.AttributeChanged:Connect(function(attribute)
					handleAction351(argument467, attribute)
				end)
			end)
			pcall(function()
				for k in pairs(argument467:GetAttributes()) do
					handleAction351(argument467, k)
				end
			end)
		end
		local function handleAction353(character)
			handleAction352(character)
			pcall(function()
				character.DescendantAdded:Connect(function(descendant)
					handleAction350(descendant.Name)
				end)
			end)
		end
		handleAction352(localPlayer32)
		if localPlayer32.Character then
			handleAction353(localPlayer32.Character)
		end
		localPlayer32.CharacterAdded:Connect(handleAction353)
		task.spawn(function()
			while true do
				if _G.__4HubAutoResetBalloon or _G.__4HubAutoResetMorph then
					pcall(function()
						for k, value473 in pairs(localPlayer32:GetAttributes()) do
							if value473 and value473 ~= false then
								handleAction350(k)
							end
						end
						local character = localPlayer32.Character
						if character then
							for k, matchesCondition13 in pairs(character:GetAttributes()) do
								matchesCondition13 = matchesCondition13 and matchesCondition13 ~= false
								if matchesCondition13 then
									handleAction350(k)
								end
							end
							for _, child in ipairs(character:GetChildren()) do
								handleAction350(child.Name)
							end
						end
					end)
				end
				task.wait(0.25)
			end
		end)
		local function handleAction354()
			local character = localPlayer32.Character
			local upperTorso
			if character then
				upperTorso = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso")
			else
				upperTorso = character
			end
			return upperTorso
		end
		local function handleAction355(argument468)
			local value474 = handleAction354()
			if not value474 then
				return
			end
			local value475 = game:GetService("Workspace"):FindFirstChild("Plots")
			if not value475 then
				return
			end
			local number111 = 40
			local value476 = nil
			for _, child in pairs(value475:GetChildren()) do
				local position
				if child:IsA("Model") then
					position = child.PrimaryPart and child.PrimaryPart.Position or child:GetPivot().Position
				else
					position = child.Position
				end
				local magnitude = (value474.Position - position).Magnitude
				if magnitude < number111 then
					number111 = magnitude
					value476 = child
				end
			end
			if value476 and value476:FindFirstChild("Unlock") then
				local items115 = {}
				for _, child in pairs(value476.Unlock:GetChildren()) do
					table.insert(items115, { Obj = child, Y = (child:IsA("Model") and child:GetPivot().Position or child.Position).Y })
				end
				table.sort(items115, function(argument469, argument470)
					return argument469.Y < argument470.Y
				end)
				if items115[argument468] then
					for _, descendant in pairs(items115[argument468].Obj:GetDescendants()) do
						if descendant:IsA("ProximityPrompt") then
							pcall(function()
								fireproximityprompt(descendant)
							end)
						end
					end
				end
			end
		end
		local function handleAction356()
			local value477 = handleAction354()
			if not value477 then
				return 1
			end
			return value477.Position.Y < 12 and 1 or 2
		end
		local function handleAction357()
			if not _G.__4HubAutoUnlock then
				return
			end
			local entry155 = true
			if localPlayer32:GetAttribute("Stealing") ~= entry155 then
				return
			end
			if not handleAction354() then
				return
			end
			task.spawn(function()
				task.wait(0.1)
				pcall(handleAction355, handleAction356())
			end)
		end
		pcall(function()
			localPlayer32:GetAttributeChangedSignal("Stealing"):Connect(handleAction357)
		end)
		handleAction357()
	end
	handleAction345()
end
task.spawn(function()
	local players25 = game:GetService("Players")
	game:GetService("RunService")
	local service25 = game:GetService("Workspace")
	local TweenService2 = game:GetService("TweenService")
	game:GetService("UserInputService")
	local ReplicatedStorage_ = game:GetService("ReplicatedStorage")
	local localPlayer33 = players25.LocalPlayer
	local playerGui_ = localPlayer33:WaitForChild("PlayerGui")
	local items116 = {}
	pcall(function()
		local Animals = require(ReplicatedStorage_:WaitForChild("Datas"):WaitForChild("Animals"))
		for k, Animal in pairs(Animals) do
			local displayName = type(Animal) == "table" and Animal.DisplayName or tostring(k)
			items116[tostring(k):lower()] = displayName
			items116[tostring(displayName):lower()] = displayName
		end
	end)
	local options96 = {
		Black = Color3.fromRGB(6, 8, 14),
		BgDark = Color3.fromRGB(9, 13, 24),
		BgPanel = Color3.fromRGB(13, 20, 38),
		Stroke = Color3.fromRGB(30, 46, 82),
		DarkBlue = Color3.fromRGB(18, 38, 78),
		LightBlue = Color3.fromRGB(92, 165, 255),
		BlueLine = Color3.fromRGB(60, 120, 220),
		White = Color3.fromRGB(255, 255, 255),
		TextDim = Color3.fromRGB(150, 165, 195),
		Red = Color3.fromRGB(235, 80, 90),
	}
	local gothamMedium2 = Enum.Font.GothamMedium
	local gothamBold2 = Enum.Font.GothamBold
	local function createUICorner2(parent, argument471)
		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(0, argument471 or 8)
		uiCorner.Parent = parent
		return uiCorner
	end
	local function handleAction358(parent, color, thickness, transparency)
		local instance4 = Instance.new("UIStroke")
		instance4.Color = color or options96.Stroke
		instance4.Thickness = thickness or 1
		instance4.Transparency = transparency or 0
		instance4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		instance4.Parent = parent
		return instance4
	end
	local items117 = {
		{ emoji = "🎈", cmd = "balloon" },
		{ emoji = "🔒", cmd = "jail" },
		{ emoji = "🚀", cmd = "rocket" },
		{ emoji = "🤸", cmd = "ragdoll" },
		{ emoji = "↩️", cmd = "inverse" },
	}
	local items118 = { "balloon", "inverse", "jail", "jumpscare", "morph", "ragdoll", "rocket", "tiny" }
	local options97 = {
		balloon = 30,
		jail = 60,
		ragdoll = 30,
		rocket = 120,
		inverse = 60,
		jumpscare = 30,
		tiny = 30,
		morph = 30,
	}
	local items119 = {}
	local function handleAction359(argument472)
		local adminPanel = playerGui_:FindFirstChild("AdminPanel")
		if not adminPanel then
			return nil
		end
		local ok, result = pcall(function()
			return adminPanel.AdminPanel.Content.ScrollingFrame
		end)
		if not ok or not result then
			return nil
		end
		local value478 = result:FindFirstChild(argument472)
		if not value478 then
			return nil
		end
		local timer = value478:FindFirstChild("Timer")
		if not timer or not timer.Visible then
			return 0
		end
		return tonumber(timer.Text:match("%d+")) or 0
	end
	local function handleAction360(argument473)
		local value479 = handleAction359(argument473)
		if value479 ~= nil then
			return value479 > 0
		end
		local entry156 = items119[argument473]
		local entry157 = options97[argument473] or 0
		return entry156 and entry157 > 0 and tick() - entry156 < entry157
	end
	local function handleAction361(argument474)
		items119[argument474] = tick()
	end
	local function handleAction362(argument475)
		if argument475 then
			local enabled76 = false
			local function handleAction363(argument476)
				if enabled76 or not argument476 or not getconnections then
					return
				end
				local ok, result = pcall(getconnections, argument476)
				if ok and result then
					for _, value480 in ipairs(result) do
						if value480.Fire then
							pcall(function()
								value480:Fire()
							end)
							enabled76 = true
						elseif value480.Function then
							pcall(value480.Function)
							enabled76 = true
						end
					end
				end
			end
			pcall(function()
				handleAction363(argument475.Activated)
			end)
			local enabled77 = not enabled76
			if enabled77 then
				pcall(function()
					handleAction363(argument475.MouseButton1Click)
				end)
			end
			if enabled77 and typeof(firesignal) == "function" then
				pcall(firesignal, argument475.MouseButton1Click)
				enabled76 = true
			end
			return enabled76
		end
		return false
	end
	local function handleAction364(argument477, argument478)
		local value481 = argument477:FindFirstChild(argument478)
		if value481 then
			return value481
		end
		for _, descendant in ipairs(argument477:GetDescendants()) do
			if descendant.Name == argument478 and descendant:IsA("GuiButton") then
				return descendant
			end
		end
		return nil
	end
	local function handleAction365(argument479, argument480)
		local value482 = argument479:FindFirstChild(argument480.Name)
		if value482 and value482:IsA("GuiButton") then
			return value482
		end
		for _, descendant in ipairs(argument479:GetDescendants()) do
			if descendant:IsA("GuiButton") then
				if descendant.Name == argument480.Name then
					return descendant
				end
				local textLabel = descendant:FindFirstChildWhichIsA("TextLabel")
				if textLabel and (textLabel.Text == argument480.Name or textLabel.Text == argument480.DisplayName) then
					return descendant
				end
			end
		end
		return nil
	end
	local function handleAction366(argument481, argument482)
		if not argument481 or not argument482 then
			return false
		end
		if _G.__4HubIsBlacklisted and _G.__4HubIsBlacklisted(argument481) then
			return false
		end
		local adminPanel = playerGui_:FindFirstChild("AdminPanel") or playerGui_:WaitForChild("AdminPanel", 3)
		if not adminPanel then
			return false
		end
		local value = select(2, pcall(function()
			return adminPanel.AdminPanel.Content.ScrollingFrame
		end))
		local value483 = value and handleAction364(value, argument482) or handleAction364(adminPanel, argument482)
		if not value483 then
			return false
		end
		if not handleAction362(value483) then
			return false
		end
		task.wait(0.02)
		local value2 = select(2, pcall(function()
			return adminPanel.AdminPanel.Profiles.ScrollingFrame
		end))
		local value484 = value2 and handleAction365(value2, argument481)
		if not value484 then
			task.wait(0.03)
			value484 = value2 and handleAction365(value2, argument481)
		end
		value484 = value484 or handleAction365(adminPanel, argument481)
		if not value484 then
			return false
		end
		handleAction362(value484)
		handleAction361(argument482)
		if _G.__4HubNotify then
			_G.__4HubNotify(tostring(argument482):gsub("^%l", string.upper), "on " .. (argument481.DisplayName or argument481.Name))
		end
		return true
	end
	local items120 = {}
	local function handleAction367(argument483)
		if not argument483 or items120[argument483] then
			return
		end
		local items121 = {}
		for _, value485 in ipairs(items118) do
			if not handleAction360(value485) then
				items121[#items121 + 1] = value485
			end
		end
		if #items121 == 0 then
			return
		end
		items120[argument483] = true
		task.spawn(function()
			for i, value486 in ipairs(items121) do
				task.spawn(function()
					task.wait((i - 1) * 0.01)
					pcall(handleAction366, argument483, value486)
				end)
			end
			task.wait(0.25)
			items120[argument483] = nil
		end)
	end
	local function handleAction368(argument484)
		if not argument484 then
			return nil
		end
		if _G.XenSyncGet then
			local sProp = nil
			pcall(function()
				local value487 = _G.XenSyncGet(argument484.Name)
				if value487 then
					sProp = _G.sProp and _G.sProp(value487, "Owner") or value487:Get("Owner")
				end
			end)
			if sProp then
				if typeof(sProp) == "Instance" and sProp:IsA("Player") then
					return sProp
				end
				if type(sProp) == "table" and sProp.Name then
					return players25:FindFirstChild(sProp.Name)
				end
				if type(sProp) == "number" then
					return players25:GetPlayerByUserId(sProp)
				end
			end
		end
		local plotSign = argument484:FindFirstChild("PlotSign")
		local textLabel = plotSign and plotSign:FindFirstChild("SurfaceGui") and plotSign.SurfaceGui:FindFirstChild("Frame") and plotSign.SurfaceGui.Frame:FindFirstChild("TextLabel")
		if not textLabel and plotSign then
			textLabel = plotSign:FindFirstChildWhichIsA("TextLabel", true)
		end
		if textLabel then
			local match = textLabel.Text and textLabel.Text:match("^(.-)'") or textLabel.Text
			if match and match ~= "" then
				for _, player_ in ipairs(players25:GetPlayers()) do
					if player_.DisplayName == match or player_.Name == match then
						return player_
					end
				end
			end
		end
		return nil
	end
	local function handleAction369(argument485)
		local plots = service25:FindFirstChild("Plots")
		if not plots then
			return nil
		end
		local huge = math.huge
		local value488 = nil
		for _, child in ipairs(plots:GetChildren()) do
			local position
			if child:IsA("Model") then
				position = child.PrimaryPart and child.PrimaryPart.Position or child:GetPivot().Position
			else
				position = nil
				if child:IsA("BasePart") then
					position = child.Position
				end
			end
			if position then
				local value489 = math.sqrt((argument485.X - position.X) ^ 2 + (argument485.Z - position.Z) ^ 2)
				if value489 < huge then
					huge = value489
					value488 = child
				end
			end
		end
		if value488 and huge < 72 then
			return value488
		end
		return nil
	end
	local function handleAction370()
		local character = localPlayer33.Character
		character = character and character:FindFirstChild("HumanoidRootPart")
		if not character then
			return nil
		end
		local value490 = handleAction369(character.Position)
		if not value490 then
			return nil
		end
		return handleAction368(value490)
	end
	local function handleAction371(argument486)
		local entry158 = true
		if argument486:GetAttribute("Stealing") ~= entry158 then
			return nil
		end
		local attribute = argument486:GetAttribute("StealingIndex")
		if attribute ~= nil and tostring(attribute) ~= "" then
			return items116[tostring(attribute):lower()] or tostring(attribute)
		end
		local character = argument486.Character
		if character then
			for _, descendant in ipairs(character:GetDescendants()) do
				if (descendant:IsA("Model") or descendant:IsA("MeshPart")) and items116[descendant.Name:lower()] then
					return items116[descendant.Name:lower()]
				end
			end
		end
		return "Brainrot"
	end
	local adminPlayerListUI = playerGui_:FindFirstChild("AdminPlayerListUI")
	if adminPlayerListUI then
		adminPlayerListUI:Destroy()
	end
	local screenGui2 = Instance.new("ScreenGui")
	screenGui2.Name = "AdminPlayerListUI"
	screenGui2.ResetOnSpawn = false
	screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui2.IgnoreGuiInset = true
	screenGui2.Parent = playerGui_
	_G.setAdminPanelHidden = function(argument487)
		if screenGui2 then
			screenGui2.Enabled = not argument487
		end
	end
	if _G.__4HubAdminHidden then
		screenGui2.Enabled = false
	end
	local udim22 = UDim2.new(0, 12, 0, 60)
	local frame5 = Instance.new("Frame")
	frame5.AnchorPoint = Vector2.new(0, 0)
	frame5.Position = udim22
	frame5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	frame5.BackgroundTransparency = 0
	frame5.BorderSizePixel = 0
	frame5.ClipsDescendants = true
	frame5.Parent = screenGui2
	createUICorner2(frame5, 12)
	local instance4 = Instance.new("UIGradient")
	instance4.Rotation = 90
	instance4.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
	instance4.Parent = frame5
	local instance5 = Instance.new("UIStroke")
	instance5.Thickness = 2.5
	instance5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	instance5.Parent = frame5
	local uiGradient = Instance.new("UIGradient")
	local colorSequence = ColorSequence.new
	local items122 = {}
	local value491 = ColorSequenceKeypoint.new(0, options96.DarkBlue)
	local new = ColorSequenceKeypoint.new
	local entry159 = 1
	local darkBlue = options96.DarkBlue
	local value492 = ColorSequenceKeypoint.new(0.5, options96.LightBlue)
	items122[1] = value491
	items122[2] = value492
	do
		local values = table.pack(new(entry159, darkBlue))
		table.move(values, 1, values.n, 3, items122)
	end
	uiGradient.Color = colorSequence(items122)
	uiGradient.Parent = instance5
	_G.__4HubSpin(uiGradient, 90)
	local frame6 = Instance.new("Frame")
	frame6.Size = UDim2.new(1, 0, 0, 44)
	frame6.BackgroundTransparency = 1
	frame6.Active = true
	frame6.Parent = frame5
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 0, 44)
	textLabel.BackgroundTransparency = 1
	textLabel.Font = gothamBold2
	textLabel.Text = "Admin Panel"
	textLabel.TextColor3 = options96.White
	textLabel.TextSize = 16
	textLabel.TextXAlignment = Enum.TextXAlignment.Center
	textLabel.Parent = frame6
	local instance6 = Instance.new("Frame")
	instance6.Size = UDim2.new(1, -28, 0, 2)
	instance6.Position = UDim2.new(0, 14, 0, 42)
	instance6.BackgroundColor3 = options96.BlueLine
	instance6.BorderSizePixel = 0
	instance6.Parent = frame5
	createUICorner2(instance6, 1)
	local uiGradient2 = Instance.new("UIGradient")
	local colorSequence2 = ColorSequence.new
	local items123 = {}
	local value493 = ColorSequenceKeypoint.new(0, options96.DarkBlue)
	local value494 = ColorSequenceKeypoint.new(0.5, options96.LightBlue)
	local new2 = ColorSequenceKeypoint.new
	local darkBlue2 = options96.DarkBlue
	items123[1] = value493
	items123[2] = value494
	do
		local values = table.pack(new2(1, darkBlue2))
		table.move(values, 1, values.n, 3, items123)
	end
	uiGradient2.Color = colorSequence2(items123)
	uiGradient2.Parent = instance6
	local scrollingFrame = Instance.new("ScrollingFrame")
	scrollingFrame.Position = UDim2.fromOffset(0, 50)
	scrollingFrame.Size = UDim2.new(1, 0, 1, -50)
	scrollingFrame.BackgroundTransparency = 1
	scrollingFrame.BorderSizePixel = 0
	scrollingFrame.ScrollBarThickness = 4
	scrollingFrame.ScrollBarImageColor3 = options96.LightBlue
	scrollingFrame.ScrollBarImageTransparency = 0.3
	scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scrollingFrame.Active = true
	scrollingFrame.Parent = frame5
	local uiPadding = Instance.new("UIPadding")
	uiPadding.PaddingLeft = UDim.new(0, 10)
	uiPadding.PaddingRight = UDim.new(0, 10)
	uiPadding.PaddingBottom = UDim.new(0, 8)
	uiPadding.Parent = scrollingFrame
	local uiListLayout = Instance.new("UIListLayout")
	uiListLayout.Padding = UDim.new(0, 6)
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.Parent = scrollingFrame
	local textLabel2 = Instance.new("TextLabel")
	textLabel2.Size = UDim2.new(1, 0, 0, 30)
	textLabel2.BackgroundTransparency = 1
	textLabel2.Font = gothamMedium2
	textLabel2.Text = "No other players"
	textLabel2.TextColor3 = options96.TextDim
	textLabel2.TextSize = 12
	textLabel2.LayoutOrder = 9999
	textLabel2.Visible = false
	textLabel2.Parent = scrollingFrame
	local items124 = {}
	local items125 = {}
	local function handleAction372(argument488, layoutOrder)
		local frame7 = Instance.new("Frame")
		frame7.Name = argument488.Name
		frame7.Size = UDim2.new(1, 0, 0, 56)
		frame7.BackgroundColor3 = options96.BgPanel
		frame7.BackgroundTransparency = 0.2
		frame7.BorderSizePixel = 0
		frame7.LayoutOrder = layoutOrder
		frame7.Parent = scrollingFrame
		createUICorner2(frame7, 10)
		local value495 = handleAction358(frame7, options96.Stroke, 1)
		local imageLabel = Instance.new("ImageLabel")
		imageLabel.AnchorPoint = Vector2.new(0, 0.5)
		imageLabel.Position = UDim2.new(0, 12, 0.5, 0)
		imageLabel.Size = UDim2.fromOffset(42, 42)
		imageLabel.BackgroundColor3 = options96.BgDark
		imageLabel.BorderSizePixel = 0
		imageLabel.Image = string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=48&h=48", argument488.UserId)
		imageLabel.Parent = frame7
		createUICorner2(imageLabel, 21)
		handleAction358(imageLabel, options96.LightBlue, 1.4)
		local textLabel3 = Instance.new("TextLabel")
		textLabel3.Position = UDim2.fromOffset(66, 7)
		textLabel3.Size = UDim2.new(1, -226, 0, 16)
		textLabel3.BackgroundTransparency = 1
		textLabel3.Font = gothamBold2
		textLabel3.Text = argument488.DisplayName
		textLabel3.TextColor3 = options96.White
		textLabel3.TextSize = 15
		textLabel3.TextXAlignment = Enum.TextXAlignment.Left
		textLabel3.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel3.Parent = frame7
		local textLabel4 = Instance.new("TextLabel")
		textLabel4.Position = UDim2.fromOffset(66, 24)
		textLabel4.Size = UDim2.new(1, -226, 0, 13)
		textLabel4.BackgroundTransparency = 1
		textLabel4.Font = gothamMedium2
		textLabel4.Text = "@" .. argument488.Name
		textLabel4.TextColor3 = options96.TextDim
		textLabel4.TextSize = 12
		textLabel4.TextXAlignment = Enum.TextXAlignment.Left
		textLabel4.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel4.Parent = frame7
		local textLabel5 = Instance.new("TextLabel")
		textLabel5.Position = UDim2.fromOffset(68, 39)
		textLabel5.Size = UDim2.new(1, -226, 0, 13)
		textLabel5.BackgroundTransparency = 1
		textLabel5.Font = gothamBold2
		textLabel5.Text = ""
		textLabel5.TextColor3 = options96.LightBlue
		textLabel5.TextSize = 11
		textLabel5.TextXAlignment = Enum.TextXAlignment.Left
		textLabel5.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel5.Parent = frame7
		local instance7 = Instance.new("TextButton")
		instance7.BackgroundTransparency = 1
		instance7.Text = ""
		instance7.ZIndex = 2
		instance7.Position = UDim2.new(0, 0, 0, 0)
		instance7.Size = UDim2.new(1, -184, 1, 0)
		instance7.Parent = frame7
		instance7.MouseEnter:Connect(function()
			local options98 = { Color = options96.LightBlue }
			TweenService2:Create(value495, TweenInfo.new(0.12), options98):Play()
		end)
		instance7.MouseLeave:Connect(function()
			local options99 = { Color = options96.Stroke }
			TweenService2:Create(value495, TweenInfo.new(0.12), options99):Play()
		end)
		instance7.MouseButton1Click:Connect(function()
			local options100 = { Color = options96.LightBlue, Thickness = 2 }
			TweenService2:Create(value495, TweenInfo.new(0.08), options100):Play()
			task.delay(0.15, function()
				if value495 then
					local options101 = { Thickness = 1 }
					TweenService2:Create(value495, TweenInfo.new(0.2), options101):Play()
				end
			end)
			task.spawn(function()
				handleAction367(argument488)
			end)
		end)
		local instance8 = Instance.new("Frame")
		instance8.AnchorPoint = Vector2.new(1, 0.5)
		instance8.Position = UDim2.new(1, -10, 0.5, 0)
		instance8.Size = UDim2.fromOffset(160, 28)
		instance8.BackgroundTransparency = 1
		instance8.ZIndex = 4
		instance8.Parent = frame7
		local uiListLayout2 = Instance.new("UIListLayout")
		uiListLayout2.FillDirection = Enum.FillDirection.Horizontal
		uiListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Right
		uiListLayout2.VerticalAlignment = Enum.VerticalAlignment.Center
		uiListLayout2.Padding = UDim.new(0, 6)
		uiListLayout2.Parent = instance8
		for i, value496 in ipairs(items117) do
			local textButton3 = Instance.new("TextButton")
			textButton3.Size = UDim2.fromOffset(26, 26)
			textButton3.LayoutOrder = i
			textButton3.BackgroundColor3 = options96.BgDark
			textButton3.AutoButtonColor = false
			textButton3.ZIndex = 4
			textButton3.Text = value496.emoji
			textButton3.TextSize = 15
			textButton3.Font = gothamBold2
			textButton3.TextColor3 = options96.White
			textButton3.Parent = instance8
			createUICorner2(textButton3, 6)
			local value497 = handleAction358(textButton3, options96.Stroke, 1)
			local options102 = { btn = textButton3, stroke = value497, cmd = value496.cmd, red = false }
			items125[#items125 + 1] = options102
			textButton3.MouseEnter:Connect(function()
				if options102.red then
					return
				end
				local options103 = { Color = options96.LightBlue }
				TweenService2:Create(value497, TweenInfo.new(0.12), options103):Play()
				local options104 = { BackgroundColor3 = options96.DarkBlue }
				TweenService2:Create(textButton3, TweenInfo.new(0.12), options104):Play()
			end)
			textButton3.MouseLeave:Connect(function()
				if options102.red then
					return
				end
				local options105 = { Color = options96.Stroke }
				TweenService2:Create(value497, TweenInfo.new(0.12), options105):Play()
				local options106 = { BackgroundColor3 = options96.BgDark }
				TweenService2:Create(textButton3, TweenInfo.new(0.12), options106):Play()
			end)
			textButton3.MouseButton1Click:Connect(function()
				if handleAction360(value496.cmd) then
					return
				end
				handleAction361(value496.cmd)
				task.spawn(function()
					pcall(handleAction366, argument488, value496.cmd)
				end)
			end)
		end
		items124[argument488] = { status = textLabel5, row = frame7, rs = value495 }
	end
	local function handleAction373(argument489)
		local number112 = math.min(math.max(argument489, 1), 8)
		local number113 = number112 * 56 + (number112 - 1) * 6 + 8
		if argument489 == 0 then
			number113 = 40
		end
		local number114 = 28 + number113
		TweenService2:Create(frame5, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(404, number114) }):Play()
	end
	local function handleAction374()
		for _, child in ipairs(scrollingFrame:GetChildren()) do
			if child:IsA("Frame") then
				child:Destroy()
			end
		end
		items124 = {}
		items125 = {}
		local number115 = 0
		for _, player_ in ipairs(players25:GetPlayers()) do
			if player_ ~= localPlayer33 then
				number115 += 1
				handleAction372(player_, number115)
			end
		end
		textLabel2.Visible = number115 == 0
		handleAction373(number115)
	end
	task.spawn(function()
		while screenGui2.Parent do
			local value498 = handleAction370()
			for k, value499 in pairs(items124) do
				if k.Parent and value499.status then
					local 4HubIsBlacklisted = _G.__4HubIsBlacklisted and _G.__4HubIsBlacklisted(k)
					if value499.row then
						value499.row.BackgroundColor3 = 4HubIsBlacklisted and Color3.fromRGB(60, 14, 18) or options96.BgPanel
					end
					if value499.rs then
						value499.rs.Color = 4HubIsBlacklisted and options96.Red or options96.Stroke
					end
					if 4HubIsBlacklisted then
						value499.status.Text = "BLACKLISTED"
						value499.status.TextColor3 = options96.Red
					else
						local value500 = handleAction371(k)
						if value500 then
							value499.status.Text = "Stealing - " .. value500
							value499.status.TextColor3 = options96.Red
						elseif value498 == k then
							value499.status.Text = "Base Owner"
							value499.status.TextColor3 = options96.LightBlue
						else
							value499.status.Text = ""
						end
					end
				end
			end
			task.wait(0.4)
		end
	end)
	local color = Color3.fromRGB(220, 55, 65)
	task.spawn(function()
		while screenGui2.Parent do
			for _, value501 in ipairs(items125) do
				if value501.btn and value501.btn.Parent then
					local value502 = handleAction360(value501.cmd)
					if value502 ~= value501.red then
						value501.red = value502
						if value502 then
							local options107 = { BackgroundColor3 = color }
							TweenService2:Create(value501.btn, TweenInfo.new(0.2), options107):Play()
							local options108 = { Color = color, Transparency = 0 }
							TweenService2:Create(value501.stroke, TweenInfo.new(0.2), options108):Play()
						else
							local options109 = { BackgroundColor3 = options96.BgDark }
							TweenService2:Create(value501.btn, TweenInfo.new(0.35), options109):Play()
							local options110 = { Color = options96.Stroke, Transparency = 0 }
							TweenService2:Create(value501.stroke, TweenInfo.new(0.35), options110):Play()
						end
					end
				end
			end
			task.wait(0.15)
		end
	end)
	players25.PlayerAdded:Connect(function()
		task.wait(0.3)
		handleAction374()
	end)
	players25.PlayerRemoving:Connect(function()
		task.wait(0.3)
		handleAction374()
	end)
	if _G.__4HubRegisterDrag then
		_G.__4HubRegisterDrag(frame5, frame6, "AdminPanelWin", udim22)
	end
	local number116 = 0
	for _, player_ in ipairs(players25:GetPlayers()) do
		if player_ ~= localPlayer33 then
			number116 += 1
		end
	end
	local number117 = math.min(math.max(number116, 1), 8)
	local entry160 = 28
	local matchesCondition14 = number116 == 0 and 40 or number117 * 56 + (number117 - 1) * 6 + 8
	frame5.Size = UDim2.fromOffset(0, 0)
	instance5.Transparency = 1
	TweenService2:Create(frame5, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(404, entry160 + matchesCondition14) }):Play()
	TweenService2:Create(instance5, TweenInfo.new(0.4), { Transparency = 0 }):Play()
	task.wait(0.35)
	handleAction374()
end)
do
	local function handleAction375()
		local service26 = game:GetService("Players")
		local service27 = game:GetService("Workspace")
		local TweenService2 = game:GetService("TweenService")
		local localPlayer34 = service26.LocalPlayer
		local playerGui_ = localPlayer34:WaitForChild("PlayerGui")
		local options111 = {
			Black = Color3.fromRGB(6, 8, 14),
			BgDark = Color3.fromRGB(9, 13, 24),
			Stroke = Color3.fromRGB(30, 46, 82),
			DarkBlue = Color3.fromRGB(18, 38, 78),
			LightBlue = Color3.fromRGB(92, 165, 255),
			White = Color3.fromRGB(240, 248, 255),
			Dim = Color3.fromRGB(150, 165, 195),
			Green = Color3.fromRGB(80, 225, 130),
		}
		local gothamMedium2 = Enum.Font.GothamMedium
		local gothamBold2 = Enum.Font.GothamBold
		local function handleAction376(parent, argument490)
			local instance4 = Instance.new("UICorner")
			instance4.CornerRadius = UDim.new(0, argument490 or 8)
			instance4.Parent = parent
			return instance4
		end
		local sound = Instance.new("Sound")
		sound.Name = "RiftBrainrotAlert"
		sound.Volume = 1
		sound.Parent = playerGui_
		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "RiftBrainrotNotif"
		screenGui2.ResetOnSpawn = false
		screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui2.IgnoreGuiInset = true
		screenGui2.DisplayOrder = 90
		screenGui2.Parent = playerGui_
		local number118 = -88 - 20
		local frame5 = Instance.new("Frame")
		frame5.AnchorPoint = Vector2.new(0.5, 0)
		frame5.Size = UDim2.fromOffset(250, 88)
		frame5.Position = UDim2.new(0.5, 0, 0, number118)
		frame5.BackgroundColor3 = options111.BgDark
		frame5.BorderSizePixel = 0
		frame5.Parent = screenGui2
		handleAction376(frame5, 12)
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Rotation = 90
		local new = ColorSequenceKeypoint.new
		local entry161 = 1
		local bgDark = options111.BgDark
		uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, options111.Black), new(entry161, bgDark) })
		uiGradient.Parent = frame5
		local uiStroke2 = Instance.new("UIStroke")
		uiStroke2.Thickness = 2.2
		uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke2.Parent = frame5
		local instance4 = Instance.new("UIGradient")
		local colorSequence = ColorSequence.new
		local items126 = {}
		local value503 = ColorSequenceKeypoint.new(0, options111.DarkBlue)
		local value504 = ColorSequenceKeypoint.new(0.5, options111.LightBlue)
		local new2 = ColorSequenceKeypoint.new
		local darkBlue = options111.DarkBlue
		items126[1] = value503
		items126[2] = value504
		do
			local values = table.pack(new2(1, darkBlue))
			table.move(values, 1, values.n, 3, items126)
		end
		instance4.Color = colorSequence(items126)
		instance4.Parent = uiStroke2
		_G.__4HubSpin(instance4, 90)
		local frame6 = Instance.new("Frame")
		frame6.Size = UDim2.new(0, 4, 0.6, 0)
		frame6.Position = UDim2.new(0, 10, 0.2, 0)
		frame6.BackgroundColor3 = options111.LightBlue
		frame6.BorderSizePixel = 0
		frame6.Parent = frame5
		handleAction376(frame6, 2)
		local instance5 = Instance.new("TextLabel")
		instance5.BackgroundTransparency = 1
		instance5.Position = UDim2.fromOffset(22, 9)
		instance5.AutomaticSize = Enum.AutomaticSize.X
		instance5.Size = UDim2.new(0, 0, 0, 16)
		instance5.Font = gothamBold2
		instance5.Text = "Normal"
		instance5.TextColor3 = options111.Dim
		instance5.TextSize = 14
		instance5.TextXAlignment = Enum.TextXAlignment.Left
		instance5.Parent = frame5
		local frame7 = Instance.new("Frame")
		frame7.BackgroundTransparency = 1
		frame7.ClipsDescendants = true
		frame7.Position = UDim2.fromOffset(76, 10)
		frame7.Size = UDim2.new(1, -96, 0, 14)
		frame7.Parent = frame5
		local textLabel = Instance.new("TextLabel")
		textLabel.BackgroundTransparency = 1
		textLabel.Position = UDim2.fromOffset(22, 32)
		textLabel.Size = UDim2.new(1, -34, 0, 22)
		textLabel.Font = gothamBold2
		textLabel.Text = "Brainrot"
		textLabel.TextColor3 = options111.White
		textLabel.TextSize = 15
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel.Parent = frame5
		local instance6 = Instance.new("TextLabel")
		instance6.BackgroundTransparency = 1
		instance6.Position = UDim2.fromOffset(22, 58)
		instance6.Size = UDim2.new(1, -90, 0, 16)
		instance6.Font = gothamMedium2
		instance6.Text = ""
		instance6.TextColor3 = options111.Dim
		instance6.TextSize = 13
		instance6.TextXAlignment = Enum.TextXAlignment.Left
		instance6.TextTruncate = Enum.TextTruncate.AtEnd
		instance6.Parent = frame5
		local instance7 = Instance.new("TextLabel")
		instance7.BackgroundTransparency = 1
		instance7.AnchorPoint = Vector2.new(1, 1)
		instance7.Position = UDim2.new(1, -14, 1, -10)
		instance7.Size = UDim2.new(0.6, 0, 0, 20)
		instance7.Font = gothamBold2
		instance7.Text = ""
		instance7.TextColor3 = options111.Green
		instance7.TextSize = 16
		instance7.TextXAlignment = Enum.TextXAlignment.Right
		instance7.Parent = frame5
		local enabled78 = false
		local function handleAction377()
			if enabled78 then
				return
			end
			enabled78 = true
			frame5.Position = UDim2.new(0.5, 0, 0, number118)
			TweenService2:Create(frame5, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Position = UDim2.new(0.5, 0, 0, 180) }):Play()
			task.delay(2.4, function()
				TweenService2:Create(frame5, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = UDim2.new(0.5, 0, 0, number118) }):Play()
				task.delay(0.32, function()
					enabled78 = false
				end)
			end)
		end
		local function handleAction378(argument491)
			if argument491.ObjectText and argument491.ObjectText ~= "" then
				return argument491.ObjectText
			end
			local parent = argument491.Parent
			if not (parent and parent.Name ~= "") then
				return "Brainrot"
			end
			return parent.Name
		end
		local function handleAction379(parent3)
			local plots = service27:FindFirstChild("Plots")
			if not plots then
				return "Unknown"
			end
			for i = 1, 12 do
				if parent3 then
					if parent3.Parent ~= plots then
						parent3 = parent3.Parent
						continue
					end
				end
				break
			end
			parent3 = parent3 and parent3.Parent == plots and parent3 or nil
			if not parent3 then
				return "Unknown"
			end
			local plotSign = parent3:FindFirstChild("PlotSign")
			local textLabel2 = plotSign and plotSign:FindFirstChild("SurfaceGui") and plotSign.SurfaceGui:FindFirstChild("Frame") and plotSign.SurfaceGui.Frame:FindFirstChild("TextLabel")
			if not textLabel2 and plotSign then
				textLabel2 = plotSign:FindFirstChildWhichIsA("TextLabel", true)
			end
			textLabel2 = textLabel2 and textLabel2.Text or ""
			local text40 = textLabel2:lower()
			plotSign = plotSign and plotSign:FindFirstChild("YourBase")
			if plotSign and plotSign:IsA("BillboardGui") and plotSign.Enabled or text40:find("your base", 1, true) or text40:find("my base", 1, true) then
				return localPlayer34.DisplayName
			end
			if textLabel2 ~= "" then
				local match = textLabel2:match("^(.-)'")
				local matchesCondition15 = match and match ~= "" and match or textLabel2
				for _, player_ in ipairs(service26:GetPlayers()) do
					if player_.DisplayName == matchesCondition15 or player_.Name == matchesCondition15 then
						return player_.DisplayName
					end
				end
				if match and match ~= "" then
					return match
				end
				if not text40:find("base", 1, true) then
					return textLabel2
				end
			end
			return "Unknown"
		end
		local function handleAction380()
			if not _G.__4HubPromptGen then
				return nil, 0
			end
			local value505 = ipairs
			local 4HubStealPrompts = _G.__4HubStealPrompts and _G.__4HubStealPrompts() or {}
			local number119 = -1
			local value506 = nil
			for _, 4HubStealPrompt in value505(4HubStealPrompts) do
				if 4HubStealPrompt.Parent then
					local ok, result = pcall(_G.__4HubPromptGen, 4HubStealPrompt)
					result = ok and type(result) == "number" and result or 0
					if number119 < result then
						number119 = result
						value506 = 4HubStealPrompt
					end
				end
			end
			return value506, number119
		end
		local value507 = nil
		task.spawn(function()
			while true do
				if not _G.__4HubBrainrotNotif then
					task.wait(0.4)
				else
					local value508, value509 = handleAction380()
					if value508 and value508 ~= value507 then
						if _G.__4HubBrainrotNotif then
							value507 = value508
							local value510 = handleAction378(value508)
							local value511 = nil
							local text41 = "Normal"
							local result
							if _G.__4HubPromptInfo then
								local ok, result2, result3, result4
								ok, result2, result3, result, result4 = pcall(_G.__4HubPromptInfo, value508)
								value511 = nil
								text41 = "Normal"
								if ok then
									result = result or value509
									if result3 then
										value511 = result4
										text41 = result3
									else
										text41 = "Normal"
										value511 = result4
									end
								else
									result = value509
								end
							else
								result = value509
							end
							textLabel.Text = value510
							instance6.Text = "Owner: " .. (value511 or handleAction379(value508))
							instance7.Text = (_G.__4HubMoney and _G.__4HubMoney(result) or "$" .. tostring(value509)) .. "/s"
							local text = tostring(text41)
							if text == "" or text:lower() == "none" then
								text = "Normal"
							end
							instance5.Text = text
							if _G.__4HubMutStyle then
								_G.__4HubMutStyle(instance5, text41)
							elseif _G.__4HubMutColor then
								instance5.TextColor3 = _G.__4HubMutColor(text41)
							end
							frame7:SetAttribute("4HubTraitDrawn", false)
							local 4HubPromptTraits = _G.__4HubPromptTraits and _G.__4HubPromptTraits(value508) or {}
							task.defer(function()
								local x = instance5.AbsoluteSize.X
								if x and x > 0 then
									frame7.Position = UDim2.fromOffset(22 + x + 8, 10)
								end
								if _G.__4HubRenderTraits then
									_G.__4HubRenderTraits(frame7, 4HubPromptTraits, 13)
								end
							end)
							handleAction377()
							if _G.__4HubEnabledAlerts and _G.__4HubAlertSoundId then
								pcall(function()
									sound.SoundId = "rbxassetid://" .. _G.__4HubAlertSoundId
									sound:Play()
								end)
							end
						end
					end
					task.wait(0.35)
				end
			end
		end)
	end
	handleAction375()
end
do
	local function handleAction381()
		local players26 = game:GetService("Players")
		local TweenService2 = game:GetService("TweenService")
		game:GetService("RunService")
		local playerGui_ = players26.LocalPlayer:WaitForChild("PlayerGui")
		local options112 = {
			Black = Color3.fromRGB(6, 8, 14),
			BgDark = Color3.fromRGB(9, 13, 24),
			BgPanel = Color3.fromRGB(13, 20, 38),
			Stroke = Color3.fromRGB(30, 46, 82),
			DarkBlue = Color3.fromRGB(18, 38, 78),
			LightBlue = Color3.fromRGB(92, 165, 255),
			BlueLine = Color3.fromRGB(60, 120, 220),
			White = Color3.fromRGB(240, 248, 255),
			Dim = Color3.fromRGB(150, 165, 195),
			Grey = Color3.fromRGB(40, 52, 82),
			Green = Color3.fromRGB(38, 170, 95),
			Red = Color3.fromRGB(200, 55, 65),
			BlueBtn = Color3.fromRGB(34, 110, 255),
		}
		local gothamMedium2 = Enum.Font.GothamMedium
		local gothamBold2 = Enum.Font.GothamBold
		local function handleAction382(parent, argument492)
			local instance4 = Instance.new("UICorner")
			instance4.CornerRadius = UDim.new(0, argument492 or 8)
			instance4.Parent = parent
			return instance4
		end
		local function createUIStroke2(parent, color, thickness, transparency)
			local uiStroke2 = Instance.new("UIStroke")
			uiStroke2.Color = color or options112.Stroke
			uiStroke2.Thickness = thickness or 1
			uiStroke2.Transparency = transparency or 0
			uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uiStroke2.Parent = parent
			return uiStroke2
		end
		local items127 = {
			{
				id = "ClickAP",
				name = "Click To AP",
				mode = "toggle",
				act = function()
					if _G.__4HubToggleClickAP then
						_G.__4HubToggleClickAP()
					end
				end,
			},
			{
				id = "Prox",
				name = "Proximity",
				mode = "toggle",
				act = function()
					if _G.__4HubToggleProximityAP then
						_G.__4HubToggleProximityAP()
					end
				end,
			},
			{
				id = "Spam",
				name = "Spam Base Owner",
				mode = "pulse",
				dur = 1,
				act = function()
					if _G.__4HubSpamBaseOwner then
						_G.__4HubSpamBaseOwner()
					end
				end,
			},
			{
				id = "Carpet",
				name = "Carpet Speed",
				mode = "mirror",
				get = function()
					return _G.__4HubCarpetToggle and _G.__4HubCarpetToggle.Get()
				end,
				set = function(argument493)
					if _G.__4HubCarpetToggle then
						_G.__4HubCarpetToggle.Set(argument493)
					end
				end,
			},
			{
				id = "InfJump",
				name = "Infinite Jump",
				mode = "mirror",
				get = function()
					return _G.__4HubInfJumpToggle and _G.__4HubInfJumpToggle.Get()
				end,
				set = function(argument494)
					if _G.__4HubInfJumpToggle then
						_G.__4HubInfJumpToggle.Set(argument494)
					end
				end,
			},
			{ id = "JobCopy", name = "Job ID Copier (No extra GUI)", mode = "copy", dur = 1.5 },
		}
		local 4HubCustomPanel = playerGui_:FindFirstChild("4HubCustomPanel")
		if 4HubCustomPanel then
			4HubCustomPanel:Destroy()
		end
		local instance4 = Instance.new("ScreenGui")
		instance4.Name = "4HubCustomPanel"
		instance4.ResetOnSpawn = false
		instance4.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		instance4.IgnoreGuiInset = true
		instance4.DisplayOrder = 80
		instance4.Enabled = false
		instance4.Parent = playerGui_
		_G.__4HubShowCustomPanel = function(argument495)
			if instance4 then
				instance4.Enabled = argument495 and true or false
			end
		end
		local frame5 = Instance.new("Frame")
		frame5.Name = "Window"
		frame5.AnchorPoint = Vector2.new(0.5, 0.5)
		frame5.Position = UDim2.new(0.5, 0, 0.5, 0)
		frame5.Size = UDim2.fromOffset(236, 0)
		frame5.AutomaticSize = Enum.AutomaticSize.Y
		frame5.BackgroundColor3 = options112.BgDark
		frame5.BorderSizePixel = 0
		frame5.Active = true
		frame5.Parent = instance4
		handleAction382(frame5, 12)
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Rotation = 90
		local new = ColorSequenceKeypoint.new
		local bgDark = options112.BgDark
		uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, options112.Black), new(1, bgDark) })
		uiGradient.Parent = frame5
		local uiStroke2 = Instance.new("UIStroke")
		uiStroke2.Thickness = 2.5
		uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke2.Parent = frame5
		local uiGradient2 = Instance.new("UIGradient")
		local colorSequence = ColorSequence.new
		local items128 = {}
		local value512 = ColorSequenceKeypoint.new(0, options112.DarkBlue)
		local value513 = ColorSequenceKeypoint.new(0.5, options112.LightBlue)
		local new2 = ColorSequenceKeypoint.new
		local darkBlue = options112.DarkBlue
		items128[1] = value512
		items128[2] = value513
		do
			local values = table.pack(new2(1, darkBlue))
			table.move(values, 1, values.n, 3, items128)
		end
		uiGradient2.Color = colorSequence(items128)
		uiGradient2.Parent = uiStroke2
		_G.__4HubSpin(uiGradient2, 90, function()
			return instance4.Enabled
		end)
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.FillDirection = Enum.FillDirection.Vertical
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.Padding = UDim.new(0, 0)
		uiListLayout.Parent = frame5
		local uiPadding = Instance.new("UIPadding")
		uiPadding.PaddingBottom = UDim.new(0, 10)
		uiPadding.Parent = frame5
		local instance5 = Instance.new("Frame")
		instance5.Size = UDim2.new(1, 0, 0, 40)
		instance5.BackgroundTransparency = 1
		instance5.Active = true
		instance5.LayoutOrder = 1
		instance5.Parent = frame5
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Font = gothamBold2
		textLabel.Text = "Custom Panel"
		textLabel.TextColor3 = options112.White
		textLabel.TextSize = 15
		textLabel.TextXAlignment = Enum.TextXAlignment.Center
		textLabel.Parent = instance5
		local textButton3 = Instance.new("TextButton")
		textButton3.AnchorPoint = Vector2.new(1, 0)
		textButton3.Position = UDim2.new(1, -12, 0, 11)
		textButton3.Size = UDim2.fromOffset(20, 20)
		textButton3.BackgroundColor3 = options112.DarkBlue
		textButton3.AutoButtonColor = false
		textButton3.Font = gothamBold2
		textButton3.Text = "–"
		textButton3.TextColor3 = options112.LightBlue
		textButton3.TextSize = 18
		textButton3.Parent = instance5
		handleAction382(textButton3, 6)
		createUIStroke2(textButton3, options112.LightBlue, 1)
		local frame6 = Instance.new("Frame")
		frame6.Size = UDim2.new(1, -28, 0, 2)
		frame6.Position = UDim2.new(0, 14, 0, 38)
		frame6.BackgroundColor3 = options112.BlueLine
		frame6.BorderSizePixel = 0
		frame6.Parent = instance5
		handleAction382(frame6, 1)
		local uiGradient3 = Instance.new("UIGradient")
		local colorSequence2 = ColorSequence.new
		local items129 = {}
		local value514 = ColorSequenceKeypoint.new(0, options112.DarkBlue)
		local value515 = ColorSequenceKeypoint.new(0.5, options112.LightBlue)
		items129[1] = value514
		items129[2] = value515
		do
			local values = table.pack(ColorSequenceKeypoint.new(1, options112.DarkBlue))
			table.move(values, 1, values.n, 3, items129)
		end
		uiGradient3.Color = colorSequence2(items129)
		uiGradient3.Parent = frame6
		local instance6 = Instance.new("Frame")
		instance6.Size = UDim2.new(1, 0, 0, 0)
		instance6.AutomaticSize = Enum.AutomaticSize.Y
		instance6.BackgroundTransparency = 1
		instance6.LayoutOrder = 2
		instance6.Parent = frame5
		local instance7 = Instance.new("UIListLayout")
		instance7.SortOrder = Enum.SortOrder.LayoutOrder
		instance7.Padding = UDim.new(0, 6)
		instance7.Parent = instance6
		local uiPadding2 = Instance.new("UIPadding")
		uiPadding2.PaddingLeft = UDim.new(0, 10)
		uiPadding2.PaddingRight = UDim.new(0, 10)
		uiPadding2.PaddingTop = UDim.new(0, 6)
		uiPadding2.Parent = instance6
		local frame7 = Instance.new("Frame")
		frame7.Size = UDim2.new(1, 0, 0, 0)
		frame7.AutomaticSize = Enum.AutomaticSize.Y
		frame7.BackgroundTransparency = 1
		frame7.LayoutOrder = 1
		frame7.Parent = instance6
		local uiListLayout2 = Instance.new("UIListLayout")
		uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout2.Padding = UDim.new(0, 6)
		uiListLayout2.Parent = frame7
		local frame8 = Instance.new("Frame")
		frame8.Size = UDim2.new(1, 0, 0, 30)
		frame8.BackgroundTransparency = 1
		frame8.LayoutOrder = 2
		frame8.Parent = instance6
		local textButton4 = Instance.new("TextButton")
		textButton4.AnchorPoint = Vector2.new(1, 0.5)
		textButton4.Position = UDim2.new(1, 0, 0.5, 0)
		textButton4.Size = UDim2.fromOffset(28, 28)
		textButton4.BackgroundColor3 = options112.BlueBtn
		textButton4.AutoButtonColor = false
		textButton4.Font = gothamBold2
		textButton4.Text = "+"
		textButton4.TextColor3 = options112.White
		textButton4.TextSize = 20
		textButton4.Parent = frame8
		handleAction382(textButton4, 7)
		createUIStroke2(textButton4, options112.LightBlue, 1)
		local frame9 = Instance.new("Frame")
		frame9.Size = UDim2.new(1, 0, 0, 0)
		frame9.AutomaticSize = Enum.AutomaticSize.Y
		frame9.BackgroundTransparency = 1
		frame9.Visible = false
		frame9.LayoutOrder = 3
		frame9.Parent = instance6
		local uiListLayout3 = Instance.new("UIListLayout")
		uiListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout3.Padding = UDim.new(0, 5)
		uiListLayout3.Parent = frame9
		local textBox = Instance.new("TextBox")
		textBox.Size = UDim2.new(1, 0, 0, 26)
		textBox.BackgroundColor3 = options112.BgPanel
		textBox.BorderSizePixel = 0
		textBox.Font = gothamMedium2
		textBox.PlaceholderText = "Search…"
		textBox.Text = ""
		textBox.TextColor3 = options112.White
		textBox.PlaceholderColor3 = options112.Dim
		textBox.TextSize = 12
		textBox.LayoutOrder = 1
		textBox.ClearTextOnFocus = false
		textBox.Parent = frame9
		handleAction382(textBox, 6)
		createUIStroke2(textBox, options112.Stroke, 1)
		local items130 = {}
		local items131 = {}
		local function handleAction383(argument496)
			if items130[argument496.id] then
				return
			end
			local textButton5 = Instance.new("TextButton")
			textButton5.Size = UDim2.new(1, 0, 0, 32)
			textButton5.BackgroundColor3 = options112.BgDark
			textButton5.AutoButtonColor = false
			textButton5.Text = ""
			textButton5.BorderSizePixel = 0
			textButton5.Parent = frame7
			handleAction382(textButton5, 7)
			createUIStroke2(textButton5, options112.Stroke, 1)
			local frame10 = Instance.new("Frame")
			frame10.Size = UDim2.new(0, 3, 0.55, 0)
			frame10.Position = UDim2.new(0, 0, 0.225, 0)
			frame10.BackgroundColor3 = options112.DarkBlue
			frame10.BorderSizePixel = 0
			frame10.Parent = textButton5
			handleAction382(frame10, 2)
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.Size = UDim2.new(1, -16, 1, 0)
			textLabel2.Position = UDim2.fromOffset(8, 0)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Font = gothamBold2
			textLabel2.Text = argument496.name
			textLabel2.TextColor3 = options112.White
			textLabel2.TextSize = 12
			textLabel2.TextXAlignment = Enum.TextXAlignment.Center
			textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel2.Parent = textButton5
			local entry162 = false
			local function handleAction384(argument497)
				TweenService2:Create(textButton5, TweenInfo.new(0.16), { BackgroundColor3 = argument497 and options112.Green or options112.BgDark }):Play()
				TweenService2:Create(frame10, TweenInfo.new(0.16), { BackgroundColor3 = argument497 and options112.White or options112.DarkBlue }):Play()
			end
			textButton5.MouseButton1Click:Connect(function()
				if argument496.mode == "toggle" then
					entry162 = not entry162
					handleAction384(entry162)
					pcall(argument496.act)
				elseif argument496.mode == "mirror" then
					local enabled79 = not (argument496.get and argument496.get() or false)
					if argument496.set then
						argument496.set(enabled79)
					end
					entry162 = enabled79
					handleAction384(enabled79)
				elseif argument496.mode == "pulse" then
					handleAction384(true)
					pcall(argument496.act)
					task.delay(argument496.dur or 1, function()
						handleAction384(false)
					end)
				elseif argument496.mode == "copy" then
					pcall(function()
						if setclipboard then
							setclipboard(tostring(game.JobId))
						elseif toclipboard then
							toclipboard(tostring(game.JobId))
						end
					end)
					textLabel2.Text = "Copied"
					handleAction384(true)
					task.delay(argument496.dur or 1.5, function()
						textLabel2.Text = argument496.name
						handleAction384(false)
					end)
				end
			end)
			items130[argument496.id] = { row = textButton5 }
		end
		local function handleAction385(argument498)
			local entry163 = items130[argument498]
			if entry163 then
				entry163.row:Destroy()
				items130[argument498] = nil
			end
		end
		local function handleAction386()
			for _, value516 in ipairs(items127) do
				local textButton5 = Instance.new("TextButton")
				textButton5.Size = UDim2.new(1, 0, 0, 28)
				textButton5.BackgroundColor3 = options112.Grey
				textButton5.AutoButtonColor = false
				textButton5.Text = ""
				textButton5.BorderSizePixel = 0
				textButton5.LayoutOrder = 2
				textButton5.Parent = frame9
				handleAction382(textButton5, 6)
				createUIStroke2(textButton5, options112.Stroke, 1)
				local textLabel2 = Instance.new("TextLabel")
				textLabel2.Size = UDim2.new(1, -14, 1, 0)
				textLabel2.Position = UDim2.fromOffset(9, 0)
				textLabel2.BackgroundTransparency = 1
				textLabel2.Font = gothamMedium2
				textLabel2.Text = value516.name
				textLabel2.TextColor3 = options112.White
				textLabel2.TextSize = 12
				textLabel2.TextXAlignment = Enum.TextXAlignment.Left
				textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
				textLabel2.Parent = textButton5
				local entry164 = false
				local function handleAction387()
					TweenService2:Create(textButton5, TweenInfo.new(0.14), { BackgroundColor3 = entry164 and options112.Green or options112.Grey }):Play()
				end
				textButton5.MouseEnter:Connect(function()
					TweenService2:Create(textButton5, TweenInfo.new(0.12), { BackgroundColor3 = entry164 and options112.Red or options112.Green }):Play()
				end)
				textButton5.MouseLeave:Connect(handleAction387)
				textButton5.MouseButton1Click:Connect(function()
					entry164 = not entry164
					handleAction387()
					if entry164 then
						handleAction383(value516)
					else
						handleAction385(value516.id)
					end
				end)
				items131[value516.id] = { row = textButton5, match = value516.name:lower() }
			end
		end
		handleAction386()
		textBox:GetPropertyChangedSignal("Text"):Connect(function()
			local text42 = textBox.Text:lower()
			for _, value517 in pairs(items131) do
				value517.row.Visible = text42 == "" or value517.match:find(text42, 1, true) ~= nil
			end
		end)
		local visible = false
		textButton4.MouseButton1Click:Connect(function()
			visible = not visible
			frame9.Visible = visible
			textButton4.Text = visible and "–" or "+"
		end)
		textButton4.MouseEnter:Connect(function()
			local options113 = { BackgroundColor3 = options112.LightBlue }
			TweenService2:Create(textButton4, TweenInfo.new(0.1), options113):Play()
		end)
		textButton4.MouseLeave:Connect(function()
			local options114 = { BackgroundColor3 = options112.BlueBtn }
			TweenService2:Create(textButton4, TweenInfo.new(0.1), options114):Play()
			return
		end)
		local entry165 = false
		textButton3.MouseButton1Click:Connect(function()
			entry165 = not entry165
			instance6.Visible = not entry165
			frame6.Visible = not entry165
			textButton3.Text = entry165 and "+" or "–"
		end)
		if _G.__4HubRegisterDrag then
			_G.__4HubRegisterDrag(frame5, instance5, "CustomPanelWin", UDim2.new(0.5, 0, 0.5, 0))
		end
		return
	end
	handleAction381()
end
return
