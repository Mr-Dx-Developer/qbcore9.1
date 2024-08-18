Config = {
	MySQL = "oxmysql", -- "oxmysql" , "mysql-async"
	Locale = "en", -- "en" , "tr"
	Token = "license", -- "license" , "steam"

	SaveMinuteOfKD = 5,

	MemberLimit = 10,
	MemberRanks = { -- If you edit this section clear your database and restart script because ranks of members can create bugs.
		[1] = { -- [1] always default
			name = "Member"
		},
		[2] = {
			name = "Moderator",
			permissions = {
				"invite"
			}
		},
		[3] = {
			name = "Admin",
			permissions = {
				"kick",
				"invite"
			}
		}
	},

	Command = "crew", -- Command of open menu
	-- MenuKey = "F5" -- Default F5 (https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/)
}
