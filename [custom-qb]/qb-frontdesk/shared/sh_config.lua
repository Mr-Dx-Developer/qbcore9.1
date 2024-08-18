Config = {}
Config.Debug = false -- True / False for Debug System
Config.Dispatch = "ps-dispatch" -- 'default' / 'ps-dispatch' / 'cd_dispatch'
Config.PoliceRequired = 0 -- How many PD Officers Required to request
Config.Cooldown = 1 -- Server cooldown for alerts ( Set in minutes )

Config.Locations = {
    ["police"] = { -- Set this to the name of the job
        Required = 1, -- How many players with this job are required to be online to make a request/alert (You'll need to add events that track the amount of players online with that job. Police / Ambulance is setup by default)
        Zone = { -- Polyzone Info
            name = "MRPD Front Desk", -- Name of the menu title
            coords = vector3(442.68, -984.55, 30.72), -- Boxzone Coords
            length = 0.8, width = 0.6, -- Boxzone Length / Width
            heading = 185.54, -- Boxzone Heading
            minZ = 30.49, -- Boxzone MinZ
            maxZ = 31.29 -- Boxzone MaxZ
        },
        Menu = { -- Menu Info ( Set Header, Text, Icon, Event, and Event Type )
            [1] = { Header = 'Assistance', Txt = '', Icon = 'fas fa-hand', Event = 'qb-frontdesk:client:RequestAssistance', Args = 'assistance' },
            [2] = { Header = 'Weapon License', Txt = '', Icon = 'fas fa-gun', Event = 'qb-frontdesk:client:RequestAssistance', Args = 'weaponlicense' },
            [3] = { Header = 'Interview', Txt = '', Icon = 'fas fa-people-arrows-left-right', Event = 'qb-frontdesk:client:RequestAssistance', Args = 'interview' },
            [4] = { Header = 'Supervisor', Txt = '', Icon = 'fas fa-crown', Event = 'qb-frontdesk:client:RequestAssistance', Args = 'supervisor' },
        }
    },
    ["ambulance"] = {
        Required = 1, -- How many players with this job are required to be online to make a request/alert (You'll need to add events that track the amount of players online with that job. Police / Ambulance is setup by default)
        Zone = {
            name = "Pillbox Front Desk",
            coords = vector3(311.74, -580.04, 44.18),
            length = 0.8, width = 0.8,
            heading = 57.47,
            minZ = 42,
            maxZ = 44
        },
        Menu = {
            [1] = { Header = 'Assistance', Txt = '', Icon = 'fas fa-hand', Event = 'qb-frontdesk:client:RequestAssistance', Args = 'assistance'},
            [2] = { Header = 'Interview', Txt = '', Icon = 'fas fa-people-arrows-left-right', Event = 'qb-frontdesk:client:RequestAssistance', Args = 'interview' },
            [3] = { Header = 'Supervisor', Txt = '', Icon = 'fas fa-crown', Event = 'qb-frontdesk:client:RequestAssistance', Args = 'supervisor'},
        }
    }
}
