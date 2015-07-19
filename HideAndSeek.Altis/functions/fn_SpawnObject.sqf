// fn_SpawnObject.sqf
private["_typeName","_xyzPos","_newObject","_addActionAndEvent"];
_typeName 			= _this select 0;
_xyzPos   			= _this select 1;

_newObject = _typeName createVehicle _xyzPos;
// This will only work locally. Other players won't see the action
//_newObject addAction ["Switch object", { [_this select 0, _this select 1] call SDS_fnc_ActionSwitchObject }, nil, 6,true,true,"","(_target distance _this)<4 and {side (group player) isEqualTo east} and { isNull attachedTo _target }"];
// We must use BIS_fnc_MP instead.
[ [_newObject], "SDS_fnc_AddActionSwitchObject", true, true] call BIS_fnc_MP;
[ [_newObject], "SDS_fnc_AddEventObjectHit", true, true] call BIS_fnc_MP;

_newObject