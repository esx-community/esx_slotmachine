ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_slotmachine:sv:1')
AddEventHandler('esx_slotmachine:sv:1', function(amount,a,b,c)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	amount = tonumber(amount)
	if (xPlayer.getAccount('black_money').money >= tonumber(amount)) then
		xPlayer.removeAccountMoney('black_money', (amount))
		TriggerClientEvent("esx_slotmachine:1", source, tonumber(amount), tostring(a), tostring(b), tostring(c))
	elseif (xPlayer.getMoney() >= tonumber(amount)) then
		xPlayer.removeMoney(amount)
		TriggerClientEvent("esx_slotmachine:1", source, tonumber(amount), tostring(a), tostring(b), tostring(c))
	else
		TriggerClientEvent('esx:showNotification', source, "No tienes suficiente dinero...")
	end
end)

RegisterServerEvent('esx_slotmachine:sv:2')
AddEventHandler('esx_slotmachine:sv:2', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	    xPlayer.addMoney(amount)
	    -- xPlayer.addAccountMoney('black_money', (amount))
	    TriggerClientEvent('esx:showNotification', source, "You WON : " .. amount .. "$")
	end)
