enableSentences false;
enableSaving [false,false];
if (!isDedicated) then { player enableFatigue false; };

// initServer.sqf
"AddToScore" addPublicVariableEventHandler
{
	((_this select 1) select 0) addScore ((_this select 1) select 1);
	SendGlobalChat = format [ localize "STR_HS_MSG_ADD_SCORE", ((_this select 1) select 2), score ((_this select 1) select 0)];
	publicVariable "SendGlobalChat"; 
	if (!isDedicated) then { player globalChat _message; };
};
