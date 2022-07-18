mp.observe_property('playlist-count', 'number', function ()
    local playlist = mp.get_property_native('playlist')
    for i = #playlist, 1, -1 do
        for _, extension in pairs({'cue', 'txt', 'jpg', 'jpeg', 'png', 'log', 'description', 'en.vtt', 'info.json', 'webp'}) do
            if playlist[i].filename:match('%.' .. extension .. '$') then
                mp.commandv('playlist-remove', i-1)
            end
        end
    end
end)
