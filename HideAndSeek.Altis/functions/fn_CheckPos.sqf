// fn_CheckPos.sqf
// checking if there are any objects around us
_pos   = _this select 0;
_range = _this select 1;

_angleDistance = 15;
_result = true;
for [{_a=0},{_a<360},{_a=_a+_angleDistance}] do
{
	_targetPos = _pos vectorAdd [ _range * sin _a, _range * cos _a, 0.5 ];
	if( lineIntersects [ATLToASL _pos, ATLToASL _targetPos] ) exitWith {_result=false;};
};

_result
