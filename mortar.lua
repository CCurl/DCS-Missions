-- Mortar mission
-- Spawn a truck (a Bradford)
-- Drive to a destination
-- Drop off a mortar and some infantry
-- Shell a target
-- Get back into the truck
-- Drive to another location

function RouteGroupTo(grp, toZone, onRoad, wpFunc, delay)
    -- Create a waypoint from the unit's location
    local fromCoord = grp:GetCoordinate()
    if ((delay == nil) or (delay == 0)) then delay = 5 end

    -- Next zone
    local rd = onRoad and "on" or "off"
    local msg = grp:GetName() .. ": go to " .. toZone:GetName() .. ", " .. rd .. " road"
    grp:I(msg)
    grp.destZone = toZone
    
    -- Create a waypoint to the zone's location
    local toCoord = toZone:GetCoordinate()
    
    -- Create the route
    local speed = grp:GetSpeedMax() * 0.90
    grp:I(" ... speed: " .. speed)

    if (onRoad) then
        grp:RouteGroundOnRoad(toCoord, speed, delay, nil, wpFunc)
    else
        grp:RouteGroundTo(toCoord, speed, nil, delay)
    end
    return grp
end

function mortarDeployFunc(grp, wayPointNum, numWayPoints)
    grp:I(grp:GetName() .. ": at waypoint #" .. wayPointNum .. " of " .. numWayPoints)
    if (wayPointNum == numWayPoints) then
        grp:I(" reached target, setting up mortar")
        local mortarGroup = spawnOne(grp.attackSpawner, grp.destZone)
        mortarGroup:HandleEvent(EVENTS.Shot)
        function mortarGroup:OnEventShot(eventData)
            local unit = eventData.IniUnit
            unit:I("Mortar shot event fired!")
            local nShells = unit:GetArtiShells()
            unit:I("Ammo left:" .. nShells)
            if (nShells < 11) then
                unit:I("All done!")
                -- Simulate getting back into the transport
                unit:GetGroup():Destroy()
                -- Go somewhere
                RouteGroupTo(grp, grp.homeZone, true, nil, 15)
            end
        end
        local vec2 = grp.targetZone:GetVec2()
        local fireShells = mortarGroup:TaskFireAtPoint(vec2, 10, 10)
        mortarGroup:SetTask(fireShells, 5)
    end
end

function addZoneIfFound(prefix, num, zones)
    local zone = ZONE:FindByName(prefix .. "-" .. num)
    if (zone) then zones[num] = zone end
end

function spawnOne(spawner, inZone, rand)
    return spawner:SpawnInZone(inZone, rand)
end

spawnZones = {}
destZones = {}
targetZones = {}
for i=1, 13 do
    addZoneIfFound("Spawn", i, spawnZones)
end
for i=1, 15 do
    addZoneIfFound("Goto", i, destZones)
    addZoneIfFound("Target", i, targetZones)
end

-- mrapSpawner = SPAWN:New("MRAP")
-- m249Spawner = SPAWN:New("M249")
-- m4Spawner = SPAWN:New("M4")
mortarSpawner = SPAWN:New("MORTAR")
bedfordSpawner = SPAWN:New("BEDFORD")

for i=1, #spawnZones do
    local grp = spawnOne(bedfordSpawner, spawnZones[i], true)
    grp.homeZone = spawnZones[i]
    grp.destZone = destZones[i]
    grp.targetZone = targetZones[i]
    grp.attackSpawner = mortarSpawner
    RouteGroupTo(grp, grp.destZone, true, mortarDeployFunc, 15)
end
