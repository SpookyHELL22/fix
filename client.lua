ESX = nil
loaded = false
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end )
        Citizen.Wait(200)
        PlayerData = ESX.GetPlayerData()
    end
    loaded = true
end)

RegisterCommand('fix', function ()
    ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
        if group == 'owner' or group == "superadmin" or group == "admin" or group == "mod" then
            player = GetPlayerPed(-1)


           
            if IsPedSittingInAnyVehicle(player) then
                vehicle = GetVehiclePedIsIn(player, false)
                 FixVehicleWindow(vehicle, -1)
                 SetVehicleFixed(vehicle)
                 ESX.ShowNotification('~g~Megjavitottad az autót!')
                 TriggerServerEvent('fix:dc')

                -- TriggerServerEvent('toDiscord', 28076, '🔧 Fix','Egy játékos megjavította az autóját!\n***📃 Játékos adatok:***'..'\n-------------------------'..'\n**👤 [Játékos neve]**: '..name..'\n**🔢 [ID]**: '..id..'\n **🏷️ [Steam]**: '..stm..'\n🔌  **[IP]**: '..str..'\n**', '⌚ '..time)
            
              else
                  ESX.ShowNotification('~o~Ehhez a parancshoz egy jármüben kell ülnöd!')
              end
        end
    end)


end, false)

RegisterCommand('clean', function ()
    ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
        if group == 'owner' or group == "superadmin" or group == "admin" or group == "mod" then
            player = GetPlayerPed(-1)
            local id = GetPlayerServerId(PlayerId())
            local name = GetPlayerName(PlayerId())


             
                if IsPedSittingInAnyVehicle(player) then
                vehicle = GetVehiclePedIsIn(player, false)
                 SetVehicleDirtLevel(vehicle, 0)
                 ESX.ShowNotification('~g~Megtisztitottad az autót!')
                 TriggerServerEvent('clean:dc')
                 --TriggerServerEvent('toDiscord', 16734599, '🧼 Clean','Egy játékos megtisztította az autóját!\n***📃 Játékos adatok:***'..'\n-------------------------'..'\n**👤 [Játékos neve]**: '..name..'\n**🔢 [ID]**: '..id..'\n **🏷️ [Steam]**: '..stm..'\n🔌  **[IP]**: '..str..'\n**', '⌚ '..time, Config.Webhook)
       
                else
                    TriggerEvent('chat:addMessage', '~o~Ehhez a parancshoz egy jármüben kell ülnöd!')
                end
            
 
            end
  end, false)


  RegisterCommand('fuel', function (source, args)
    ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
        if group == 'owner' or group == "superadmin" or group == "admin" or group == "mod" then
            player = GetPlayerPed(-1)

           local fuel = args[1]

                if IsPedSittingInAnyVehicle(player) then
              local vehicle = GetVehiclePedIsIn(player, false)
                SetVehicleOilLevel(vehicle, 5)
                 ESX.ShowNotification('~g~Üzemanyag szint átállitva!')
                 TriggerServerEvent('fuel:dc', fuel)
                 --TriggerServerEvent('toDiscord', 16734599, '🧼 Clean','Egy játékos megtisztította az autóját!\n***📃 Játékos adatok:***'..'\n-------------------------'..'\n**👤 [Játékos neve]**: '..name..'\n**🔢 [ID]**: '..id..'\n **🏷️ [Steam]**: '..stm..'\n🔌  **[IP]**: '..str..'\n**', '⌚ '..time, Config.Webhook)
       
                else
                    TriggerEvent('chat:addMessage', '~o~Ehhez a parancshoz egy jármüben kell ülnöd!')
                end
                


        end
    end)
end)
  end, false)
