-- QBCore Exports / Variables --
local QBCore = exports['qb-core']:GetCoreObject()
local RecentRobbery = 0, 0, 0

-- ATM RFID Disuptor (Scrambler Hack) --
RegisterNetEvent('qb-atmrobbery:UseDisruptor', function()
    if RecentRobbery == 0 or GetGameTimer() > RecentRobbery then
        QBCore.Functions.TriggerCallback('qb-atmrobbery:server:PoliceInteger', function(ReturnStatus)
            if ReturnStatus then
                QBCore.Functions.TriggerCallback('qb-atmrobbery:server:RemoveDisruptor', function(ItemChecks)
                    if ItemChecks then
                        QBCore.Functions.Progressbar('atm_connecting_disruptor', 'Plugging in disruptor', Config.ProgressBarInteger, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                        animDict = 'anim@gangops@facility@servers@',
                            anim = 'hotwire',
                            flags = 49,
                        }, {}, {}, function()
                            ClearPedTasks(PlayerPedId())
                            RecentRobbery = GetGameTimer() + Config.HeistCooldown
                            exports['ps-ui']:Scrambler(function(success)
                                if success then
                                    QBCore.Functions.Progressbar('atm_grabing_cash', 'Grabing dispensed cash', Config.ProgressBarInteger, false, true, {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {
                                    animDict = 'oddjobs@shop_robbery@rob_till',
                                        anim = 'loop',
                                        flags = 17,
                                    }, {}, {}, function()
                                        ClearPedTasks(PlayerPedId())
                                        exports['ps-dispatch']:ATMRobbery()
                                        TriggerServerEvent('qb-atmrobbery:server:AddMoney')
                                    end)
                                else
                                    QBCore.Functions.Notify('Pin incorrect', 'error' , 5000)
                                end
                            end, 'alphanumeric', 30, 0) -- (alphabet, numeric, alphanumeric, greek, braille, runes), Time (Seconds), Mirrored (0: Normal, 1: Normal + Mirrored 2: Mirrored only )
                        end)
                    end
                end, Config.ATMRequiredItem)
            end
        end)
    else
        QBCore.Functions.Notify('Disruptor use detected, come back later', 'error' , 5000)
    end
end)

-- Mechanic's Shop Menu (qb-menu) --
RegisterNetEvent('qb-atmrobbery:MechanicFrontPage', function()
    exports['qb-menu']:openMenu({
        {
            header = 'Suspicious Mechanic',
            icon = 'fas fa-toolbox',
            isMenuHeader = true,
        },
        {
            header = 'Mechanic\'s Store',
            txt = 'Purchase useful tools',
            icon = 'fas fa-cash-register',
            params = {
                event = 'qb-atmrobbery:client:MechanicShopPage',
                args = {
                    number = 2,
                }
            }
        },
    })
end)

-- Mechanic's Shop Menu Purchase SubMenu (qb-menu) --
RegisterNetEvent('qb-atmrobbery:client:MechanicShopPage', function()
    exports['qb-menu']:openMenu({
        {
            header = 'Return to main menu',
            icon = 'fas fa-chevron-left',
            params = {
                event = 'qb-atmrobbery:MechanicFrontPage',
                args = {}
            }
        },
        {
            header = 'RFID Disruptor',
            txt = 'Purchase for ($'..Config.RFIDPrice..')',
            icon = 'fas fa-wave-square',
            params = {
                isServer = true,
                event = 'qb-atmrobbery:server:PurchaseDisruptor',
                args = {}
            }
        },
    })
end)
