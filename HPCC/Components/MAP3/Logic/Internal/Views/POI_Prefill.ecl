IMPORT Framework.MAP3.Contract;
IMPORT Framework.MAP3.Logic.Internal;

EXPORT DATASET(Internal.Schema.POI_Prefill) POI_Prefill(DATASET(Contract.Schema.POI) Zones) := FUNCTION
	ExpandedPOI := PROJECT(Zones,TRANSFORM(Internal.Schema.POI_Prefill, SELF := LEFT;
																																		SELF.MinX := MIN(LEFT.Polygon,X);
																																		SELF.MinY := MIN(LEFT.Polygon,Y);
																																		SELF.MaxX := MAX(LEFT.Polygon,X);
																																		SELF.MaxY := MAX(LEFT.Polygon,Y);
																																		SELF.MinZ := MIN(LEFT.Polygon,Z);
																																		SELF.MaxZ := MAX(LEFT.Polygon,Z);
																			));

	RETURN ExpandedPOI;
END;