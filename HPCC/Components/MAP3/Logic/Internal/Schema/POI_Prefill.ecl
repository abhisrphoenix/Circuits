IMPORT Framework.MAP3.Contract;

EXPORT POI_Prefill := RECORD
	Contract.Schema.POI;
	DECIMAL8_4 MinX;
	DECIMAL8_4 MinY;
	DECIMAL8_4 MaxX;
	DECIMAL8_4 MaxY;
	INTEGER	 	 MinZ;
	INTEGER		 MaxZ;	
END;
		
	