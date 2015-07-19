// fn_RandomArenaPosition.sqf
// CAUTION : this function returns position that may be outside the ellipic trigger
// and is not safe to place the object ( look at commented out lines, that do it )
private["_arenaX","_arenaY","_arenaPosition","_foundPos","_xyzpos","_xyzpos0"];
//_needsSafePosition = _this select 0;

_arenaX 		= hsArenaArea select 0;
_arenaY 		= hsArenaArea select 1;
_arenaPosition 	= getPos hsArena;

// selecting position
//_foundPos = false;
//_xyzpos = [0,0,0];
//while { !_foundPos } do
//{
	_xypos = [ 2 * random _arenaX, 2 * random _arenaY, 0 ] vectorDiff [ _arenaX, _arenaY, 0 ];
	_xypos resize 2;
	_xypos = [_xypos ,-1.0*(hsArenaArea select 2)] call BIS_fnc_rotateVector2D;
	_xyzpos0 = _xypos + [0];
	_xyzpos0 = _arenaPosition vectorAdd _xyzpos0;
//	if(_needsSafePosition) then	{ _xyzpos = [_xyzpos0, 0, 30, 0.5, 0, 20, 0] call BIS_fnc_findSafePos; }
//						   else { _xyzpos = _xypos0; };
	_xyzpos = _xyzpos0;
//	_foundPos = [hsArena,_xyzpos] call BIS_fnc_inTrigger;
//};

_xyzpos
