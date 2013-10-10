IMPORT Framework.MAP3.Contract;
IMPORT * FROM Bundles.Calendar;
IMPORT Framework.MAP3.Logic.Internal;
IMPORT Framework.MAP3.AutoGen;

EXPORT DATASET(Internal.Schema.Activity_Expanded) Activity_Expanded(Autogen.Inputs InData) := FUNCTION
	ExpandedObs := PROJECT(InData.Observations,TRANSFORM(Internal.Schema.Activity_Expanded, SELF := LEFT;
																																					SELF.CaptureDtInfo:= GetDTObject(LEFT.CaptureDt);
																				));
	
	SortedObs	:= SORT(ExpandedObs,Loc.Z,Loc.X,Loc.Y,LOCAL) : PERSIST(InData.PersistPath + 'MAP3::Obs_Expanded');
	RETURN SortedObs;
END;