-- Configeration just the lock distances...
interactionDistance = 3.5 --The radius you have to be in to interact with the vehicle.
lockDistance = 8 --The radius you have to be in to lock your vehicle.

engineoff = false
saved = false

local PlayerData              = {}
ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)



-- ENGINE
IsEngineOn = true
RegisterNetEvent('engine')
AddEventHandler('engine',function() 
	local player = GetPlayerPed(-1)
	
	if (IsPedSittingInAnyVehicle(player)) then 
		local vehicle = GetVehiclePedIsIn(player,false)
		
		if IsEngineOn == true then
			IsEngineOn = false
			SetVehicleEngineOn(vehicle,false,false,false)
		else
			IsEngineOn = true
			SetVehicleUndriveable(vehicle,false)
			SetVehicleEngineOn(vehicle,true,false,false)
		end
		
		while (IsEngineOn == false) do
			SetVehicleUndriveable(vehicle,true)
			Citizen.Wait(0)
		end
	end
end)

RegisterNetEvent('engineoff')
AddEventHandler('engineoff',function() 
		local player = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(player)) then 
            local vehicle = GetVehiclePedIsIn(player,false)
			engineoff = true
			ShowNotification("Engine ~r~off~s~.")
			while (engineoff) do
			SetVehicleEngineOn(vehicle,false,false,false)
			SetVehicleUndriveable(vehicle,true)
			Citizen.Wait(0)
			end
		end
end)
RegisterNetEvent('engineon')
AddEventHandler('engineon',function() 
    local player = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(player)) then 
            local vehicle = GetVehiclePedIsIn(player,false)
			engineoff = false
			SetVehicleUndriveable(vehicle,false)
			SetVehicleEngineOn(vehicle,true,false,false)
			ShowNotification("Engine ~g~on~s~.")
	end
end)

-- BOOOT
RegisterNetEvent('trunk')
AddEventHandler('trunk',function() 
	local player = GetPlayerPed(-1)
			if controlsave_bool == true then
			 	vehicle = saveVehicle
			else
			 	vehicle = GetVehiclePedIsIn(player,true)
			 end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,5)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,5,0,0)
				else
				SetVehicleDoorShut(vehicle,5,0)
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
end)

-- DOORS
RegisterNetEvent('d1')
AddEventHandler('d1',function() 
	local player = GetPlayerPed(-1)
    		if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			local isopen = GetVehicleDoorAngleRatio(vehicle,0) 
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,0,0,0)
				else
				SetVehicleDoorShut(vehicle,0,0)
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
end)
RegisterNetEvent('d2')
AddEventHandler('d2',function() 
	local player = GetPlayerPed(-1)
    		if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			local isopen = GetVehicleDoorAngleRatio(vehicle,1) 
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,1,0,0)
				else
				SetVehicleDoorShut(vehicle,1,0)
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
end)
RegisterNetEvent('d3')
AddEventHandler('d3',function() 
	local player = GetPlayerPed(-1)
    		if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			local isopen = GetVehicleDoorAngleRatio(vehicle,2) 
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,2,0,0)
				else
				SetVehicleDoorShut(vehicle,2,0)
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
end)
RegisterNetEvent('d4')
AddEventHandler('d4',function() 
	local player = GetPlayerPed(-1)
    		if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			local isopen = GetVehicleDoorAngleRatio(vehicle,3) 
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,3,0,0)
				else
				SetVehicleDoorShut(vehicle,3,0)
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
end)	


-- HOOD 
RegisterNetEvent('hood')
AddEventHandler('hood',function() 
	local player = GetPlayerPed(-1)
    	if controlsave_bool == true then
			vehicle = saveVehicle
		else
			vehicle = GetVehiclePedIsIn(player,true)
		end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,4)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,4,0,0)
				else
				SetVehicleDoorShut(vehicle,4,0)
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
end)

-- LOCKDOORS
Citizen.CreateThread(function()
	local dict = "anim@mp_player_intmenu@key_fob@"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(0)
	end
    while true do
	    Wait(0)
	    if IsControlJustReleased(0, 303) and PlayerData.job ~= nil and PlayerData.job.name == 'police' then
	        local player = GetPlayerPed(-1)
            local vehicle = GetVehiclePedIsIn(player,true)
	        local islocked = GetVehicleDoorLockStatus(vehicle)
	        local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
		    if DoesEntityExist(vehicle) then
			    if distanceToVeh <= lockDistance then
				    if (islocked == 1)then
				    SetVehicleDoorsLocked(vehicle, 2)
					 ShowNotification("You have locked your ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~.")
					if not IsPedInAnyVehicle(PlayerPedId(), true) then
						TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
						SetVehicleLights(vehicle, 5)
						Wait (200)
						SetVehicleLights(vehicle, 0)
						Wait (200)
						SetVehicleLights(vehicle, 2)
						Wait (400)
						SetVehicleLights(vehicle, 0)
					end
			    else
				    SetVehicleDoorsLocked(vehicle,1)
					ShowNotification("You have unlocked your ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~.")
					if not IsPedInAnyVehicle(PlayerPedId(), true) then
						TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
						SetVehicleLights(vehicle, 2)
						Wait (200)
						SetVehicleLights(vehicle, 0)
						Wait (200)
						SetVehicleLights(vehicle, 2)
						Wait (400)
						SetVehicleLights(vehicle, 0)
					end
			    end
			    else
				    ShowNotification("~r~You must be near your vehicle to do that.")
			    end
		    else
			    ShowNotification("~r~Get in to save vehicle.")
			end
		end
	end
end)

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end


