// fn_InitPlayer.sqf
private["_unit"];
_unit = _this select 0;

// removing all items
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

// hiding player
// FIXME : how to do it in first person ?
_unit allowDamage false;
hideObjectGlobal _unit;
_unit setObjectTextureGlobal [0, "#(argb,8,8,3)color(1,1,1,1)"];
_unit setObjectTextureGlobal [1, "#(argb,8,8,3)color(1,1,1,1)"];

_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";

true