-- Screw Driver Set --
exports['qb-target']:AddTargetModel(Config.ParkingMeterProps,  {
    options = {
      {
        type = 'client',
        event = 'qb-meterrobbery:client:UnscrewBackplate',
        icon = Config.MeterIcon,
        label = Config.MeterLabel,
        item = Config.RequiredItem,
      },
    },
    distance = 2.5,
})