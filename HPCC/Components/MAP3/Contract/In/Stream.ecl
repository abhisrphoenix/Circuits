IMPORT Framework.MAP3.Contract.Schema;

EXPORT Stream := INTERFACE
	EXPORT DATASET(Schema.Activity) 	Observations;
	EXPORT DATASET(Schema.POI) 			Zones;
END;