BIS_fnc_feedback_allowPP = false;
switch (f_var_radios) do {
  // ACRE
  case 1: {
    [true] call acre_api_fnc_setSpectator;
  };
  // TFR
  case 2: {
    [player, true] call TFAR_fnc_forceSpectator;
  };
  // ACRE2
  case 3: {
    [true] call acre_api_fnc_setSpectator;
  };
};
["Initialize", [ player, [], true ]] call BIS_fnc_EGSpectator;
