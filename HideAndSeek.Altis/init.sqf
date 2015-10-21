// init.sqf

// object types available as hideouts 
// type name, statistics multiplier, XYZ translation, Z rotation, may be used at initialization
hsObjectTypes =                 [["Land_BarrelEmpty_F",				5,	[0,0,0],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_BarrelEmpty_grey_F",		5,	[0,0,0],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_BarrelSand_F",				5,	[0,0,0],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_BarrelTrash_F",				5,	[0,0,0],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_WaterBarrel_F",				5,	[0,0,0],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_MetalBarrel_F",				5,	[0,0,0],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_CampingChair_V2_F",			5,	[0,0,0],		180,	true]];
hsObjectTypes = hsObjectTypes + [["Land_CampingTable_small_F",		5,	[0,0,-0.1],		0,		false]];
hsObjectTypes = hsObjectTypes + [["Land_CampingChair_V1_F",			5,	[0,0,0],		180,	true]];
hsObjectTypes = hsObjectTypes + [["Land_GasTank_01_blue_F",			10,	[0,0,-0.5],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_CinderBlocks_F",			5,	[0,0,0],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_FieldToilet_F",				5,	[0,0,-1.59],	180,	false]];
hsObjectTypes = hsObjectTypes + [["Land_Portable_generator_F",		5,	[0,0,0],		90,		true]];
hsObjectTypes = hsObjectTypes + [["Land_ToiletBox_F",				5,	[0,0,-1.59],	180,	false]];
hsObjectTypes = hsObjectTypes + [["Land_WheelCart_F",				5,	[0,0,0],		0,		false]];
hsObjectTypes = hsObjectTypes + [["Land_ChairPlastic_F",			5,	[0,0,0],		90,		true]];
hsObjectTypes = hsObjectTypes + [["Land_WaterCooler_01_new_F",		5,	[0,0,0],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_WaterCooler_01_old_F",		5,	[0,0,0],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_GarbageBarrel_01_F",		20,	[0,0,0],		90,		true]];
hsObjectTypes = hsObjectTypes + [["Land_WheelieBin_01_F",			5,	[0,0,0],		180,	true]];
hsObjectTypes = hsObjectTypes + [["Land_CratesShabby_F",			5,	[0,0,0],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_Sack_F",					5,	[0,0,0],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_PressureWasher_01_F",		5,	[0,0,0],		90,		true]];
hsObjectTypes = hsObjectTypes + [["Land_AncientPillar_damaged_F",	5,	[0,0,0],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_Calvary_01_V1_F",			5,	[0,0,-0.72],	0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_Calvary_02_V1_F",			5,	[0,0,-0.4],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_Calvary_02_V2_F",			5,	[0,0,-0.4],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_BC_Basket_F",				5,	[0,1.4,-0.25],	0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_FuelStation_Feed_F",		5,	[0,0,0],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_fs_feed_F",					5,	[0,0,0],		0,		true]];
hsObjectTypes = hsObjectTypes + [["Land_CanisterPlastic_F",			5,	[0,0,-0.05],	0,		false]];
hsObjectTypes = hsObjectTypes + [["Land_PhoneBooth_01_F",			5,	[0,0,-0.1],		180,	true]];
hsObjectTypes = hsObjectTypes + [["Land_PhoneBooth_02_F",			5,	[0,0,-0.1],		180,	true]];
hsObjectTypes = hsObjectTypes + [["Land_GarbageBin_01_F",			5,	[0,0,-0.2],		180,	true]];

// weapons available to a policeman
// primary weapon, weapon, magazines, rounds in magazine, optional optics
hsPolicemanWeapon = 					[[false,	"hgun_Pistol_heavy_02_F",	"6Rnd_45ACP_Cylinder",		6,	"optic_Yorris"]];
hsPolicemanWeapon = hsPolicemanWeapon + [[false,	"hgun_Pistol_heavy_01_F",	"11Rnd_45ACP_Mag",			11,	"optic_MRD"]];
hsPolicemanWeapon = hsPolicemanWeapon + [[true, 	"SMG_02_F",					"30Rnd_9x21_Mag",			30,	"optic_Aco"]];
hsPolicemanWeapon = hsPolicemanWeapon + [[true, 	"srifle_DMR_01_F",			"10Rnd_762x54_Mag",			10,	"optic_Hamr"]];

// arena configuration
hsAvailableArenas		= [arena0,arena1,arena2,arena3,arena4,arena5];
hsAvailablePoliceSpawn0	= ["policeSpawn00","policeSpawn10","policeSpawn20","policeSpawn30","policeSpawn40","policeSpawn50"];
hsAvailablePoliceSpawn1	= ["policeSpawn01","policeSpawn11","policeSpawn21","policeSpawn31","policeSpawn41","policeSpawn51"];
hsAvailablePoliceSpawn2	= ["policeSpawn02","policeSpawn12","policeSpawn22","policeSpawn32","policeSpawn42","policeSpawn52"];
hsAvailablePoliceSpawn3	= ["policeSpawn03","policeSpawn13","policeSpawn23","policeSpawn33","policeSpawn43","policeSpawn53"];

// initializing random table according to weights
hsObjectTypeRandomTable = [];
_counter=0;
{
	_quantity = _x select 1;
	for [{_j=0},{_j<_quantity},{_j=_j+1}] do
	{
		hsObjectTypeRandomTable = hsObjectTypeRandomTable + [_counter];
	};
	_counter = _counter + 1;
} forEach hsObjectTypes;

MISSION_ROOT 		= str missionConfigFile select [0, count str missionConfigFile - 15];
f_var_radios 		= "f_param_radios" call BIS_fnc_getParamValue;
GameOver = 0;
AvailableGameEndings = ["Not over yet :)","GameOver_TimesUp","GameOver_WestDead","GameOver_EastDead","GameOver_AllDead"];

if(isServer) then
{
	// choosing an arena the game will be played on
	hsChoosenArena = "ChoosenArena" call BIS_fnc_getParamValue;
	hsArena = hsAvailableArenas select hsChoosenArena;
	hsPoliceSpawn = [ getMarkerPos (hsAvailablePoliceSpawn0 select hsChoosenArena), getMarkerPos (hsAvailablePoliceSpawn1 select hsChoosenArena), getMarkerPos (hsAvailablePoliceSpawn2 select hsChoosenArena), getMarkerPos (hsAvailablePoliceSpawn3 select hsChoosenArena) ] ;
	hsArenaArea = triggerArea hsArena;
	
	publicVariable "hsArena";
	publicVariable "hsPoliceSpawn";
	publicVariable "hsArenaArea";
	
	// create border objects
	private["_arenaX","_arenaY","_arenaPosition","_xyzpos0","_xyzpos1","_xypos0","_xypos1","_ob0","_ob1","_borderDistance"];
	_arenaX 		= hsArenaArea select 0;
	_arenaY 		= hsArenaArea select 1;
	_arenaAngle		= hsArenaArea select 2;
	_arenaRectangle	= hsArenaArea select 3;
	_arenaPosition 	= getPos hsArena;
	_borderDistance = 5; // distance between road cones at the arena border

	if (_arenaRectangle) then // arena is rectangular
	{
		for [{_j=-1.0*_arenaX},{_j<_arenaX},{_j=_j+_borderDistance}] do
		{
			_xypos0	= [_j,-1.0*_arenaY+1];
			_xypos1	= [_j, 1.0*_arenaY-1];
			_xypos0	= [_xypos0 ,-1.0*_arenaAngle] call BIS_fnc_rotateVector2D; _xyzpos0 = _xypos0 + [0]; _xyzpos0 = _arenaPosition vectorAdd _xyzpos0;
			_xypos1	= [_xypos1 ,-1.0*_arenaAngle] call BIS_fnc_rotateVector2D; _xyzpos1 = _xypos1 + [0]; _xyzpos1 = _arenaPosition vectorAdd _xyzpos1;
			_ob0	= "RoadCone_F" createVehicle _xyzpos0; _ob0 setDir random 360; _ob0 enableSimulationGlobal false; _ob0 setPos _xyzpos0;
			_ob1	= "RoadCone_F" createVehicle _xyzpos1; _ob1 setDir random 360; _ob1 enableSimulationGlobal false; _ob1 setPos _xyzpos1;
		};
		for [{_j=-1.0*_arenaY},{_j<_arenaY},{_j=_j+_borderDistance}] do
		{
			_xypos0	= [-1.0*_arenaX+1,_j];
			_xypos1	= [ 1.0*_arenaX-1,_j];
			_xypos0	= [_xypos0 ,-1.0*_arenaAngle] call BIS_fnc_rotateVector2D; _xyzpos0 = _xypos0 + [0]; _xyzpos0 = _arenaPosition vectorAdd _xyzpos0;
			_xypos1	= [_xypos1 ,-1.0*_arenaAngle] call BIS_fnc_rotateVector2D; _xyzpos1 = _xypos1 + [0]; _xyzpos1 = _arenaPosition vectorAdd _xyzpos1;
			_ob0	= "RoadCone_F" createVehicle _xyzpos0; _ob0 setDir random 360; _ob0 enableSimulationGlobal false; _ob0 setPos _xyzpos0;
			_ob1	= "RoadCone_F" createVehicle _xyzpos1; _ob1 setDir random 360; _ob1 enableSimulationGlobal false; _ob1 setPos _xyzpos1;
		};
	}
	else // arena is elliptical
	{
		// approximate circumference of the ellipse
		_ce = pi * ( 1.5*(_arenaX+_arenaY) - sqrt(_arenaX*_arenaY) );
		_angleDistance = 360 * _borderDistance / _ce;
		for [{_j=0},{_j<360},{_j=_j+_angleDistance}] do
		{
			_xypos0	= [(_arenaX-1)* cos _j,(_arenaY-1) * sin _j];
			_xypos0	= [_xypos0 ,-1.0*_arenaAngle] call BIS_fnc_rotateVector2D; _xyzpos0 = _xypos0 + [0]; _xyzpos0 = _arenaPosition vectorAdd _xyzpos0;
			_ob0	= "RoadCone_F" createVehicle _xyzpos0; _ob0 setDir random 360; _ob0 enableSimulationGlobal false; _ob0 setPos _xyzpos0;
		};
	};
	
	_objectCount = "ObjectCount" call BIS_fnc_getParamValue;
	
	// collect all placeable building positions
	_buildingPositions = [];
	_arenaR = _arenaX max _arenaY;
	_buildings = nearestObjects [_arenaPosition, ["house"], _arenaR];
	{
		_buildingInsideTrigger = [hsArena, getPos _x ] call BIS_fnc_inTrigger;
		if(_buildingInsideTrigger) then
		{
			_bldgPos = [_x] call BIS_fnc_buildingPositions;
			_buildingPositions = _buildingPositions + _bldgPos;
		};
	} forEach _buildings;
	
	// add 1/4 of objects to buildings
	_bldObjectCount = (_objectCount / 4) min (count _buildingPositions);
//	diag_log format["Adding %1 objects in buildings (%2)", _bldObjectCount,count _buildingPositions];
	for [{_j=0},{_j<_bldObjectCount},{_j=_j+1}] do
	{
		_typeIndex 			= hsObjectTypeRandomTable call BIS_fnc_selectRandom;
		_typeRecord 		= hsObjectTypes select _typeIndex;
		_typeName 			= _typeRecord select 0;
		_typeTranslation 	= _typeRecord select 2;
		_typeZRotation 		= _typeRecord select 3;
		
		_bldgIndex = floor random (count _buildingPositions);
		_bldgPos = _buildingPositions select _bldgIndex;
		
		_object = [_typeName, _bldgPos] call SDS_fnc_SpawnObject;
		_object setPosATL _bldgPos;
		_object setVariable ["TypeTranslation", _typeTranslation, true ];
		_object setVariable ["TypeRotation", _typeZRotation, true ];
		_object setDir random 360;
		
		_buildingPositions set [_bldgIndex,objNull];
		_buildingPositions = _buildingPositions - [objNull];
	};
	
	// create objects outside the buildings
//	diag_log format["Adding %1 objects outside the buildings", _objectCount-_bldObjectCount];
	for [{_j=0},{_j<(_objectCount-_bldObjectCount)},{_j=_j+1}] do
	{
		_typeIndex 			= hsObjectTypeRandomTable call BIS_fnc_selectRandom;
		_typeRecord 		= hsObjectTypes select _typeIndex;
		_typeName 			= _typeRecord select 0;
		_typeTranslation 	= _typeRecord select 2;
		_typeZRotation 		= _typeRecord select 3;

		_foundPos = false;
		_randomPos = [0,0,0];
		while{!_foundPos} do
		{
			_randomPos = [] call SDS_fnc_RandomArenaPosition;
			_foundPos = ( [_randomPos,0.5] call SDS_fnc_CheckPos ) and {[hsArena,_randomPos] call BIS_fnc_inTrigger};
		};
		
		_object = [_typeName, _randomPos] call SDS_fnc_SpawnObject;
		_object setVariable ["TypeTranslation", _typeTranslation, true ];
		_object setVariable ["TypeRotation", _typeZRotation, true ];
		_object setDir random 360;
	};
	
	// setting mission time limit
	hsTimeLimit = "TimeLimit" call BIS_fnc_getParamValue;
	if( hsTimeLimit>0 ) then
	{
		estimatedTimeLeft hsTimeLimit;
	};
	
	hsGameInitializedOnServer = true;
	publicVariable "hsGameInitializedOnServer";
	// run script that will check end mission conditions every few seconds
	[hsTimeLimit] execVM "scripts\ServerMissionConditions.sqf";
};


if(!isDedicated) then
{
	waitUntil { !(isNull player) };
	waitUntil { !(isNil "hsGameInitializedOnServer") };

//	diag_log format["Setting variables for player %1",player];
	player setVariable ["wasKilled",false, true];
	player addEventHandler ["killed", "player setVariable [""wasKilled"",true, true];"];
	// if player plays OPFOR
	if ( side (group player) isEqualTo east ) then
	{
		player setObjectTextureGlobal [0, "#(argb,8,8,3)color(1,1,1,1)"];
		player setObjectTextureGlobal [1, "#(argb,8,8,3)color(1,1,1,1)"];
	
		_typeIndex			= 0;
		_typeName			= "";
		_typeTranslation	= [0,0,0];
		_typeZRotation		= 0;
		_foundType			= false;
		while{!_foundType} do
		{
			_typeIndex			= hsObjectTypeRandomTable call BIS_fnc_selectRandom;
			_typeRecord			= hsObjectTypes select _typeIndex;
			_typeName			= _typeRecord select 0;
			_typeTranslation	= _typeRecord select 2;
			_typeZRotation		= _typeRecord select 3;
			_foundType			= _typeRecord select 4;
		};
		
		_foundPos	= false;
		_randomPos	= [0,0,0];
		while{!_foundPos} do
		{
			_randomPos	= [] call SDS_fnc_RandomArenaPosition;
			_foundPos	= ( [_randomPos,0.5] call SDS_fnc_CheckPos ) and {[hsArena,_randomPos] call BIS_fnc_inTrigger};
		};
		
		_object = [_typeName, _randomPos] call SDS_fnc_SpawnObject;
		_object setVariable ["TypeTranslation", _typeTranslation, true ];
		_object setVariable ["TypeRotation", _typeZRotation, true ];
		[_object] call SDS_fnc_AttachPlayerToObject;
		
		// exec OPFOR game logic locally
		[] execVM "scripts\CollectPoints.sqf";
	}
	else // player plays policeman
	{
		player setDir random 360;
		player setPos ( hsPoliceSpawn call BIS_fnc_selectRandom );
		
		// exec BLUFOR game logic locally
		_policemanOutOffAmmoMissionEnds = "PolicemanOutOfAmmo" call BIS_fnc_getParamValue;
		[ hsPolicemanWeapon, _policemanOutOffAmmoMissionEnds ] execVM "scripts\HuntPlayers.sqf";
	};
};
