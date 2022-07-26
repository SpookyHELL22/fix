ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

discord_webhook  = Config.Webhook

ESX.RegisterServerCallback("Admin:getRankFromPlayer", function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)


--DISCORD LOG--



RegisterServerEvent('fix:dc')
AddEventHandler('fix:dc', function ()
	local nev = GetPlayerName(source)
	PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode(
        {
          username = Config.Servername,
          --avatar_url = Image,
          embeds = {
            {
              title = '🔧 Fix',       --CÍM
              color = 36863, --DECIMAL SZÍN  (https://www.mathsisfun.com/hexadecimal-decimal-colors.html)
              description = "**📃 Játékos adatok**\n**👤 [Név]:** ".. GetPlayerName(source) .. " **🔢 [ID]:** ".. source .. "\n**🏷️ [Steam]:** ".. GetPlayerIdentifiers(source)[1] .."\n**[Discord]:** "..GetPlayerIdentifiers(source)[5],
              footer = {
                text = 'Dark Night Roleplay log'
              }
            }
          },
        }), { ['Content-Type'] = 'application/json' })


end)




RegisterServerEvent('clean:dc')
AddEventHandler('clean:dc', function ()
	local nev = GetPlayerName(source)
	PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode(
        {
          username = Config.Servername,
          --avatar_url = Image,
          embeds = {
            {
              title = '🧼 Clean',     --CÍM
              color = 16741797,    --DECIMAL SZÍN   (https://www.mathsisfun.com/hexadecimal-decimal-colors.html)
              description = "**📃 Játékos adatok**\n**👤 [Név]:** ".. GetPlayerName(source) .. " **🔢 [ID]:** ".. source .. "\n**🏷️ [Steam]:** ".. GetPlayerIdentifiers(source)[1] .."\n**[Discord]:** "..GetPlayerIdentifiers(source)[5],
              footer = {
                text = 'Dark Night Roleplay log'        
              }
            }
          },
        }), { ['Content-Type'] = 'application/json' })


end)