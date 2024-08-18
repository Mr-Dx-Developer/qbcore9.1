local QBCore = exports['qb-core']:GetCoreObject()

local function createSkillMenu()
    skillMenu = {}
    skillMenu[#skillMenu + 1] = {
        isHeader = true,
        header = 'Skill',
        isMenuHeader = true,
        icon = 'fas fa-chart-simple'
    }
    for k,v in pairs(Config.Skills) do
        skillMenu[#skillMenu + 1] = {
            header = ''..v['Local']..'',
            txt = ''..v['Current']..'%',
            icon = ''..v['icon']..'',
            params = {
                args = {
                    v
                }
            }
        }
    end
    exports['qb-menu']:openMenu(skillMenu)
end
    
RegisterCommand(Config.Skillmenu, function()
    createSkillMenu()
end)

--Aimgame
RegisterNetEvent("qb-gym:client:openMenu")
AddEventHandler("qb-gym:client:openMenu", function(data)
	ExecuteCommand( "skills" )
end)


-- QBCore#4011 V9 The Best

-- QBCore#4011 -- discord.gg/qbcoreframework