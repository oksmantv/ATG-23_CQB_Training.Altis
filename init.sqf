	MISSION_ROOT = call { private "_arr"; _arr = toArray __FILE__; _arr resize (count _arr - 8); toString _arr};
	
	// Framework Missing Objects Check.
	OKS_CheckFrameworkObjects = compile preprocessFileLineNumbers "Scripts\GOL_PlayerSetup\OKS_CheckFrameworkObjects.sqf";
	if(isServer && !(isDedicated)) then {
		waitUntil {sleep 1; !isNil "OKS_CheckFrameworkObjects"};
		_Return = call OKS_CheckFrameworkObjects;
		systemChat _Return;
		copyToClipboard _Return;
	};

	/* Set GOL Mission Settings */
	call Compile PreProcessFileLineNumbers "MissionSettings.sqf";
	Sleep 5;

	execVM "Scripts\GOL_PlayerSetup\init.sqf";
	execVM "Scripts\OKS_Vehicles\Init.sqf";	
	execVM "FAC_Teleport.sqf";
	execVM "Training\Init.sqf";
	if(GOL_NEKY_SERVICESTATION isEqualTo 1) then { execVM "Scripts\NEKY_ServiceStation\Init.sqf"};
	if(GOL_NEKY_AIRDROP isEqualTo 1) then {	execVM "Scripts\NEKY_AirDrop\Init.sqf"};
	if(GOL_NEKY_HUNT isEqualTo 1) then { execVM "Scripts\NEKY_Hunt\Init.sqf"};
	if(GOL_OKS_AMBIENCE isEqualTo 1) then { execVM "Scripts\OKS_Ambience\Init.sqf"};
	if(GOL_OKS_SPAWN isEqualTo 1) then { execVM "Scripts\OKS_Spawn\Init.sqf"};
	if(GOL_OKS_DYNAMIC isEqualTo 1) then { execVM "Scripts\OKS_Dynamic\Init.sqf"};
	if(GOL_NEKY_TASK isEqualTo 1) then { execVM "Scripts\NEKY_Tasks\Init.sqf"};	
	if(GOL_OKS_TASK isEqualTo 1) then { execVM "Scripts\OKS_TASK\Init.sqf"};


