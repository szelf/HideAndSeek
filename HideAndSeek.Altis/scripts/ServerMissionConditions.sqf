// ServerMissionConditions.sqf
_timeLimit = _this select 0;

while {true} do
{
	sleep 10;
	// check the game time limit
	if( _timeLimit>0 ) then
	{
		_timeLeft = floor (estimatedEndServerTime - serverTime);
		
		if( (_timeLeft <= 0) ) then
		{
			GameOver = 1; publicVariable "GameOver";
		}
		else
		{
			// show how much time is left
			if( _timeLeft <= 60 ) then
			{
				SendGlobalChat = format[ localize "STR_HS_MSG_TIME_OUT", _timeLeft];
				publicVariable "SendGlobalChat";
				player globalChat SendGlobalChat;
			};
		};
	};
	if( GameOver>0 ) exitWith {};
	
	// now check if there is any player on each side
	_westCounter = 0;
	_eastCounter = 0;
	{
		_alivePlayer = ( not isNil {_x getVariable "wasKilled"}) and { not ( _x getVariable "wasKilled" )};
		if( _alivePlayer and {(side _x) == west} ) then {_westCounter = _westCounter+1;};
		if( _alivePlayer and {(side _x) == east} ) then {_eastCounter = _eastCounter+1;};
	} forEach playableUnits;
	if( (_westCounter+_eastCounter)==0 )  then { GameOver = 4; publicVariable "GameOver"; }
	else
	{
		if( _westCounter==0 ) then { GameOver = 2; publicVariable "GameOver"; };
		if( _eastCounter==0 ) then { GameOver = 3; publicVariable "GameOver"; };
	};
	if( GameOver>0 ) exitWith {};
};

_gameOverEnding = AvailableGameEndings select GameOver;
[_gameOverEnding, true, true] call BIS_fnc_endMission;
