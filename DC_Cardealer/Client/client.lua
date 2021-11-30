--- /$$$$$$$   /$$$$$$           /$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$ 
---| $$__  $$ /$$__  $$         /$$__  $$| $$  | $$ /$$__  $$| $$__  $$
---| $$  \ $$| $$  \__/        | $$  \__/| $$  | $$| $$  \ $$| $$  \ $$
---| $$  | $$| $$              |  $$$$$$ | $$$$$$$$| $$  | $$| $$$$$$$/
---| $$  | $$| $$               \____  $$| $$__  $$| $$  | $$| $$____/ 
---| $$  | $$| $$    $$         /$$  \ $$| $$  | $$| $$  | $$| $$      
---| $$$$$$$/|  $$$$$$/        |  $$$$$$/| $$  | $$|  $$$$$$/| $$      
---|_______/  \______/  /$$$$$$ \______/ |__/  |__/ \______/ |__/      
---                   |______/     
ESX = nil 
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local llevando = false
local sincarga = true
Citizen.CreateThread(function()    
    while true do
        local _sleep = 1000
        local _char = PlayerPedId()
        local _charpos = GetEntityCoords(_char)
        if #(_charpos - Config.coche.cogercoche.coords ) < 4 then
            _sleep = 0
            if sincarga == true then
                Create3D(Config.coche.cogercoche.coords, "~g~E ~w~| Para robar un coche de lujo")
                if IsControlJustPressed(0,38) then
                    ESX.TriggerServerCallback("DC_Cardealer:CPalanca", function(item)
                        if item  >= 1 then
                            ESX.ShowHelpNotification("~g~Conduce rapido hasta la ubicacion que te he mandado al gps", "4000", "4000")
                            SpawnVeicle("zentorno", Config.coche.spawn.coords)
                            TriggerServerEvent("DC_Cardealer:QPalanca")
                            sincarga = false 
                            llevando = true
                            SetNewWaypoint(Config.coche.llevar.coords)
                        else
                            ESX.ShowHelpNotification("~r~No tienes una palanca consiguela y luego ven aqui", "4000")
                        end
                    end)
                end
            else 
                Create3D(Config.coche.cogercoche.coords, "~r~ya tienes un encargo acabalo antes de coger otro")
            end
        end
        Citizen.Wait(_sleep)
    end
end)
Citizen.CreateThread(function()
    while true do 
        local _sleep = 1000
        local _char = PlayerPedId()
        local _charpos = GetEntityCoords(_char)
        local _pedCar = GetVehiclePedIsIn(_char)
        local dinero = math.random(Config.money.min, Config.money.max )

        if #(_charpos - Config.coche.llevar.coords) < 4 then
        _sleep = 0
            if llevando == true then 
                Create3D(Config.coche.llevar.coords,"~g~E ~w~| Para dejar el coche y coger la maleta de dinero")
                if IsControlJustPressed(0,38) then
                    TriggerServerEvent("DC_Cardealer:DDinero", dinero)
                    ESX.Game.DeleteVehicle(_pedCar)
                    ESX.ShowHelpNotification("~g~Gracias por el coche hay tienes tu maletin cuenta bien el dinero pero deberia de haber ~o~"..dinero.."$", "4000")
                    llevando = false
                    sincarga = true
                end
            end
        end
        Citizen.Wait(_sleep)
    end
end)