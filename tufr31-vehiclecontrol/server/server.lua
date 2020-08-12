-- ENGINE
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/engine off" then
		CancelEvent()
		TriggerClientEvent('engineoff', s)

	elseif message == "/engine on" then
		CancelEvent()
		TriggerClientEvent('engineon', s)

	elseif message == "/engine" then
		CancelEvent()
		TriggerClientEvent('engine', s)
	end
end)

-- BOOOT
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/t" then
		CancelEvent()
		TriggerClientEvent('trunk', s)
	end
end)

-- DOORS
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/d1" then
		CancelEvent()
		TriggerClientEvent('d1', s)
	end
end)

AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/d2" then
		CancelEvent()
		TriggerClientEvent('d2', s)
	end
end)
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/d3" then
		CancelEvent()
		TriggerClientEvent('d3', s)
	end
end)
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/d4" then
		CancelEvent()
		TriggerClientEvent('d4', s)
	end
end)

-- HOOD
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/h" then
		CancelEvent()
		TriggerClientEvent('hood', s)
	end
end)
