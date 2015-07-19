// fn_AddEventObjectHit.sqf
private["_veh"];
_veh = _this select 0;	
_veh addEventHandler ["HitPart", { [_this select 0, _this select 1] call SDS_fnc_EventObjectHit; } ];

true