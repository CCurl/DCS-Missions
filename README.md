# DCS Missions

A collection of Lua scripts for Digital Combat Simulator (DCS) missions using the MOOSE framework.

## Overview

This repository contains mission scripts that automate various military scenarios in DCS World, including ground operations and air-to-air combat scenarios. The scripts leverage the MOOSE (Mission Object Oriented Scripting Environment) framework to create dynamic and engaging mission experiences.

## Mission Scripts

### 🚛 Ground Operations

#### `mortar.lua` - Mortar Strike Mission
A comprehensive ground mission script that simulates:
- Transport vehicle (Bedford truck) deployment
- Route planning with waypoint navigation
- Mortar team deployment and setup
- Artillery strikes on designated targets
- Return-to-base operations

**Key Features:**
- Automated routing with on-road/off-road options
- Zone-based spawn and target systems (up to 13 spawn zones, 15 destination/target zones)
- Event-driven mortar firing with ammunition tracking
- Dynamic group management and cleanup

#### `start.lua` - Basic Mortar Mission
A simplified version of the mortar mission with:
- Basic transport and deployment mechanics
- Zone-based operations (up to 10 zones each for spawn, destination, and targets)
- Streamlined mortar operations

### ✈️ Air Operations

#### `A2A.lua` - Air-to-Air Dispatcher
An advanced air defense system for the Syria theater featuring:
- **EWR Integration**: Syria-based Early Warning Radar systems
- **Multi-Base Operations**: Hama, Bassel Al-Assad, and Abu al-Duhur airbases
- **Aircraft Types**: MiG-21 (Fishbed), MiG-23 (Flogger), and MiG-25 (Foxbat)
- **Dynamic Squadron Management**: Random aircraft counts and overhead factors
- **GCI Operations**: Ground Controlled Intercept with 800-1200m engagement altitudes
- **Cold Start**: Aircraft spawn with engines off for realistic startup procedures

**Airbases and Aircraft:**
- **Hama**: MiG-23 Flogger, MiG-21 Fishbed
- **Bassel Al-Assad**: MiG-21 Fishbed, MiG-23 Flogger, MiG-25 Foxbat
- **Abu al-Duhur**: MiG-25 Foxbat, MiG-23 Flogger, MiG-21 Fishbed

## Prerequisites

- **DCS World**: Latest stable version
- **MOOSE Framework**: Required for all mission scripts
- **Syria Map**: Required for A2A operations
- **Mission Editor**: For setting up zones and unit templates

## Installation

1. Clone this repository to your DCS missions folder
2. Ensure MOOSE framework is properly installed in your DCS environment
3. Load the appropriate script into your mission using the mission editor

## Usage

### Setting Up Zones

For ground operations, create the following zones in the mission editor:
- **Spawn Zones**: `Spawn-1`, `Spawn-2`, etc.
- **Destination Zones**: `Goto-1`, `Goto-2`, etc.
- **Target Zones**: `Target-1`, `Target-2`, etc.

### Setting Up Units

Create the following unit templates:
- `BEDFORD`: Transport vehicle template
- `MORTAR`: Mortar team template
- Aircraft templates as referenced in `A2A.lua`

### Script Integration

Add the desired script to your mission's triggers:
```lua
-- For mortar missions
dofile("path/to/mortar.lua")

-- For air-to-air operations  
dofile("path/to/A2A.lua")
```

## Key Functions

### Ground Operations
- `RouteGroupTo(grp, toZone, onRoad, wpFunc, delay)`: Route planning and execution
- `mortarDeployFunc(grp, wayPointNum, numWayPoints)`: Deployment and attack logic
- `spawnOne(spawner, inZone, rand)`: Unit spawning helper
- `addZoneIfFound(prefix, num, zones)`: Dynamic zone detection

### Air Operations
- Automated squadron management
- Dynamic aircraft allocation
- GCI engagement protocols
- Multi-base coordination

## Features

- **Dynamic Spawning**: Randomized unit counts and deployment locations
- **Event-Driven Logic**: Responsive to in-game events and conditions
- **Modular Design**: Easy to customize and extend
- **Realistic Operations**: Authentic military procedures and tactics
- **Multi-Theater Support**: Designed for various DCS maps and scenarios

## Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- MOOSE Framework developers for providing the powerful scripting environment
- DCS World community for continued support and feedback
- Eagle Dynamics for the DCS World platform

---

**Note**: These scripts are designed for educational and entertainment purposes within the DCS World simulation environment.