enableSentences false;
enableSaving [false,false];
player enableFatigue false;

"SendGlobalChat" addPublicVariableEventHandler
{
	_message = _this select 1;
	player globalChat _message;
};

"GameOver" addPublicVariableEventHandler
{
	_gameOverEnding = AvailableGameEndings select GameOver;
	if( GameOver>0) then
	{
		diag_log format["Client: game is over. Reason: %1. Your points: %2", _gameOverEnding, score player];
		[_gameOverEnding, true, true] call BIS_fnc_endMission;
	};
};
