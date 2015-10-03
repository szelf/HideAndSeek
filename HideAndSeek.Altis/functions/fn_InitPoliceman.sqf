// fn_InitPoliceman.sqf
private["_unit"];
_unit = _this select 0;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit allowDamage false;
_unit forceAddUniform "U_Marshal";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "FirstAidKit";
_unit addVest "V_TacVest_blk_POLICE";
_unit addHeadgear "H_Cap_police";

_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";

true