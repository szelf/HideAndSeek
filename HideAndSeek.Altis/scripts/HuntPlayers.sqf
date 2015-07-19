// HuntPlayers.sqf
_policemanWeaponTable			= _this select 0;
_policemanOutOffAmmoMissionEnds	= _this select 1;

_weaponIndex	= "PolicemanWeapon" call BIS_fnc_getParamValue;
_weaponRecord	= _policemanWeaponTable select _weaponIndex;
player addWeapon (_weaponRecord select 1);

_weaponOptics	= "PolicemanOptics" call BIS_fnc_getParamValue;
if(_weaponOptics isEqualTo 1) then
{
	if(_weaponRecord select 0) then { player addPrimaryWeaponItem (_weaponRecord select 4) }
							   else { player addHandgunItem (_weaponRecord select 4) };
};
_ammoPerPlayer	= "PolicemanAmmoPerPlayer" call BIS_fnc_getParamValue;

sleep 3;
_availablePlayers = (playersNumber east) max 1;
_availableShots = _availablePlayers * _ammoPerPlayer;
_availableMags = ceil (_availableShots/(_weaponRecord select 3))  ;
//diag_log format["Players %1, Shots %2, Mags %3, Condition %4",_availablePlayers,_availableShots,_availableMags, _policemanOutOffAmmoMissionEnds];
_weaponMagazine = _weaponRecord select 2;
for [{_j=0},{_j<_availableMags},{_j=_j+1}] do
{
	player addItemToVest _weaponMagazine;
};

while{true} do
{
	sleep 5;
	// count ammunition
	_leaveLoop = false;
	if(_policemanOutOffAmmoMissionEnds != 0) then
	{
		_ammoCounter = 0;
		_magazines = magazinesAmmoFull player;
		{
			if( (_x select 0) == _weaponMagazine ) then
			{
				_ammoCounter = _ammoCounter + (_x select 1);
			};
		} forEach _magazines;
		
		if ( _ammoCounter == 0 ) then
		{
			// _ammoCounter goes to 0 when you are reloading your last magazine.
			// Check it again after 4 seconds ( when reloading animation will finish ).
			sleep 4;
			_magazines = magazinesAmmoFull player;
			{
				if( (_x select 0) == _weaponMagazine ) then
				{
					_ammoCounter = _ammoCounter + (_x select 1);
				};
			} forEach _magazines;
		};
		if ( _ammoCounter == 0 ) then
		{
			SendGlobalChat = format ["Policeman %1 ran out of ammo", profileName];
			publicVariable "SendGlobalChat";
			player globalChat SendGlobalChat;
			player setDamage 1;
			_leaveLoop = true;
		};
	};
	if ( _leaveLoop ) exitWith{};
};
