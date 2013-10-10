IMPORT $;
IMPORT Framework.MAP3.Contract;
IMPORT Framework.MAP3.AutoGen;

EXPORT DATASET(Contract.Schema.POI_Activity) Sorted_POI_Activity_Date_Loc(Autogen.Inputs Indata) := FUNCTION
	Base_POI_Activity := $.POI_Activity(Indata);
	Dist_POI_Activity := DISTRIBUTE(Base_POI_Activity,HASH32(CaptureDtInfo.Year,
																										CaptureDtInfo.Month,
																										CaptureDtInfo.Day,
																										CaptureDtInfo.Hour,
																										POI_Id));
																										
	SortedDS					:= SORT(Dist_POI_Activity,CaptureDtInfo.Year,
																							CaptureDtInfo.Month,
																							CaptureDtInfo.Day,
																							CaptureDtInfo.Hour,
																							CaptureDtInfo.Minute,
																							POI_Id,LOCAL) : PERSIST(InData.PersistPath + 'MAP3::Sorted_POI_Activity_Date_Loc');																							
	RETURN SortedDS;
END;