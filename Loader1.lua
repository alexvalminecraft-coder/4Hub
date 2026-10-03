-- Multi-Game Loader for 4Hub.Vs

local currentPlaceId = game.PlaceId

-- Table of supported games and their GitHub Raw script URLs
local supportedGames = {
    [115852335239914] = {
        Name = "+1 Skate for Brainrots",
        ScriptUrl = "https://raw.githubusercontent.com/alexvalminecraft-coder/4Hub/refs/heads/main/%2B1%20Skate"
    }
    -- You can add more games here in the future using this format:
    -- [OTHER_GAME_ID] = {
    --     Name = "Game Name",
    --     ScriptUrl = "GITHUB_RAW_URL_HERE"
    -- }
}

local gameData = supportedGames[currentPlaceId]

if gameData then
    print("[4Hub.Vs] Compatible game detected (" .. gameData.Name .. ")! Loading external script...")
    
    -- Safe loading and execution of the script hosted on GitHub
    local success, err = pcall(function()
        loadstring(game:HttpGet(gameData.ScriptUrl))()
    end)
    
    if not success then
        warn("[4Hub.Vs] Failed to load the script: " .. tostring(err))
    end
else
    warn("[4Hub.Vs] This game is not supported by this loader (Current PlaceId: " .. currentPlaceId .. ").")
end
