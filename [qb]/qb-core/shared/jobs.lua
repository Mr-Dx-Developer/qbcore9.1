QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.QBJobsStatus = false -- true: integrate qb-jobs into the whole of qb-core | false: treat qb-jobs as an add-on resource.
QBShared.Jobs = {} -- All of below has been migrated into qb-jobs
if QBShared.QBJobsStatus then return end
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Freelancer',
                payment = 50
            },
        },
	},
    ['taxi'] = {
        label = 'Taxi Company',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 0
            },
            ['1'] = {
                name = 'Driver',
                payment = 0
            },
            ['2'] = {
                name = 'Lead Driver',
                payment = 0
            },
            ['3'] = {
                name = 'Owner',
                isboss = true, 
                bankAuth = true,
                payment = 0
            },
        },
    },
    ["delivery"] = {
		label = "Amazon",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Delivery man",
                payment = 50
            },
        },
	},
    ['mechanic'] = {
        label = 'Mechanic',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 50
            },
            ['1'] = {
                name = 'Mechanic',
                payment = 75
            },
            ['2'] = {
                name = 'Manager',
                payment = 100
            },
            ['3'] = {
                name = 'Boss',
            isboss = true,
                payment = 125
            },
        },
    },
    ['taco'] = {
		label = 'Taco Shop',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 75
            },
            ['1'] = {
                name = 'Employee',
                payment = 85
            },
            ['2'] = {
                name = 'Cook',
                payment = 100
            },
            ['3'] = {
                name = 'Manager',
                payment = 120
            },
            ['4'] = {
                name = 'CEO',
                isboss = true,
                payment = 135,
            },
        },
	},
    ['oilwell'] = {
        label = 'Oil Company',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Oilwell Operator',
                payment = 50
            },
            ['1'] = {
                name = 'Oilwell Operator tier 2',
                payment = 75
            },
            ['2'] = {
                name = 'Event Driver tier 2',
                payment = 100
            },
            ['3'] = {
                name = 'Sales',
                payment = 125
            },
            ['4'] = {
                name = 'CEO',
                isboss = true,
                payment = 150
            },
        },
},
    ['whitewidow'] = {
		label = 'Whitewidow',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Picker', payment = 50 },
			['1'] = { name = 'Deliverer', payment = 75 },
			['2'] = { name = 'Roller', payment = 100 },
			['3'] = { name = 'Manager', payment = 125 },
			['4'] = { name = 'Boss', payment = 150 ,isboss = true,},
        },
	},
    ['burgershot'] = {
        label = 'Burger Shot',
        type = "burgershot",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Employee',
                payment = 50
            },
            ['1'] = {
                name = 'Manager',
                payment = 150
            },
            ['2'] = {
                name = 'Owner',
                isboss = true,
                payment = 250
            },
        },
    },    
	
	['vanilla'] = {
        label = 'vanilla Unicorn',
        type = "vanilla",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Employee',
                payment = 50
            },
            ['1'] = {
                name = 'Manager',
                payment = 150
            },
            ['2'] = {
                name = 'Owner',
                isboss = true,
                payment = 250
            },
        },
    },
	
	['tequilala'] = {
		label = 'Tequilala',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', payment = 150, isboss = true, },
        },
	},
	

	
	['beanmachine'] = {
		label = 'Bean Machine',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 100 },
			['1'] = { name = 'Novice', payment = 175 },
			['2'] = { name = 'Experienced', payment = 200 },
			['3'] = { name = 'Advanced', payment = 225 },
			['4'] = { name = 'Manager',  payment = 350, isboss = true, },
        },
	},
	
	['fire'] = {
		label = 'Fire Fighter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Employee',
                payment = 100
            },            
			['1'] = {
                name = 'Captain',
                isboss = true,
                payment = 200
            },
        },
	},
	
	["upnatoms"] = {
		label = "Up-N-Atoms Employee",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 90
            },
			['1'] = {
                name = "Employee",
                payment = 100
            },
			['2'] = {
                name = "Burger Flipper",
                payment = 110
            },
			['3'] = {
                name = "Manager",
                payment = 120
            },
			['4'] = {
                name = "CEO",
                isboss = true,
                payment = 135
            },
        },
	},
	
    ['mesanuxta'] = {
		label = 'Mesanuxta',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 50
            },
			['1'] = {
                name = 'Employee',
                payment = 75
            },
			['2'] = {
                name = 'Manager',
                payment = 100
            },
			['3'] = {
                name = 'Owner',
                isboss = true,         
                payment = 125
            },
        },
	},
	['uwu'] = {
		label = 'Cat Cafe',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', payment = 150, isboss = true, },
        },
	},

    ['pizzathis'] = {
		label = 'Pizza This',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager',  payment = 150, isboss = true, },
        },
	},
    ['police'] = {
        label = 'Police',
        defaultDuty = true,
        grades = {
            ['0'] = {name = "Cadet", payment = 100},
            ['1'] = {name = "Officer", payment = 150},
            ['2'] = {name = "Sr.Officer", payment = 200},
            ['3'] = {name = "Ranger", payment = 220},
            ['4'] = {name = "Deputy", payment = 220},
            ['5'] = {name = "Sr.Ranger", payment = 220},
            ['6'] = {name = "Sr.Deputy", payment = 220},
            ['7'] = {name = "Corporal", payment = 300},
            ['8'] = {name = "Detective", payment = 350},
            ['9'] = {name = "Trooper", payment = 350},
            ['10'] = {name = "S.W.A.T", payment = 350},
            ['11'] = {name = "Sergeant", payment = 390},
            ['12'] = {name = "Lieutenant", payment = 400},
            ['13'] = {name = "Undersheriff", payment = 450},
            ['14'] = {name = "Sheriff", payment = 500},
            ['15'] = {name = "Captain", isboss = true,    payment = 520},
            ['16'] = {name = "Commander", isboss = true,  payment = 580},
            ['17'] = {name = "Asst C.O.P", isboss = true,    payment = 700},
            ['18'] = {name = "C.O.P", isboss = true,    payment = 750},
       },
    },
	['ambulance'] = {
		label = 'EMS',
        type = 'ems',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 100
            },
			['1'] = {
                name = 'Paramedic',
                payment = 200
            },
			['2'] = {
                name = 'Doctor',
                payment = 300
            },
			['3'] = {
                name = 'Surgeon',
                payment = 400
            },
			['4'] = {
                name = 'Chief',
                isboss = true,
                payment = 500
            },
        },
	},
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'House Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Broker',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Driver',
                payment = 75
            },
			['2'] = {
                name = 'Event Driver',
                payment = 100
            },
			['3'] = {
                name = 'Sales',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
                isboss = true,			
                payment = 150
            },
        },
	},
    ['bus'] = {
		label = 'Bus',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                isboss = true,
                payment = 50
            },
		},
	},
    ['recycle'] = {
		label = 'Recycle',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Employee',
                isboss = true,
                payment = 50
            },
		},
	},
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Finance',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
                isboss = true,			
                payment = 150
            },
        },
	},
	['judge'] = {
		label = 'Honorary',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                isboss = true,
                payment = 100
            },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Associate',
                isboss = true,
                payment = 50
            },
        },
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 50
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 50
            },
        },
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 50
            },
        },
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Sales',
                payment = 50
            },
        },
	},
}
