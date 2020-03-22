// fn_InitPlayer.sqf
private["_unit"];
_unit = _this select 0;

if (!local _unit) exitWith {};

switch (f_var_radios) do {
  // ACRE
  case 1: {
    [true] call acre_api_fnc_setSpectator;
  };
  // TFR
  case 2: {
    [_unit, true] call TFAR_fnc_forceSpectator;
  };
  // ACRE2
  case 3: {
    [true] call acre_api_fnc_setSpectator;
  };
};

true