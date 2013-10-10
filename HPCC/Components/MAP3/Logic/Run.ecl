IMPORT Framework.MAP3.AutoGen;
IMPORT $.Internal.Views;
IMPORT $.Internal.Indices;
IMPORT Framework.MAP3.Contract.Schema;

EXPORT Run(Autogen.Inputs Indata) := FUNCTION
	
	RetVal := MODULE(Autogen.Outputs)
		EXPORT DATASET(Schema.ActivityByDay) ActivityByDay := Views.ActivityByDay(InData);
		EXPORT DATASET(Schema.ActivityByMonth) ActivityByMonth := Views.ActivityByMonth(InData);
		EXPORT DATASET(Schema.ActivityByTime) ActivityByTime := Views.ActivityByTime(InData);
		EXPORT DATASET(Schema.Movement) Movement	:= Views.Movement(InData);
		EXPORT DATASET(Schema.POI_Activity) POI_Activity := Views.POI_Activity(InData);
		EXPORT DATASET(Schema.Snapshot) Snapshot := Views.Snapshot(InData);
	END;
	RETURN RetVal;
END;