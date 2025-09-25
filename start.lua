-- Mortar mission
-- Spawn a truck (a Bradford)
-- Drive to a destination
-- Drop off a mortar and some infantry
-- Shell a target
-- Get back into the truck
-- Drive to another location

function RouteGroupTo(grp, toZone, onRoad, wpFunc)
    -- Create a waypoint from the unit's location
    local fromCoord = grp:GetCoordinate()

    -- Next zone
    grp:I(grp:GetName() .. ": go to " .. toZone:GetName())
    grp.destZone = toZone
    
    -- Create a waypoint to the zone's location
    local toCoord = toZone:GetCoordinate()
    
    -- Create the route
    local speed = grp:GetSpeedMax() * 0.90
    grp:I(" ... speed: " .. speed)

    if (onRoad) then
        grp:RouteGroundOnRoad(toCoord, speed, 3, nil, wpFunc)
    else
        grp:RouteGroundTo(toCoord, speed, nil, 3)
    end
    return grp
end

function mortarDeployFunc(grp, wayPointNum, numWayPoints)
    grp:I(grp:GetName() .. ": at waypoint #" .. wayPointNum .. " of " .. numWayPoints)
    if (wayPointNum == numWayPoints) then
        grp:I(" reached target!")
        local attackGrp = spawnOne(grp.attackSpawner, grp.destZone)
        function attackGrp:OnEventShot(eventData)
            local nShells = self:GetArtiShells()
            self:I("Mortar shot event fired!")
            self:I("Ammo left:" .. nShells)
            if (nShells == 0) then
                self:I("Out of shells!")
            end
        end
        local vec2 = grp.targetZone:GetVec2()
        local fire = attackGrp:TaskFireAtPoint(vec2, 10, 10)
        attackGrp:SetTask(fire, 5)
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
for i=1, 10 do
    addZoneIfFound("Spawn", i, spawnZones)
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
    grp.destZone = destZones[i]
    grp.targetZone = targetZones[i]
    grp.attackSpawner = mortarSpawner
    RouteGroupTo(grp, grp.destZone, true, mortarDeployFunc)
end
