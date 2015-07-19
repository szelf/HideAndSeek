// fn_AttachPlayerToObject.sqf
private["_selectedObject","_typeTranslation","_bbox","_attachHeight","_totalTranslation"];
_selectedObject 	= _this select 0;
_typeTranslation	= _selectedObject getVariable "TypeTranslation";

player setDir getDir _selectedObject;
player setPos getPos _selectedObject;
_bbox 				= boundingBox _selectedObject;
_attachHeight 		= (_bbox select 0) select 2;
_totalTranslation 	= _typeTranslation vectorAdd [0,0,-1*_attachHeight];
_selectedObject attachTo [player,_totalTranslation];
[ [_selectedObject], "SDS_fnc_SetObjectRotation", true, false ] call BIS_fnc_MP;

true