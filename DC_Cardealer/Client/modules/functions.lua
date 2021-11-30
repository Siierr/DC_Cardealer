--- /$$$$$$$   /$$$$$$           /$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$ 
---| $$__  $$ /$$__  $$         /$$__  $$| $$  | $$ /$$__  $$| $$__  $$
---| $$  \ $$| $$  \__/        | $$  \__/| $$  | $$| $$  \ $$| $$  \ $$
---| $$  | $$| $$              |  $$$$$$ | $$$$$$$$| $$  | $$| $$$$$$$/
---| $$  | $$| $$               \____  $$| $$__  $$| $$  | $$| $$____/ 
---| $$  | $$| $$    $$         /$$  \ $$| $$  | $$| $$  | $$| $$      
---| $$$$$$$/|  $$$$$$/        |  $$$$$$/| $$  | $$|  $$$$$$/| $$      
---|_______/  \______/  /$$$$$$ \______/ |__/  |__/ \______/ |__/      
---                   |______/     


Create3D = function(coords, texto)

    
    local x, y, z = table.unpack(coords)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1.5/dist)*1
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(8)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(5)
        AddTextComponentString(texto)
        DrawText(_x,_y)
    end
end

SpawnNPC = function(modelo, x,y,z,h)
    hash = GetHashKey(modelo)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    crearNPC = CreatePed(5, hash, x,y,z,h, false, true)
    FreezeEntityPosition(crearNPC, true)
    SetEntityInvincible(crearNPC, true)
    SetBlockingOfNonTemporaryEvents(crearNPC, true)

    TaskStartScenarioInPlace(crearNPC, "WORLD_HUMAN_DRUG_DEALER", 0, false)
end


function MenuProcesar()-- MENU PARTES ARMAS
    local elems = {
        {label = 'ITEMS NECESARIOS', value = 'nil'},
        {label = "cannabis = 5 bolsa hermetica = 1", value = 'nill'},
        {label = 'Pulsa aqui para meter los cogollos en la bolsa', value = 'hacerfardo'},
 
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menuPerso',{
        title = 'procesar marihuana',
        align = 'left',
        elements = elems
    },
    function(data, menu)

        if data.current.value == 'hacerfardo' then
            ESX.TriggerServerCallback("item:bolsa", function(item) 
                ESX.TriggerServerCallback("item:cogollos", function(item2) 


                if item  >= 1 then 
                    if item2 >= 1 then
                    TriggerServerEvent("Give:fardo")
                    else
                    exports['okokNotify']:Alert("Me da a mi...", "Te faltan cogollos", "2000", 'error')
                end
            else
                exports['okokNotify']:Alert("Me da a mi...", "Te falta una bolsa", "2000", 'error')
            end
        end , item2)

        end , item)
    end
    end,
    function(data, menu)
        menu.close()
    end)
end
SpawnVeicle = function(model, coords)
    ESX.Game.SpawnVehicle(model, coords, 156.74, function(veh)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
       --    exports["LegacyFuel"]:SetFuel(veh, 100)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    end)
end