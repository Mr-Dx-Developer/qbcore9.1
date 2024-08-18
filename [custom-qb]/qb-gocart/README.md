# qb-gocart
Simple karting tickets system for QBCore

# Preivew: 
- https://youtu.be/tAa4WKA4v1w
- 
![image](https://user-images.githubusercontent.com/89866234/175318521-c744f071-9a81-4186-8d4e-31ae7fccb6bd.png)


# Installation:

Add to qb-core/server/events.lua:
```
RegisterNetEvent('QBCore:Server:RemoveMoney', function(acount, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveMoney(acount, amount)
end)

RegisterNetEvent('QBCore:Server:AddMoney', function(acount, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.AddMoney(acount, amount)
end)
```

# Map credits link: 
- https://forum.cfx.re/t/map-karting-track-race/2270220
