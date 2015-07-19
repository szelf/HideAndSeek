// fn_ActionSwitchObject.sqf
private["_newAttachedObject","_newPosition","_bbox","_attachHeight","_typeTranslation","_totalTranslation","_oldAttachedObject","_oldPosition"];
if ( count attachedObjects player isEqualTo 0) exitWith{};

_newAttachedObject 	= _this select 0;
_newPosition  		= getPosATL _newAttachedObject;
_bbox 				= boundingBox _newAttachedObject;
_attachHeight 		= (_bbox select 0) select 2;
_typeTranslation	= _newAttachedObject getVariable "TypeTranslation";
_totalTranslation 	= _typeTranslation vectorAdd [0,0,-1*_attachHeight];

_oldAttachedObject	= attachedObjects player select 0;
_oldPosition		= getPosATL player;

detach _oldAttachedObject;
_oldAttachedObject setPosATL _oldPosition;

_newAttachedObject attachTo [player,_totalTranslation];
[ [_newAttachedObject], "SDS_fnc_SetObjectRotation", true, false ] call BIS_fnc_MP;
player setPosATL _newPosition;

true
