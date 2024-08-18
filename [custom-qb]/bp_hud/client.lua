


local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = nil


local kemertakilimi = false
local aracsabitmi =  false
local aracicinde = false
local gecekpedimiz = nil
local hiz = nil
local arac = nil
local sabitlenmishiz = 0

-- local PlayerData = nil
local mapstyle = nil
local currSpeed = 0.0
local seatbeltEjectSpeed = 45.0 
local seatbeltEjectAccel = 100.0
local Seviye = 1
local gangwaronclient = false


local directions = { [0] = 'NB', [45] = 'North-West', [90] = 'West Bound', [135] = 'South-West', [180] = 'South Bound', [225] = 'South-East', [270] = 'East Bound', [315] = 'North-East', [360] = 'North Bound', }


---  toher hud---------------------------

local gecerlideger = {}
gecerlideger.hunger = 0
gecerlideger.thirst = 0
gecerlideger.stress = 0
gecerlideger.stamina = 100
gecerlideger.underwatertime = 100

local needhudaktif = true
local weaponhudaktif = true
local keyinfohudaktif = true
local bankcashhudaktif = true

local weaponlistbeya = {}

local onlinesss = 0

local clientplayerdata = nil

------------------------------------- vehicle part -------------------------------------------------------------------

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(xPlayer)
    Wait(1000)
    TriggerServerEvent('bp_hud:setgethudinfo')
    PlayerData = QBCore.Functions.GetPlayerData()
    gecerlideger["hunger"] = PlayerData.metadata['hunger']
    gecerlideger["thirst"] = PlayerData.metadata['thirst']
    gecerlideger["stress"] = PlayerData.metadata['stress']
    print('evet yüklendi')
    DisplayRadar(false)
end)

if Config.needrestart then
  TriggerServerEvent('bp_hud:setgethudinfo')
  PlayerData = QBCore.Functions.GetPlayerData()
  DisplayRadar(false)
end


Citizen.CreateThread(function()

	while true do
		Citizen.Wait(70)
        if PlayerData ~= nil and clientplayerdata ~= nil then					
            gecekpedimiz = PlayerPedId()

           
            
            if IsPedInAnyVehicle(gecekpedimiz, false) and not IsPauseMenuActive() then
                arac = GetVehiclePedIsUsing(PlayerPedId())
                if Config.speedtype == "kmh" then
                  hiz = math.ceil(GetEntitySpeed(arac) * 3.605936)
                else
                  hiz = math.ceil(GetEntitySpeed(arac) * 2.236936)

                end
            
            
                local aracbenzin = GetVehicleFuelLevel(arac)

                local hepbir ,kisalar, uzunlar =GetVehicleLightsState(arac)
                local aracfardurum = {
                    farkisa = kisalar,
                    faruzunlar = uzunlar
                }
        
                dataevent()
                
                
    

                aracicinde = true
            
                if PlayerData ~= nil then	
                
                    SendNUIMessage({
                        message = 'arachud',
                        durum = "aktif",
                        arachiz = hiz,
                        aracbenzin = aracbenzin,
                        aracmotor = GetIsVehicleEngineRunning(arac),
                        mapstyle = mapstyle,
                        sabitlenmishiz = sabitlenmishiz,
                        aracsabitmi = aracsabitmi,
                        aracfar = aracfardurum,
                        void = Seviye,
                        playerdatabase = clientplayerdata
                        -- talkmod = talking



                        
                
                
                    })
                end

                DisplayRadar(true)
            
            else
                aracicinde = false
                kemertakilimi = false
                aracsabitmi= false
                -- local talking = NetworkIsPlayerTalking(PlayerId())
            
                SendNUIMessage({
                    message = 'arackemer',
                    kemerdurum = "off"

                })
                Citizen.Wait(1000)	
                if PlayerData ~= nil then	
                    SendNUIMessage({
                        message = 'arachud',
                        durum = "kapali",
                        void = Seviye,
                        aracfar = aracfardurum,
                        configmap = Config.mapshow,
                        playerdatabase = clientplayerdata,
                        mapacikmi = IsPauseMenuActive(),
                        -- talkmod = talking
                        
                
                
                    })
                end
                if Config.mapshow == false then
                DisplayRadar(false)
                end
            end
        end
	end
end)



RegisterNetEvent('bp_hud:sendinfobank')
AddEventHandler('bp_hud:sendinfobank', function(bank,cash)
    playercurrentbank = bank
    playercurrentmoney = cash

    --code
end)

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(300)	

        local talking = NetworkIsPlayerTalking(PlayerId())
        SendNUIMessage({
            message = 'talkmodon',
            talkmod = talking
            
        })
    end
end)

Citizen.CreateThread(function()
    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)
    while true do
        Wait(0)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end
end)


Citizen.CreateThread(function()

	while true do
		Citizen.Wait(5)	
        if clientplayerdata ~= nil then
            
            if aracicinde then
        

                if IsControlJustReleased(0, 29) then 
                
                    if kemertakilimi == false then
                        kemertakilimi = true
                        SendNUIMessage({
                            message = 'arackemer',
                            kemerdurum = "aktif",
                            playerdatabase = clientplayerdata


                        })

                        TriggerEvent("bp_hud:startsound","carbuckle",0.8)
                    
                    else
                        kemertakilimi = false
                        SendNUIMessage({
                            message = 'arackemer',
                            kemerdurum = "off",
                            playerdatabase = clientplayerdata


                        })
                        TriggerEvent("bp_hud:startsound","carunbuckle",0.8)
                    
                    end
                
                
                end

                if IsControlJustReleased(0, 137) then 
                    if GetPedInVehicleSeat(arac, -1) then
                
                        if aracsabitmi == false then
                            aracsabitmi = true
                        
                            SetVehicleMaxSpeed( arac,GetEntitySpeed(arac) )
                            sabitlenmishiz = hiz
                            
                        
                        
                    
                        else
                            aracsabitmi = false
                            SetVehicleMaxSpeed( arac,0 )
                    
                        end
                end
            end
            else
            Citizen.Wait(1000)	
            end
        end
    end

end)

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(2000)	
        updateClock()
        TriggerServerEvent('bp_hud:getonlines')
        TriggerServerEvent('bp_hud:getbankcash')
        changelogo()
          if IsPedInAnyVehicle(gecekpedimiz) == 1 then
            updatePosition()
           
            
                if not kemertakilimi then
                    if hiz ~= nil then
                        if hiz > 30 then
                
                        TriggerEvent("bp_hud:startsound","beltalarm",0.8)
                        end
                    -- break
                    end
                end
            end
     end

end)


function changelogo()
    SendNUIMessage({
        budabu = "logoinsert",
        logoname = Config.logoname
    
    })
end


RegisterNetEvent('bp_hud:startsound')
AddEventHandler('bp_hud:startsound', function(soundname, soundvolume)
    SendNUIMessage({
        transactionType = 'playSound',
        transactionFile  = soundname,
        transactionVolume = soundvolume or 0.5
    })
    --code
end)


RegisterNetEvent('bp_hud:sendonline')
AddEventHandler('bp_hud:sendonline', function(onlines)

    onlinesss = onlines
    --code
end)

RegisterNetEvent('bp_hud:confirmhudinfos')
AddEventHandler('bp_hud:confirmhudinfos', function(data)

    clientplayerdata = data

    -- print(json.encode(clientplayerdata))
   
    SendNUIMessage({
        bune = "cliendata",
        clientplayer = clientplayerdata
      
        
    })


    setupmap(clientplayerdata.mapstyle)
    --code
end)


function dataevent()
   
     
      if IsPedInAnyVehicle(gecekpedimiz) == 1 then
      
 
        local prevSpeed = currSpeed
         currSpeed = GetEntitySpeed(arac)
         local vehIsMovingFwd = GetEntitySpeedVector(arac, true).y > 1.0
         local vehAcc = (prevSpeed - currSpeed) / GetFrameTime()
      
        if kemertakilimi == false then
            if ( hiz > (seatbeltEjectSpeed/2.237) and vehIsMovingFwd and (vehAcc > (seatbeltEjectAccel*9.81))) then
                local prevVelocity = {x = 0.0, y = 0.0, z = 0.0}
                local position = GetEntityCoords(gecekpedimiz)
                SetEntityCoords(gecekpedimiz, position.x, position.y, position.z - 0.47, true, true, true)
                SetEntityVelocity(gecekpedimiz, prevVelocity.x, prevVelocity.y, prevVelocity.z)
                Citizen.Wait(1)
                SetPedToRagdoll(gecekpedimiz, 1000, 1000, 0, 0, 0, 0)
            end
        end
     end

end


function updatePosition()
 
    local playerCoords = GetEntityCoords(gecekpedimiz)
    local street, cross = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
    local streetName = GetStreetNameFromHashKey(street)
    local crossName
    if cross ~= nil then
        crossName =  ' '..GetStreetNameFromHashKey(cross)
    else
        crossName = ""
    end

  
        for k,v in pairs(directions)do
            direction = GetEntityHeading(gecekpedimiz)
            if(math.abs(direction - k) < 22.5)then
                direction = v
                break
            end
        end

    SendNUIMessage({
        status = "updateStreet",
        street = streetName..crossName,
        street2 = direction
        
    })
end


function updateClock()
    local hour, minute
    if GetClockHours() < 10 then
        hour = '0'..GetClockHours()
    else
        hour = GetClockHours()
    end
    if GetClockMinutes() < 10 then
        minute = '0'..GetClockMinutes()
    else
        minute = GetClockMinutes()
    end
    local time = hour..':'..minute
    SendNUIMessage({
        status = "updateClock",
        time = time,
        onlines = onlinesss
    })


end


Citizen.CreateThread(function()


    for key,value in pairs(Config.WeaponTable) do
        for name,v in pairs(Config.WeaponTable[key]) do
            weaponlistbeya[tostring(GetHashKey('weapon_'..name))] = 'weapon_'..name
        end
    end
    

    
end)


Citizen.CreateThread(function()
	
	while true do
		Citizen.Wait(1000)
       if PlayerData ~= nil and clientplayerdata ~= nil then

        
            if (Config.OpenSettings.needhud and clientplayerdata.needhud.hudstate == true and not IsPauseMenuActive()) then
               
                RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst) -- Triggered in qb-core
                    gecerlideger["hunger"] = newHunger
                    gecerlideger["thirst"] = newThirst
                end)


                if Config.stress then
                    RegisterNetEvent('hud:client:UpdateStress', function(newStress) -- Add this event with adding stress elsewhere
                        gecerlideger["stress"]  = newStress
                    end)
                end
                
                if IsPedSwimmingUnderWater(gecekpedimiz) then
                  
                    gecerlideger["underwatertime"] = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10
                else
                    gecerlideger["underwatertime"] = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10

                end

                if  gecerlideger["underwatertime"] < 0 then
                    gecerlideger["underwatertime"] = 0
      
                end
           

              
			
                

                if IsPedSprinting(gecekpedimiz) and (100 - GetPlayerSprintStaminaRemaining(PlayerId())) > 1 or IsPedRunning(gecekpedimiz) and (100 - GetPlayerSprintStaminaRemaining(PlayerId())) > 1 then
              
                    gecerlideger["stamina"] = (100 - GetPlayerSprintStaminaRemaining(PlayerId()))
                else
                    gecerlideger["stamina"] = (100 - GetPlayerSprintStaminaRemaining(PlayerId()))
                end

                -- print(gecerlideger["underwatertime"])
          

                SendNUIMessage({
                    message = 'oyuncuyemekhud',
                    durm = "on",
                    can = (GetEntityHealth(gecekpedimiz) - 100),
                    yelek = GetPedArmour(gecekpedimiz),
                    aclik = gecerlideger["hunger"],
                    susuzluk = gecerlideger["thirst"],
                    brain = gecerlideger["stress"],
                    playeridisi = GetPlayerServerId(PlayerId()),
                    playerstamina = gecerlideger["stamina"],
                    playeroxy = gecerlideger["underwatertime"],
                    playerdatabase = clientplayerdata

            

                })
            else
                SendNUIMessage({
                    message = 'oyuncuyemekhud',
                    durm = "off"
                

            

                })
            end
            if Config.OpenSettings.weapon == true and clientplayerdata.weapon == true and not IsPauseMenuActive() then
                   local deneme = GetSelectedPedWeapon(gecekpedimiz)

                     
                    --    print(weaponlistbeya[tostring(deneme)])
                    if weaponlistbeya[tostring(GetSelectedPedWeapon(gecekpedimiz))] ~= "weapon_unarmed" then

                        SendNUIMessage({
                            message = 'weaponmod',
                            stateweapon = "on",
                            statebullet= true,
                            weaponame = weaponlistbeya[tostring(GetSelectedPedWeapon(gecekpedimiz))],
                            weaponimg = weaponlistbeya[tostring(GetSelectedPedWeapon(gecekpedimiz))],
                            weaponbullet = GetAmmoInPedWeapon(gecekpedimiz, GetSelectedPedWeapon(gecekpedimiz)),
                            maxweapon = GetMaxAmmo( gecekpedimiz --[[ Ped ]], GetSelectedPedWeapon(gecekpedimiz) --[[ Hash ]] )
                                

                        })
                    else
                        SendNUIMessage({
                            message = 'weaponmod',
                            stateweapon = "off"
                        })
                    end
                   
                           
                  
             
            else
                SendNUIMessage({
                    message = 'weaponmod',
                    stateweapon = "off"
                })
            end


            if Config.OpenSettings.bankcash and clientplayerdata.bankcash.hudstate and not IsPauseMenuActive() then

                
              
                    
                SendNUIMessage({
                    test = 'bankcash',
                    statebitch = "on",
                    money = playercurrentmoney,
                    bank = playercurrentbank
                })
          
            else
                SendNUIMessage({
                    test = 'bankcash',
                    statebitch = "off"
                })
            end

          
            
           
        end
      
    end
end)

local progbardone = false



-------------------------------- progressbar ----------------------------------------------------------------------------------------


function progbaractive(text,time)
    progbardone = false
    SendNUIMessage({
        message = 'progbaractive',
        mtext = text,
        mtime = time
    })


    while true do
        Wait(200)
        if progbardone == true then
            return true
        end
    end


    
end



RegisterNUICallback('finishprogbar', function()
    progbardone = true
end)



-------------------------------- notify ----------------------------------------------------------------------------------------


function notifyactive(text,time,types)

    SendNUIMessage({
        message = 'notifyactive',
        ntext = text,
        ntime = time,
        ntype = types
    })
    
end




------------------------- mic part ----------------------------------------------------------------------------------------------


-- RegisterNetEvent("bp_hud:talkactive")
-- AddEventHandler("bp_hud:talkactive", function(prox)

-- 	SendNUIMessage({
-- 		type = "setMic",
-- 		content = prox
-- 	})
-- end)







------------------------- map ------------------------------------------------------------------------------------------------------------

function setupmap(hangisi)
    if hangisi == "normal" then
        RequestStreamedTextureDict("circlemap", false)
        while not HasStreamedTextureDictLoaded("circlemap") do
            Wait(100)
        end
    
        AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
        SetMinimapClipType(0)
        local defaultAspectRatio = 1920/1080 -- Don't change this.
        local resolutionX, resolutionY = GetActiveScreenResolution()
        local aspectRatio = resolutionX/resolutionY
        local minimapXOffset,minimapYOffset = 0,0
        if aspectRatio > defaultAspectRatio then
            local aspectDifference = defaultAspectRatio-aspectRatio
            minimapXOffset = aspectDifference/3.6
        end
    
        SetMinimapComponentPosition(
            "minimap", 
            "L", 
            "B", 
            -0.0045+minimapXOffset, 
            -0.022+minimapYOffset, 
            0.150, 
            0.188888
        )
    
        SetMinimapComponentPosition(
            "minimap_mask", 
            "L", 
            "B", 
            0.020+minimapXOffset, 
            0.050+minimapYOffset, 
            0.111, 
            0.159
        )
    
        SetMinimapComponentPosition(
            "minimap_blur", 
            "L", 
            "B", 
            -0.03+minimapXOffset, 
            -0.0005+minimapYOffset, 
            0.266, 
            0.237
        )
    
    
    
        SetRadarBigmapEnabled(true, false)
        Wait(500)
        SetRadarBigmapEnabled(false, false)
    
    else


        RequestStreamedTextureDict("circlemap2", false)
        while not HasStreamedTextureDictLoaded("circlemap2") do
            Wait(100)
        end
    
        AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap2", "radarmasksm")
        SetMinimapClipType(1)
        local defaultAspectRatio = 1920/1080 -- Don't change this.
        local resolutionX, resolutionY = GetActiveScreenResolution()
        local aspectRatio = resolutionX/resolutionY
        local minimapXOffset,minimapYOffset = 0,0
        if aspectRatio > defaultAspectRatio then
            local aspectDifference = defaultAspectRatio-aspectRatio
            minimapXOffset = aspectDifference/3.6
        end
    
        SetMinimapComponentPosition(
            "minimap", 
            "L", 
            "B", 
            -0.0045+minimapXOffset, 
            -0.052+minimapYOffset, 
            0.150, 
            0.178888
        )
    
        SetMinimapComponentPosition(
            "minimap_mask", 
            "L", 
            "B", 
            0.020+minimapXOffset, 
            0.050+minimapYOffset, 
            0.111, 
            0.159
        )
    
        SetMinimapComponentPosition(
            "minimap_blur", 
            "L", 
            "B", 
            0.00+minimapXOffset, 
            -0.0005+minimapYOffset, 
            0.206, 
            0.237
        )
    
    
    
        SetRadarBigmapEnabled(true, false)
        Wait(500)
        SetRadarBigmapEnabled(false, false)

    end
end


RegisterCommand('hudmenu', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        message = 'hudmenuon',
        hudinfoss = clientplayerdata
     
    })
end)


RegisterNUICallback('exit', function()
    SetNuiFocus(false, false)

end)



RegisterNUICallback('confirchange', function(data)
    TriggerServerEvent('bp_hud:updatehudsettinbgs', data)

end)


RegisterNUICallback('resethud',function()
    SetNuiFocus(false, false)

   TriggerServerEvent('bp_hud:resethud')
end)



RegisterNetEvent('bp_hud:safezoneactive')
AddEventHandler('bp_hud:safezoneactive', function(value)
	SendNUIMessage({
		type = "safezone",
		state = value
	})
    --code
end)






RegisterNetEvent('bp_hud:startgangwar')
AddEventHandler('bp_hud:startgangwar', function(data)
   if gangwaronclient == false then
        SendNUIMessage({
            type = "gangwaron",
            gangdata = data

        })
    gangwaronclient = true
   end
end)



if Config.usetestcommands then

    RegisterCommand('testgang', function()
        TriggerEvent('bp_hud:startgangwar', {['gang1text'] = "Groove" , ['gang2text'] = "Ballas", ['gang1count'] = 50 , ['gang2count'] = 50 , ['gangtime'] = 120, ['gang1color'] = "#56ff71", ['gang2color'] = "#f3a84f" })
    end)

    RegisterCommand('testgangupdate', function()
        TriggerEvent('bp_hud:gangupdate', { ['gang1count'] = 50 , ['gang2count'] = 50  })
    end)

    RegisterCommand('stopgang', function()
        TriggerEvent('bp_hud:stopgangwar')
    end)


    RegisterCommand('testgangnotify', function()
        TriggerEvent('bp_hud:gangnotify', {['gangwinner'] = "Groove" , ['gangcolor'] = "#56ff71" , ['gangtime'] = 3000})
    end)

    RegisterCommand('testquest', function()
        TriggerEvent('bp_hud:queststart', {['questmaintext'] = "Blade's Farm Adventure" , ['questdesttext'] = "Move 10 crates of fruit" , ['questdesttop'] = "5 0f 10", ['questcolor'] = "#f3a84f"})
    end)

    RegisterCommand('testquestoff', function()
        TriggerEvent('bp_hud:queststop')
    end)

    RegisterCommand('testprog', function()
        local bittimi = progbaractive('vehicle locked...', 1000)
    end)

    RegisterCommand('testnotify', function()
        notifyactive('Money send your bank please check...', 5000 ,'error')
        notifyactive('Money send your bank please check...', 2000 ,'info')
        notifyactive('Money send your bank please check...', 3000 ,'success')

    end)
end
 


RegisterNetEvent('bp_hud:stopgangwar')
AddEventHandler('bp_hud:stopgangwar', function()

    SendNUIMessage({
        type = "stoppls"

    })
end)


RegisterNetEvent('bp_hud:gangupdate')
AddEventHandler('bp_hud:gangupdate', function(data)

    SendNUIMessage({
        type = "updategang",
        gangdata = data

    })
end)



RegisterNetEvent('bp_hud:gangnotify')
AddEventHandler('bp_hud:gangnotify', function(data)

    SendNUIMessage({
        type = "gangnotify",
        notifydata = data

    })

end)


RegisterNetEvent('bp_hud:queststart')
AddEventHandler('bp_hud:queststart', function(data)

    SendNUIMessage({
        type = "queston",
        questdata = data

    })

end)

RegisterNetEvent('bp_hud:queststop')
AddEventHandler('bp_hud:queststop', function()
    SendNUIMessage({
        type = "questoff"
      

    })
end)



RegisterNUICallback('finishgang', function()
    gangwaronclient = false
    timefinish()
end)