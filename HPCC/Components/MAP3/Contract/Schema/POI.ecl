IMPORT Common;

EXPORT POI	:= RECORD
	UNICODE													POI_Id;
	STRING 													POI_Info;
	DATASET(Common.Types.Point)			Polygon;
	DECIMAL5_2											Importance;
END;	