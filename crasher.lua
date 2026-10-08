local LightingService = game:GetService("Lighting");
local Player = game.Players.LocalPlayer;
local Character = Player.Character;

local Humanoid = Character and Character:FindFirstChildWhichIsA("Humanoid");
local Valid = Character and Character:QueryDescendants("BasePart") or {};

task.spawn(function()
    while Character and Character.Parent do
        for Index, Current in Valid do
            sethiddenproperty(Current, "PhysicsRepRootPart", Valid[Index + 1] or Valid[1]);
        end;
        task.wait();
    end;
end);

task.wait(0.1);

for Iteration = 1, 5 do
    replicatesignal(Humanoid.ServerBreakJoints);
    replicatesignal(Humanoid.ServerResetCharacter);
end;

task.wait(0.1);

for Iteration = 1, 9e9 do
    replicatesignal(Humanoid.ServerBreakJoints);
    replicatesignal(Humanoid.ServerResetCharacter);
    Character.Parent = LightingService;
    task.wait();
end;    
