// ServerMissionConditions.sqf
_timeLimit = _this select 0;

GameFinishInfo = "";

while {true} do
{
	sleep 1;
	// check the game time limit
	_timeLeft = floor (estimatedEndServerTime - serverTime);
	if( _timeLimit>0 && (_timeLeft <= 60) ) then
	{
		SendGlobalChat = format[ localize "STR_HS_MSG_TIME_OUT", _timeLeft];
		publicVariable "SendGlobalChat";
		player globalChat SendGlobalChat;
	};
	
	// calculate the number of players on each side
	_westCounter = 0;
	_eastCounter = 0;
	_bestScore   = 0;
	{
		_alivePlayer = ( not isNil {_x getVariable "wasKilled"}) and { not ( _x getVariable "wasKilled" )};
		_playerScore = score _x;
		if( _alivePlayer and {(side _x) == west} ) then {_westCounter = _westCounter+1;};
		if( _alivePlayer and {(side _x) == east} ) then {_eastCounter = _eastCounter+1;};
		if( _playerScore > _bestScore and { (side _x) == east } ) then { _bestScore = _playerScore; };
	} forEach playableUnits;
	
	_bestPlayers = "";
	// find players with highest score
	{
		if( ( (score _x) == _bestScore ) and {(side _x) == east} ) then
		{
			_bestPlayers = _bestPlayers + " " + (name _x);
		}
	} forEach playableUnits;
	
	// write policemen names
	_allPolicemen = "";
	{
		if( (side _x) == west ) then
		{
			_allPolicemen = _allPolicemen + " " + (name _x);
		}
	} forEach playableUnits;

	// calculate current time since mission start
	_seconds = (floor time) mod 60;
	_minutes = ((floor time) - _seconds) / 60;
	_secondsStr = str _seconds;
	if(_seconds<10) then 
	{
		_secondsStr = format [ "0%1", _seconds];
	};
	
	// show game status in a hint
	GameStatusInfo = format [ localize "STR_HS_MSG_STATUS", _minutes, _secondsStr, _eastCounter];
	publicVariable "GameStatusInfo";
	hintSilent GameStatusInfo;
	
	// publish game finish info
	GameFinishInfo = formatText [ localize "STR_HS_MSG_FINISH_INFO", _minutes, _secondsStr, _eastCounter, _westCounter, _allPolicemen, _bestPlayers, _bestScore];
    publicVariable "GameFinishInfo";
	missionNamespace setVariable ["GameFinishInfoStr", str GameFinishInfo ];
	
	// check for mission conditions
	if( (_westCounter+_eastCounter)==0 )  then { GameOver = 4; publicVariable "GameOver"; }
	else
	{
		if( _westCounter==0 ) then { GameOver = 2; publicVariable "GameOver"; };
		if( _eastCounter==0 ) then { GameOver = 3; publicVariable "GameOver"; };
	};
	if( _timeLimit>0 && (_timeLeft <= 0) ) then { GameOver = 1; publicVariable "GameOver"; };
	
	if( GameOver>0 ) exitWith {};
};

_gameOverEnding = AvailableGameEndings select GameOver;
[_gameOverEnding, true, true] call BIS_fnc_endMission;
