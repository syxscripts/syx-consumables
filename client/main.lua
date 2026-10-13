local active = false
local alcoholLevel = 0
local drunkUntil = 0

local function notify(description, nType)
    if Config.Notify then
        lib.notify({ title = 'SYX Consumables', description = description, type = nType or 'inform' })
    end
end

local function loadAnim(dict)
    if not dict or dict == '' then return false end
    RequestAnimDict(dict)
    local timeout = GetGameTimer() + 5000
    while not HasAnimDictLoaded(dict) do
        Wait(10)
        if GetGameTimer() > timeout then return false end
    end
    return true
end

local function loadModel(model)
    if not model or model == '' then return nil end
    local hash = type(model) == 'number' and model or joaat(model)
    if not IsModelInCdimage(hash) or not IsModelValid(hash) then return nil end
    RequestModel(hash)
    local timeout = GetGameTimer() + 5000
    while not HasModelLoaded(hash) do
        Wait(10)
        if GetGameTimer() > timeout then return nil end
    end
    return hash
end

local function attachProp(item, ped)
    if not item.prop then return nil end
    local model = loadModel(item.prop)
    if not model then return nil end
    local coords = GetEntityCoords(ped)
    local object = CreateObject(model, coords.x, coords.y, coords.z + 0.2, true, true, false)
    local bone = GetPedBoneIndex(ped, item.bone or 18905)
    local p = item.pos or vec3(0.12, 0.02, 0.02)
    local r = item.rot or vec3(0.0, 0.0, 0.0)
    AttachEntityToEntity(object, ped, bone, p.x, p.y, p.z, r.x, r.y, r.z, true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(model)
    return object
end

local function applyAlcohol(amount)
    if not Config.Alcohol.enabled or not amount or amount <= 0 then return end
    alcoholLevel = math.min(5, alcoholLevel + amount)
    drunkUntil = GetGameTimer() + Config.Alcohol.drunkDuration
    if Config.Alcohol.screenEffect and Config.Alcohol.screenEffect ~= '' then
        AnimpostfxPlay(Config.Alcohol.screenEffect, Config.Alcohol.screenEffectDuration, false)
    end
    if Config.Alcohol.blur then
        TriggerScreenblurFadeIn(500)
        CreateThread(function()
            Wait(Config.Alcohol.blurDuration)
            TriggerScreenblurFadeOut(1000)
        end)
    end
    if alcoholLevel >= 2 then
        local player = PlayerId()
        RequestAnimSet(Config.Alcohol.drunkWalk)
        local timeout = GetGameTimer() + 3000
        while not HasAnimSetLoaded(Config.Alcohol.drunkWalk) and GetGameTimer() < timeout do Wait(10) end
        if HasAnimSetLoaded(Config.Alcohol.drunkWalk) then SetPedMovementClipset(PlayerPedId(), Config.Alcohol.drunkWalk, 1.0) end
        SetTimeout(Config.Alcohol.drunkDuration, function()
            if GetGameTimer() >= drunkUntil then
                ResetPedMovementClipset(PlayerPedId(), 0.0)
                AnimpostfxStop(Config.Alcohol.screenEffect)
                alcoholLevel = 0
            end
        end)
    end
end

local function consume(data, slot)
    if active then
        notify('You are already consuming something.', 'error')
        return
    end

    local itemName = data and data.name
    local item = itemName and Config.Items[itemName]
    if not item then
        notify(('Item %s is not configured in config.lua.'):format(tostring(itemName)), 'error')
        return
    end

    local ped = PlayerPedId()
    if IsEntityDead(ped) or IsPedInAnyVehicle(ped, false) then
        notify('You cannot consume this right now.', 'error')
        return
    end

    active = true
    local prop
    local animLoaded = item.anim and loadAnim(item.anim.dict)
    if animLoaded and item.anim.clip then
        TaskPlayAnim(ped, item.anim.dict, item.anim.clip, 8.0, -8.0, -1, 49, 0.0, false, false, false)
    end
    prop = attachProp(item, ped)

    local success = lib.progressBar({
        duration = item.duration or Config.DefaultDuration,
        label = ('%s...'):format(item.label or 'Consuming'),
        useWhileDead = false,
        canCancel = true,
        disable = { move = true, car = true, combat = true },
        position = Config.ProgressPosition
    })

    ClearPedSecondaryTask(ped)
    if prop and DoesEntityExist(prop) then DeleteEntity(prop) end
    if item.anim then RemoveAnimDict(item.anim.dict) end
    active = false

    if not success then
        notify(Config.CancelMessage, 'error')
        return
    end

    -- ox_inventory's useItem callback removes the item only after this callback succeeds.
    exports.ox_inventory:useItem(data, function(usedData)
        if not usedData then return end
        local hunger = tonumber(item.hunger) or 0
        local thirst = tonumber(item.thirst) or 0
        if hunger > 0 then TriggerEvent('esx_status:add', 'hunger', math.floor(hunger * 10000)) end
        if thirst > 0 then TriggerEvent('esx_status:add', 'thirst', math.floor(thirst * 10000)) end
        if item.type == 'alcohol' then applyAlcohol(item.alcohol or 1) end
        notify(('You consumed %s.'):format(item.label or itemName), 'success')
    end)
end

for itemName in pairs(Config.Items) do
    exports(itemName, consume)
end

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    local ped = PlayerPedId()
    ClearPedSecondaryTask(ped)
    ResetPedMovementClipset(ped, 0.0)
    AnimpostfxStopAll()
    TriggerScreenblurFadeOut(0)
end)
