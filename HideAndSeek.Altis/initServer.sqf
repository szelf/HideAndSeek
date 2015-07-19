enableSentences false;
enableSaving [false,false];
if (!isDedicated) then { player enableFatigue false; };

// initServer.sqf
"AddToScore" addPublicVariableEventHandler
{
	((_this select 1) select 0) addScore ((_this select 1) select 1);
	SendGlobalChat = format ["%1 has %2 points", ((_this select 1) select 2), score ((_this select 1) select 0)];
	publicVariable "SendGlobalChat"; 
	if (!isDedicated) then { player globalChat _message; };
};
