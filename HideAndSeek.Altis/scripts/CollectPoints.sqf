// CollectPoints.sqf
private["_arenaX","_arenaY","_arenaPosition","_targetPos","_targetArrows"];
_arenaX			= hsArenaArea select 0;// _arenaX = _arenaX * 2;
_arenaY			= hsArenaArea select 1;// _arenaY = _arenaY * 2;
_arenaPosition	= getPos hsArena;
_targetPos		= [0,0,0];
// create arrows that show target to the player
_targetArrows = [];
for "_i" from 0 to 9 do
{
	private["_newArrow"];
	// arrows are created locally, so only current player can see this ( ...in theory at least )
	_newArrow = "Sign_Arrow_Large_Yellow_F" createVehicleLocal [0,0,0];
	_targetArrows = _targetArrows + [_newArrow];
};

_initializing = true;
while {true} do
{
	// pick new target point
	_foundPos	= false;
	_targetPos	= [0,0,0];
	while{!_foundPos} do
	{
		_xyzpos		= call SDS_fnc_RandomArenaPosition;
		_targetPos	= _xyzpos findEmptyPosition [0,10];
		_foundPos	= (count _targetPos>0) and { [hsArena,_targetPos] call BIS_fnc_inTrigger};
	};
	
	// show target point to the player
	for "_i" from 0 to 9 do
	{
		private["_arrow"];
		_arrow = _targetArrows select _i;
		_arrow setPos [_targetPos select 0, _targetPos select 1, 10 * _i];
	};
	if(_initializing) then
	{
		sleep 2;
		_initializing = false;
	};
	// wait until player reaches point
	waitUntil{ ((player distance _targetPos) < 2) or { not ( player in playableUnits )} };
	
	// dead player will never collect any points :)
	if ( not ( player in playableUnits ) ) exitWith
	{
		SendGlobalChat = format ["%1 died having %2 points", profileName, score player];
		publicVariable "SendGlobalChat";
		player globalChat SendGlobalChat;
	};
	
	AddToScore = [player, 1, profileName]; publicVariableServer "AddToScore";
	playSound3D [MISSION_ROOT + "sounds\register.ogg", player];
};
