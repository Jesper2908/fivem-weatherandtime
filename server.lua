print("Running on server side")
print("SCRIPT MADE BY: Jesper#5986")
-- Create the command "/time"
RegisterCommand("settime", function(source, args)
    local hour = tonumber(args[1])
    local minute = tonumber(args[2])

    if hour == nil or minute == nil or hour > 23 or hour < 0 or minute > 59 or minute < 0 then
        TriggerClientEvent("chatMessage", source, "Invalid arguments. Usage: /time <hour> <minute>")
        return
    end
    TriggerClientEvent("ChangeTime", source, hour, minute, 0)
end, false)

-- Create the command "/freeze"
RegisterCommand("freezetime", function(source)
    TriggerClientEvent("Freeze", source, not frozen)
    if frozen then
        print("Time is now unfrozen")
    else
        print("Time is now frozen")
    end
    frozen = not frozen
end, false)

-- Create the command "/weather"
RegisterCommand("setweather", function(source, args)
    local weather = args[1]

    if weather == nil or not IsValidWeather(weather) then
        TriggerClientEvent("chatMessage", source, "Invalid arguments. Usage: /weather <weather>")
        return
    end
    TriggerClientEvent("ChangeWeather", source, weather)
end, false)

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