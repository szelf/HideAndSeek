private _campingLimit = "CampingLimit" call BIS_fnc_getParamValue;

if ( _campingLimit == 0 ) exitWith {};

SOUND_LENGTH = 5;

private _initPos = getPos player;
private _posArray = [];
_posArray resize _campingLimit;
private _arrayIndex = 0;

for "_i" from 0 to (_campingLimit-1) do
{
	_posArray set [_i, _initPos vectorAdd [random[-5,0,5],random[-5,0,5],0]];
};

while{true} do
{
	sleep 1;
	if ( not ( player in playableUnits ) ) exitWith {};
	
	_posArray set [_arrayIndex, getPos player];
	_arrayIndex = ( _arrayIndex + 1 ) mod _campingLimit;
	
	_mean 		= [0.0, 0.0 ,0.0];
	for "_i" from 0 to (_campingLimit-1) do
	{
		_mean = _mean vectorAdd ( _posArray select _i );
	};
	_mean = _mean vectorMultiply (1.0 / _campingLimit);
	
	_variance 	= [0.0, 0.0 ,0.0];
	for "_i" from 0 to (_campingLimit-1) do
	{
		_val = ( _posArray select _i ) vectorDiff _mean;
		_val2 = [(_val select 0) * (_val select 0), (_val select 1) * (_val select 1), (_val select 2) * (_val select 2) ];
		_variance = _variance vectorAdd _val2;
	};
	_variance = _variance vectorMultiply (1.0 / _campingLimit);
	
	_maxvar = (_variance select 0) max (_variance select 1);
	if ( (_maxvar < 0.5) and (_arrayIndex mod SOUND_LENGTH == 0)) then
	{
		playSound3D [MISSION_ROOT + "sounds\camping.ogg", player];
	};
};