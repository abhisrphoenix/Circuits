IMPORT Bundles.Calendar;
IMPORT Common;

EXPORT POI_Activity	:= RECORD
		STRING 								Obs_Id;
		UNICODE								Entity_ID;
		STRING								Entity_Info;
		Common.Types.Point		Loc;	
		Calendar.dtObject			CaptureDtInfo;
		UNICODE								POI_Id;
		STRING 								POI_Info;
		DECIMAL5_2						Importance;
END;