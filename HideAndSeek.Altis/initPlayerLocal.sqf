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

player createDiarySubject ["gameInfo", "HIDE AND SEEK"];

player createDiaryRecord ["gameInfo",[ "Github",
"<br />The game is on Github :
<br /> https://github.com/szelf/HideAndSeek
<br />"]];

player createDiaryRecord ["gameInfo",[ "Tips and tricks",
"<br />- player may change objects he is hiding in
<br />- policeman should listen to all sounds and its directions
<br />- things you may change in MISSION PARAMETERS:
<br />   - game area ( there are few to choose from )
<br />   - policeman's weapons, optics and ammo count
<br />   - time limit
<br />   - radio system for spectators"]];

player createDiaryRecord ["gameInfo",[ "Rules of the game",
"<br />1. There are 2 teams : policemen (max 2) and players(max 20).
<br />   Players are invisible and hiding in objects.
<br />
<br />2. Policeman's goal is to kill all players. 
<br />   Policeman dies when he runs out of ammo.
<br />
<br />3. Player's goal is to collect points by reaching place
<br />   marked by a stack of arrows. Each player has it's own arrows
<br />   and arrows are visible only to him.
<br />
<br />4. Player dies when he will try to leave area surrounded by road cones.
<br />
<br />5. Mission ends when:
<br />  - there is no more players
<br />  - there is no more policemen
<br />  - the time is up"]];
