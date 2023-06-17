ESX = exports["es_extended"]:getSharedObject()
local coordinategoto = nil
local noclip = false

RegisterKeyMapping("temperature", "Admin Menu Open", "keyboard", "F5")

RegisterCommand("temperature", function()
    lib.registerContext({
        id = 'menu',
        title = 'MENU TEMPERATURA',
        options = {
          {
            title = 'Gestione Tempo',
            description = 'Gestione Tempo (Giorno, Notte, Ecc..)',
            icon = 'fa-solid fa-moon',
            iconColor = 'orange',
            onSelect = function()
                menutempo()
            end,
          },
          {
            title = 'Gestione Temperatura',
            description = 'Gestione Temperatura (Sole, Pioggia, ecc..)',
            icon = 'fa-solid fa-cloud-showers-heavy',
            iconColor = 'orange',
            onSelect = function()
                menutemperatura()
            end,
          },
          {
            title = 'Creator',
            description = 'Created By YoshiTv#4337',
            icon = 'fa-solid fa-crown',
            iconColor = 'orange',
          },
        }
      })
    lib.showContext('menu')
end)
--------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------- GESTIONE TEMPO -----------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
function menutempo()
    lib.registerContext({
      id = 'menu',
      title = 'Gestione Tempo',
      options = {
        {
            title = 'GIORNO',
            icon = 'fa-solid fa-calendar-check',
            iconColor = 'orange',
            onSelect = function()
              giorno()
            end,
        },
        {
            title = 'NOTTE',
            icon = 'fa-solid fa-moon',
            iconColor = 'orange',
            onSelect = function()
                notte()
            end,
        },
      }
    })
    lib.showContext('menu')
end
--------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------- FUNZIONI TEMPO -----------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
giorno = function ()
    NetworkOverrideClockTime(12, 00, 00)
    lib.notify({
        title = 'Gestione Tempo',
        description = 'Hai impostato Sole',
        type = 'success'
    })
end

notte = function ()
    NetworkOverrideClockTime(21, 00, 00)
    lib.notify({
        title = 'Gestione Tempo',
        description = 'Hai impostato Notte',
        type = 'success'
    })
end
--------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------- GESTIONE TEMPERATURA -----------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
function menutemperatura()
    lib.registerContext({
      id = 'menu',
      title = 'Gestione Temperatura',
      options = {
        {
            title = 'SOLE',
            icon = 'fa-solid fa-sun',
            iconColor = 'orange',
            onSelect = function()
              sole()
            end,
        },
        {
            title = 'PIOGGIA',
            icon = 'fa-solid fa-cloud-showers-heavy',
            iconColor = 'orange',
            onSelect = function()
              pioggia()
            end,
        },
        {
            title = 'NEVE',
            icon = 'fa-solid fa-snowflake',
            iconColor = 'orange',
            onSelect = function()
                neve()
            end,
        },
        {
            title = 'RIMUOVI NEVE',
            icon = 'fa-solid fa-snowplow',
            iconColor = 'orange',
            onSelect = function()
                rimneve()
            end,
        },
      }
    })
    lib.showContext('menu')
end
--------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------- FUNZIONI TEMPERATURA -----------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
sole = function ()
    ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypePersist("EXTRASUNNY")
    SetWeatherTypeNow("EXTRASUNNY")
    SetWeatherTypeNowPersist("EXTRASUNNY")
    lib.notify({
        title = 'Gestione Tempo',
        description = 'Hai Impostato Sole',
        type = 'success'
    })
end

pioggia = function ()
    SetWeatherTypePersist("RAIN")
    SetWeatherTypeNowPersist("RAIN")
    SetWeatherTypeNow("RAIN")
    SetOverrideWeather("RAIN")
    SetTimecycleModifier('RAIN')
    lib.notify({
        title = 'Gestione Tempo',
        description = 'Hai Impostato Pioggia',
        type = 'success'
    })
end

neve = function ()
    SetWeatherTypePersist("XMAS")
    SetWeatherTypeNowPersist("XMAS")
    SetWeatherTypeNow("XMAS")
    SetOverrideWeather("XMAS")
    SetTimecycleModifier('CS1_railwayB_tunnel')
    lib.notify({
        title = 'Gestione Tempo',
        description = 'Hai Impostato Neve',
        type = 'success'
    })
end

rimneve = function ()
    SetWeatherTypePersist("CLEAR")
	SetWeatherTypeNowPersist("CLEAR")
	SetWeatherTypeNow("CLEAR")
	SetOverrideWeather("CLEAR")
    lib.notify({
        title = 'Gestione Tempo',
        description = 'Hai Rimosso Notte',
        type = 'success'
    })
end
--------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------- FINE ---------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------