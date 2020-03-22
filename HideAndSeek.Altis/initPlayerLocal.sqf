enableSentences false;
enableSaving [false,false];
player enableFatigue false;

"SendGlobalChat" addPublicVariableEventHandler
{
	_message = _this select 1;
	player globalChat _message;
};

"GameStatusInfo" addPublicVariableEventHandler
{
	_message = _this select 1;
	hintSilent _message;
};

"GameOver" addPublicVariableEventHandler
{
	_gameOverEnding = AvailableGameEndings select GameOver;
	if( GameOver>0 ) then
	{
		[_gameOverEnding, true, true] call BIS_fnc_endMission;
	};
};

"GameFinishInfo" addPublicVariableEventHandler
{
	missionNamespace setVariable ["GameFinishInfoStr", str GameFinishInfo ];
};

player createDiarySubject ["gameInfo", "HIDE AND SEEK"];
player createDiaryRecord ["gameInfo",[ "Github", localize "STR_HS_DIARY_GITHUB" ] ];
player createDiaryRecord ["gameInfo",[ localize "STR_HS_DIARY_TIPS_AND_TRICKS_TITLE", localize "STR_HS_DIARY_TIPS_AND_TRICKS" ] ];
player createDiaryRecord ["gameInfo",[ localize "STR_HS_DIARY_RULES_TITLE", localize "STR_HS_DIARY_RULES" ] ];
