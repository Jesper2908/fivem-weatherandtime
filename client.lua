RegisterNetEvent("ChangeTime")
AddEventHandler("ChangeTime", function(hour, minute, second)
    NetworkOverrideClockTime(hour, minute, second)
end)

local frozen = false

function FreezeTime(freeze)
    frozen = freeze
    if frozen then
        NetworkOverrideClockTime(GetClockHours(), GetClockMinutes(), GetClockSeconds())
    else
        NetworkClearClockOverride()
    end
end

RegisterNetEvent("Freeze")
AddEventHandler("Freeze", function(freeze)
    FreezeTime(freeze)
end)

function ChangeWeather(weather)
    SetWeatherTypeOverTime(weather, 15.0)
end

RegisterNetEvent("ChangeWeather")
AddEventHandler("ChangeWeather", function(weather)
    ChangeWeather(weather)
end)

function IsValidWeather(weather)
    local validWeathers = {
        "CLEAR",
        "EXTRASUNNY",
        "CLOUDS",
        "OVERCAST",
        "RAIN",
        "CLEARING",
        "THUNDER",
        "SMOG",
        "FOGGY",
        "XMAS",
        "SNOWLIGHT",
        "BLIZZARD"
    }
    for i, validWeather in ipairs(validWeathers) do
        if weather == validWeather then
            return true
        end
    end
    return false
end