if GetResourceState("es_extended") ~= "started" then return end

ESX = exports["es_extended"]:getSharedObject()

PlayerData = {}
PlayerJob = {}
PlayerLoaded = false

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    JobInfo = xPlayer.job
    UpdateJobInfo(JobInfo)
    
    PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout', function()
    table.wipe(PlayerData)
    table.wipe(PlayerJob)
end)

RegisterNetEvent('esx:setJob', function(JobInfo)
    UpdateJobInfo(JobInfo)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    PlayerData = ESX.GetPlayerData()
    UpdateJobInfo(PlayerData.job)
    PlayerLoaded = ESX.PlayerLoaded
end)

UpdateJobInfo = function(info)
    PlayerJob.grade = {}
    PlayerJob.name = info.name
    PlayerJob.grade.level = info.grade
end
