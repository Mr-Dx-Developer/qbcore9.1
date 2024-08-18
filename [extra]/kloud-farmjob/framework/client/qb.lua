if GetResourceState("qb-core") ~= "started" then return end

QBCore = exports['qb-core']:GetCoreObject()

PlayerData = {}
PlayerJob = {}
PlayerLoaded = false

---@diagnostic disable-next-line: param-type-mismatch
AddStateBagChangeHandler('isLoggedIn', nil, function(_bagName, _key, value, _reserved, _replicated)
    if value then
        PlayerData = QBCore.Functions.GetPlayerData()
        UpdateJobInfo(PlayerData.job)
    else
        table.wipe(PlayerData)
        table.wipe(PlayerJob)
    end
    PlayerLoaded = value
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    JobInfo = QBCore.Functions.GetPlayerData().job
    UpdateJobInfo(JobInfo)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    table.wipe(PlayerData)
    table.wipe(PlayerJob)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    UpdateJobInfo(JobInfo)
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(newPlayerData) 
    local invokingResource = GetInvokingResource()
    if invokingResource and invokingResource ~= 'qb-core' then return end
    PlayerData = newPlayerData
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName or not LocalPlayer.state.isLoggedIn then return end
    PlayerData = QBCore.Functions.GetPlayerData()
    UpdateJobInfo(PlayerData.job)
    PlayerLoaded = true
end)

UpdateJobInfo = function(info)
    PlayerJob.grade = {}
    PlayerJob.name = info.name
    PlayerJob.grade.level = info.grade.level
end
