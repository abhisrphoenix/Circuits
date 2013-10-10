IMPORT Bundles.Calendar;
IMPORT Framework.MAP3.Contract;
IMPORT $;
IMPORT Framework.MAP3.AutoGen;

EXPORT DATASET(Contract.Schema.POI_Activity) POI_Activity(Autogen.Inputs InData) := FUNCTION
	Obs 				:= $.Activity_Expanded(InData);
	Obs_Dist 		:= DISTRIBUTE(Obs,(INTEGER)Loc.x);
	Obs_Sort 		:= SORT(Obs_Dist,(INTEGER)Loc.z,(INTEGER)Loc.x,(INTEGER)Loc.y,LOCAL);	
	Zones 			:= NOTHOR($.POI_Expanded(InData));
	Zones_Dist 	:= DISTRIBUTE(Zones, x);
	Zones_Sort 	:= SORT(Zones_Dist,z,x,y,LOCAL);
		
	
	OutDS :=  JOIN(Obs_Sort, Zones_Sort,
									RIGHT.Z 				= (INTEGER)LEFT.Loc.Z 	AND		
									RIGHT.X 				= (INTEGER)LEFT.Loc.X 	AND		
									RIGHT.Y 				= (INTEGER)LEFT.Loc.Y,		
									TRANSFORM(Contract.Schema.POI_Activity,
														SELF := LEFT;
														SELF := RIGHT;
														),LOCAL,NOSORT,KEEP(1)) : PERSIST(InData.PersistPath + 'MAP3::POI_Activity');
	RETURN OutDS;
END;
	