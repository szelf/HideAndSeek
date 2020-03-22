// fn_InitPlayer.sqf
private["_unit", "_matcount", "_texcount", "_j"];
_unit = _this select 0;

if (!local _unit) exitWith {};

// removing all items
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";

true