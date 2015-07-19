// fn_EventObjectHit.sqf
private["_target","_shooter","_player"];
_target  = (_this select 0) select 0;
_shooter = (_this select 0) select 1;

//diag_log format ["%1 shot by %2", _target, _shooter ];

// strange things happened :)
if (!isPlayer _shooter) exitWith{};

_player = attachedTo _target;
if( isPlayer _player ) then
{
	private["_direction","_position"];
	_direction = getDir _player;
	_position  = getPos _player;
	detach _target;
	_target setDir _direction;
	_target setPos _position;

	_player setDamage 1;
}
else
{
	playSound3D [MISSION_ROOT + "sounds\lamb.ogg", _shooter];
};
