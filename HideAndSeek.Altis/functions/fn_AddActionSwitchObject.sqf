// fn_AddActionSwitchObject.sqf
private["_veh"];
_veh = _this select 0;	
_veh addAction ["Switch object", { [_this select 0, _this select 1] call SDS_fnc_ActionSwitchObject }, nil, 6,true,true,"","(_target distance _this)<4 and {side (group player) isEqualTo east} and { isNull attachedTo _target }"];

true
