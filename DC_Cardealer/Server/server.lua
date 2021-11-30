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
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




RegisterServerEvent("DC_Cardealer:DDinero")
AddEventHandler("DC_Cardealer:DDinero", function(dinero)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney('black_money', dinero)

end)
RegisterServerEvent("DC_Cardealer:QPalanca")
AddEventHandler("DC_Cardealer:QPalanca", function(cantidad)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem("palanca", 1)
end)


ESX.RegisterServerCallback("DC_Cardealer:CPalanca", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem("martillo").count
    cb(item)
end)




























print("^1----------------------------------------------------------------------")
print("^1[^1DC_drugs^1]...  | ^2Comprobando tu licencia... Por favor espere")
print("^5")
print("^1----------------------------------------------------------------------")
print("^1[^2DC_drugs^1]...  | ^2licencia activada")
print("^1###############################")

                                                                                         

print("########   ######         ######  ##     ##  #######  ########  ")
print("##     ## ##    ##       ##    ## ##     ## ##     ## ##     ## ")
print("##     ## ##             ##       ##     ## ##     ## ##     ## ")
print("##     ## ##               ######  ######### ##     ## ########  ")
print("##     ## ##                   ## ##     ## ##     ## ##        ")
print("##     ## ##    ##       ##    ## ##     ## ##     ## ##        ")
print("########   ######         ######  ##     ##  #######  ##        ")

                                                                                         
                                                                                         

print ("^2derechos de autor para : dark_coronel#8991 ") 
print ("^2creditos tambien a Famous RP | https://discord.gg/G99FBKUxWR")
print ("^3 para saber mas informacion de scripts unete a mi shop : https://discord.gg/pGCkAQedZc")
print("^1###############################")
print("DC_Shop : Tenemos disponicles los scripts DC_AmazonJob, DC_Blips, DC_PizzaJob, DC_Cardealer y el script de DC_Drugs que actualmente se encuentra en proceso")


        
                                                                                         
                                                                                         








