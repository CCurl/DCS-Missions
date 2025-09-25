DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "Syria EWR" } )
DetectionSetGroup:FilterStart()

Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )

A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

SyriaBorderZone = ZONE_POLYGON:New( "Syria Border", GROUP:FindByName( "Syria Border" ) )
A2ADispatcher:SetBorderZone( SyriaBorderZone )
A2ADispatcher:SetEngageRadius( 200000 )
A2ADispatcher:SetTacticalDisplay( true )
A2ADispatcher:SetIntercept( 450 )

-- Hama Flogger
A2ADispatcher:SetSquadron( "Hama Flogger", AIRBASE.Syria.Hama, { "MiG-23 Hama" }, math.random(2, 4) )
A2ADispatcher:SetSquadronGci( "Hama Flogger", 900, 1200 )
A2ADispatcher:SetSquadronTakeoffFromParkingCold( "Hama Flogger" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "Hama Flogger" )
A2ADispatcher:SetSquadronGrouping( "Hama Flogger", 2 )
A2ADispatcher:SetSquadronOverhead( "Hama Flogger", math.random(5, 40) / 10 )

-- Hama Fishbed
A2ADispatcher:SetSquadron( "Hama Fishbed", AIRBASE.Syria.Hama, { "MiG-21 Hama" }, math.random(0, 4) )
A2ADispatcher:SetSquadronGci( "Hama Fishbed", 900, 1200 )
A2ADispatcher:SetSquadronTakeoffFromParkingCold( "Hama Fishbed" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "Hama Fishbed" )
A2ADispatcher:SetSquadronGrouping( "Hama Fishbed", 2 )
A2ADispatcher:SetSquadronOverhead( "Hama Fishbed", math.random(5, 40) / 10 )

-- Bassel Al-Assad Fishbed
A2ADispatcher:SetSquadron( "Bassel Al-Assad Fishbed", AIRBASE.Syria.Bassel_Al_Assad, { "MiG-21 Bassel Al-Assad" }, math.random(0, 4) )
A2ADispatcher:SetSquadronGci( "Bassel Al-Assad Fishbed", 800, 1200 )
A2ADispatcher:SetSquadronTakeoffFromParkingCold( "Bassel Al-Assad Fishbed" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "Bassel Al-Assad Fishbed" )
A2ADispatcher:SetSquadronGrouping( "Bassel Al-Assad Fishbed", 2 )
A2ADispatcher:SetSquadronOverhead( "Bassel Al-Assad Fishbed", math.random(5, 40) / 10)

-- Bassel Al-Assad Flogger
A2ADispatcher:SetSquadron( "Bassel Al-Assad Flogger", AIRBASE.Syria.Bassel_Al_Assad, { "MiG-23 Bassel Al-Assad" }, math.random(3, 5) )
A2ADispatcher:SetSquadronGci( "Bassel Al-Assad Flogger", 800, 1200 )
A2ADispatcher:SetSquadronTakeoffFromParkingCold( "Bassel Al-Assad Flogger" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "Bassel Al-Assad Flogger" )
A2ADispatcher:SetSquadronGrouping( "Bassel Al-Assad Flogger", 2 )
A2ADispatcher:SetSquadronOverhead( "Bassel Al-Assad Flogger", math.random(5, 40) / 10 )

-- Bassel Al-Assad Foxbat
A2ADispatcher:SetSquadron( "Bassel Al-Assad Foxbat", AIRBASE.Syria.Bassel_Al_Assad, { "MiG-25 Bassel Al-Assad" }, math.random(0, 1) )
A2ADispatcher:SetSquadronGci( "Bassel Al-Assad Foxbat", 800, 1200 )
A2ADispatcher:SetSquadronTakeoffFromParkingCold( "Bassel Al-Assad Foxbat" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "Bassel Al-Assad Foxbat" )
A2ADispatcher:SetSquadronGrouping( "Bassel Al-Assad Foxbat", 2 )
A2ADispatcher:SetSquadronOverhead( "Bassel Al-Assad Foxbat", math.random(5, 40) / 10 )


-- Abu al-Duhur Foxbat
A2ADispatcher:SetSquadron( "Abu al-Duhur Foxbat", AIRBASE.Syria.Abu_al_Duhur, { "MiG-25 Abu al-Duhur" }, math.random(2, 4) )
A2ADispatcher:SetSquadronGci( "Abu al-Duhur Foxbat", 800, 1200 )
A2ADispatcher:SetSquadronTakeoffFromParkingCold( "Abu al-Duhur Foxbat" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "Abu al-Duhur Foxbat" )
A2ADispatcher:SetSquadronGrouping( "Abu al-Duhur Foxbat", 2 )
A2ADispatcher:SetSquadronOverhead( "Abu al-Duhur Foxbat", math.random(5, 40) / 10 )

-- Abu al-Duhur Flogger
A2ADispatcher:SetSquadron( "Abu al-Duhur Flogger", AIRBASE.Syria.Abu_al_Duhur, { "MiG-23 Abu al-Duhur" }, math.random(2, 4) )
A2ADispatcher:SetSquadronGci( "Abu al-Duhur Flogger", 800, 1200 )
A2ADispatcher:SetSquadronTakeoffFromParkingCold( "Abu al-Duhur Flogger" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "Abu al-Duhur Flogger" )
A2ADispatcher:SetSquadronGrouping( "Abu al-Duhur Flogger", 2 )
A2ADispatcher:SetSquadronOverhead( "Abu al-Duhur Flogger", math.random(5, 40) / 10 )

-- Abu al-Duhur Fishbed
A2ADispatcher:SetSquadron( "Abu al-Duhur Fishbed", AIRBASE.Syria.Abu_al_Duhur, { "MiG-21 Abu al-Duhur" }, math.random(0, 4) )
A2ADispatcher:SetSquadronGci( "Abu al-Duhur Fishbed", 800, 1200 )
A2ADispatcher:SetSquadronTakeoffFromParkingCold( "Abu al-Duhur Fishbed" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "Abu al-Duhur Fishbed" )
A2ADispatcher:SetSquadronGrouping( "Abu al-Duhur Fishbed", 2 )
A2ADispatcher:SetSquadronOverhead( "Abu al-Duhur Fishbed", math.random(5, 40) / 10 )



A2ADispatcher:Start()