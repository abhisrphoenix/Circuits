IMPORT Framework.MAP3.Contract.Schema;

EXPORT Stream := INTERFACE
	EXPORT DATASET(Schema.ActivityByDay) ActivityByDay;
	EXPORT DATASET(Schema.ActivityByMonth) ActivityByMonth;
	EXPORT DATASET(Schema.ActivityByTime) ActivityByTime;
	EXPORT DATASET(Schema.Movement) Movement;
	EXPORT DATASET(Schema.POI_Activity) POI_Activity;
	EXPORT DATASET(Schema.Snapshot) Snapshot;
END;