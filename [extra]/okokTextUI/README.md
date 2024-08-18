Hi, thank you for buying my script, I'm very grateful!

If you need help contact me on discord: okok#3488
Discord server: https://discord.gg/FauTgGRUku

# To display a text UI

exports['okokTextUI']:Open('[Key] Message', 'color', 'position')

Colors:
	- lightblue;
	- lightgreen;
	- lightred;
	- lightgrey;
	- darkblue;
	- darkgreen;
	- darkred;
	- darkgrey.

Positions:
	- right;
	- left.

To make the text bold: exports['okokTextUI']:Open('<b>[Key] Message</b>', 'color', 'position')
To insert multiple lines/commands in a text UI: exports['okokTextUI']:Open('[Key] Message 1<br>[Key] Message 2', 'color', 'position')

NOTE: 'color' and 'position' should be placed between ''

# To hide a text UI

exports['okokTextUI']:Close()

How to add new colors:

1. Open styles.css and add the following to the last line.

/* Example Notification */

.example-icon::before {
	font-family: "Font Awesome 5 Free";
	content: "\f11c";
	color: #color_code;
}

.example {
	background-color: rgba(20, 20, 20, 0.85);
	color: #color_code;
	padding: 5px 5px 5px 5px;
}

.example-border {
	border-left: 4px solid #color_code;
}

/* Example */

.examplecolor-icon::before {
	font-family: "Font Awesome 5 Free";
	content: "\f05a";
	color: #color_code;
	font-size: 28px;
}

.examplecolor {
	background-color: rgba(240, 240, 240, 0.85);
	color: #fff;
	padding: 5px 5px 5px 5px;
	margin-bottom: 5px;
}

.examplecolor-border {
	border-left: 4px solid #color_code;
}

If you want to set if the background color is light or dark, simply change the background-color on .examplecolor:
	- background-color: rgba(240, 240, 240, 1); /* LIGHT BACKGROUND */
	- background-color: rgba(20, 20, 20, 1); /* DARK BACKGROUND */


2. Open scripts.js and add the following to the line 64.

else if (event.data.color == 'examplecolor') { // Example Color
	removeClass();
	$('#main').addClass('examplecolor-icon');
	$('#wrapper').addClass('examplecolor examplecolor-border');
}

3. In order to make esx_doorlock functional change the code of the function started in the line 69 (client.lua) and do the following:

```
Citizen.CreateThread(function()
	local inZone = false
	local locked = true
	local hasAuth = false
	local shown = false
	local size, displayText = 1, _U('unlocked')
	local color

	while true do
		Citizen.Wait(0)
		local letSleep = true
		inZone = false
		for k,v in ipairs(Config.DoorList) do
			if v.distanceToPlayer and v.distanceToPlayer < 50 then
				letSleep = false

				if v.doors then
					for k2,v2 in ipairs(v.doors) do
						FreezeEntityPosition(v2.object, v.locked)
					end
				else
					FreezeEntityPosition(v.object, v.locked)
				end
			end

			if v.distanceToPlayer and v.distanceToPlayer < v.maxDistance then
				inZone = true
				

				if v.size then
					size = v.size
				end
				if v.locked then
					locked = true
				else
					locked = false
				end
				if v.isAuthorized then
					hasAuth = true
				elseif not v.isAuthorized then
					hasAuth = false
				end

				if IsControlJustReleased(0, 38) then
					if v.isAuthorized then
						v.locked = not v.locked
						locked = v.locked
						TriggerServerEvent('esx_doorlock:updateState', k, v.locked) -- broadcast new state of the door to everyone
						shown = false
					end
				end
			end
		end

		if inZone and not shown then
			shown = true
			if locked and hasAuth then
				exports['okokTextUI']:Open('[E] Locked', 'lightred', 'left')
			elseif not locked and hasAuth then
				exports['okokTextUI']:Open('[E] Unlocked', 'lightgreen', 'left')
			elseif locked then
				exports['okokTextUI']:Open('Locked', 'lightred', 'left')
			else
				exports['okokTextUI']:Open('Unlocked', 'lightgreen', 'left')
			end
		elseif not inZone and shown then
			exports['okokTextUI']:Close()
			shown = false
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)
```