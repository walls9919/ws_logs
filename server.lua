local webhook = "YOURWEBHOOK"
local name = "Join/Leave logs"
local logo = "YOURIMAGEURL" -- Must end with .png, .jpg etc.

-- Player Connecting Event --
AddEventHandler('playerConnecting', function()
    local playerName = GetPlayerName(source)
    local playerPing = GetPlayerPing(source)
    local playerHex = GetPlayerIdentifier(source)
    local connecting = {
        {
            ["color"] = "000000",
            ["title"] = "Player Connecting",
            ["description"] = "Player Name: *"..playerName.."*\n\nPlayer Steam Hex: *"..playerHex.."*\n Player Ping: *"..playerPing.."*",
	        ["footer"] = {
                ["text"] = name,
                ["icon_url"] = logo,
            },
        }
    }

-- Sending Embed To Discord Webhook --
PerformHttpRequest(webhook, function (err, text, headers) end, 'POST', json.encode({username = name, embeds = connecting}), { ['Content-Type'] = 'application/json' })
end)

-- Player Disconnecting Event --
AddEventHandler('playerDropped', function(reason)
    local playerName = GetPlayerName(source)
    local playerPing = GetPlayerPing(source)
    local playerHex = GetPlayerIdentifier(source)
    local disconnecting = {
        {
            ["color"] = "000000",
            ["title"] = "Player Disconnecting",
            ["description"] = "Player Name: *"..playerName.."*\n\nReason: *"..reason.."*\n\nPlayer Steam Hex: *"..playerHex.."*\n Player Ping: *"..playerPing.."*",
            ["footer"] = {
                ["text"] = name,
                ["icon_url"] = logo,
            },
        }
    }

-- Sending Embed To Discord Webhook --
PerformHttpRequest(webhook, function (err, text, headers) end, 'POST', json.encode({username = name, embeds = disconnecting}), { ['Content-Type'] = 'application/json' })
end)
