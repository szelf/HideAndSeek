// fn_SetObjectRotation.sqf
_object = _this select 0;
_typeZRotation = -1.0 * (_object getVariable "TypeRotation");
_object setVectorDirAndUp [ [sin _typeZRotation, cos _typeZRotation, 0.0],[0,0,1] ];

true
