lib.locale()

FormatStr = function(str)
    local strFormat = str
    strFormat = strFormat:gsub("_", " ")
    strFormat = string.gsub(" "..strFormat, "%W%l", string.upper):sub(2)
    return strFormat
end

DrawText = function (msg)
    if KloudDev.DrawText == 'ox' then
        local pos = KloudDev.DrawTextAlignment.."-center"
        lib.showTextUI(msg, {
            position = pos or "right-center"
        })
    elseif KloudDev.DrawText == 'qb' then
        exports['qb-core']:DrawText(msg, KloudDev.DrawTextAlignment)
    end
end

HideText = function ()
    if KloudDev.DrawText == 'ox' then
        lib.hideTextUI()
    elseif KloudDev.DrawText == 'qb' then
        exports['qb-core']:HideText()
    end
end

Progress = function (duration, label, dict, clip)
    if KloudDev.Progress == "ox-circle" then
        local anim = nil
        if dict and clip then
            anim = {
                dict = dict,
                clip = clip
            }
        end
        return lib.progressCircle({
            duration = duration,
            label = label,
            useWhileDead = false,
            canCancel = false,
            position = KloudDev.ProgressCirclePos or "bottom",
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false
            },
            anim = anim,
        })
    elseif KloudDev.Progress == "ox-bar" then
        local anim = nil
        if dict and clip then
            anim = {
                dict = dict,
                clip = clip
            }
        end
        return lib.progressBar({
            duration = duration,
            label = label,
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false
            },
            anim = anim
        })
    end
end

Notify = function (msg, type, duration)
    local dur = duration or 3000
    if KloudDev.Notify == "ox" then
        if GetResourceState("ox_lib") ~= "started" then print("You need ox_lib running for the notifications to work") return end
        if type == "error" then
            lib.notify({
                description = msg,
                icon = 'ban',
                duration = dur,
                iconColor = '#C53030',
                position = KloudDev.NotifyPos or "top-right"
            })
        elseif type == "success" then
            lib.notify({
                description = msg,
                icon = 'check',
                duration = dur,
                iconColor = '#30c56a',
                position = KloudDev.NotifyPos or "top-right"
            })
        end
    elseif KloudDev.Notify == "qb" then
        TriggerEvent('QBCore:Notify', msg, type, dur)
    elseif KloudDev.Notify == "esx" then
        TriggerEvent('esx:showNotification', msg, type, dur)
    elseif KloudDev.Notify == "ps" then
        exports['ps-ui']:Notify(msg, type, dur)
    end
end

SVNotify = function (source, msg, type, duration)
    local dur = duration or 3000
    if KloudDev.Notify == "ox" then
        local randomID = math.random(1, 500)
        if type == "error" then
            TriggerClientEvent('ox_lib:notify', source, {
                description = msg,
                duration = dur,
                icon = 'ban',
                iconColor = '#C53030',
                position = KloudDev.NotifyPos or "top-right"
            })
        elseif type == "success" then
            TriggerClientEvent('ox_lib:notify', source, {
                description = msg,
                duration = dur,
                icon = 'check',
                iconColor = '#30c56a',
                position = KloudDev.NotifyPos or "top-right"
            })
        end
    elseif KloudDev.Notify == "qb" then
        TriggerClientEvent('QBCore:Notify', source, msg, type, dur)
    elseif KloudDev.Notify == "esx" then
        TriggerClientEvent('esx:showNotification', source, msg, type, dur)
    elseif KloudDev.Notify == "ps" then
        TriggerClientEvent('ps-ui:Notify', source, msg, type, dur)
    end
end

FaceEntity = function (entity1, entity2)
    local x, y, z = table.unpack(GetEntityCoords(entity1, true))
    local x1, y1, z1 = table.unpack(GetEntityCoords(entity2, true))

    local dx = x1 - x
    local dy = y1 - y

    local heading = GetHeadingFromVector_2d(dx, dy)
    SetPedDesiredHeading(entity1, heading)
    return tonumber(heading)
end

PlayAnim = function (ped, dict, clip, duration, upperbody)
    lib.requestAnimDict(dict)
    ClearPedTasks(ped)
    TaskPlayAnim(ped, dict, clip, 5.0, 5.0, duration or -1, upperbody and 51 or 0, 0, false, false, false)
end

ShrugAnim = function (ped)
    lib.requestAnimDict(_anim.shrug.dict)
    ClearPedTasks(ped)
    TaskPlayAnim(ped, _anim.shrug.dict, _anim.shrug.clip, 5.0, 5.0, 1000, 51, 0, false, false, false)
    Wait(800)
end

NoAnim = function (ped)
    lib.requestAnimDict(_anim.no.dict)
    ClearPedTasks(ped)
    TaskPlayAnim(ped, _anim.no.dict, _anim.no.clip, 5.0, 5.0, 1000, 51, 0, false, false, false)
end

RandomWaitAnim = function (ped, duration)
    local randomAnim = math.random(1, #_anim.wait)
    lib.requestAnimDict(_anim.wait[randomAnim].dict)
    ClearPedTasks(ped)
    TaskPlayAnim(ped, _anim.wait[randomAnim].dict, _anim.wait[randomAnim].clip, 5.0, 5.0, duration, 51, 0, false, false, false)
end

DeleteProp = function (prop)
    DeleteObject(prop)
end

ClipboardAnim = function (ped, duration)
    lib.requestModel(_anim.props.clipboard, 10000)
    local ped = ped
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local prop = CreateObject(joaat(_anim.props.clipboard), x, y, z, true, false, false)

    PlayAnim(ped, _anim.clipboard.dict, _anim.clipboard.clip, duration)
    AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 36029), 0.16, 0.08, 0.1, -130.0, -50.0, 0.0, true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(_anim.props.clipboard)
    return prop
end

NotepadAnim = function (ped, duration)
    lib.requestModel(_anim.props.notepad, 10000)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local prop = CreateObject(joaat(_anim.props.notepad), x, y, z, true, false, false)

    PlayAnim(ped, _anim.notepad.dict, _anim.notepad.clip, duration)
    AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 36029), 0.1, 0.02, 0.05, 10.0, 0.0, 0.0, true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(_anim.props.notepad)
    return prop
end

TrollyAnim = function (model, coords, created)
    lib.requestAnimDict(_anim.trolly.dict)

    ClearPedTasks(cache.ped)
    TaskPlayAnim(cache.ped, _anim.trolly.dict, _anim.trolly.clip, 5.0, 5.0, 1.0 , 62, 0, false, false, false)
    Wait(200)
    if not created then
        local trolly = CreateObject(joaat(model), coords.x, coords.y, coords.z, true, false, false)
        AttachEntityToEntity(trolly, cache.ped, GetPedBoneIndex(cache.ped, 60309), -0.4, -1.6, -0.85, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
        return trolly
    end

    AttachEntityToEntity(created, cache.ped, GetPedBoneIndex(cache.ped, 60309), -0.4, -1.6, -0.85, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
    return created
end

TrollyReAnim = function()
    lib.requestAnimDict(_anim.trolly.dict)

    TaskPlayAnim(cache.ped, _anim.trolly.dict, _anim.trolly.clip, 5.0, 5.0, 1.0 , 62, 0, false, false, false)
end

SkillCheck = function(difficulty, inputs)
    return lib.skillCheck(difficulty, inputs)
end