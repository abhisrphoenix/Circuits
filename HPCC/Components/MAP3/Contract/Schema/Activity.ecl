IMPORT Bundles.Calendar;
IMPORT Common;

EXPORT Activity		:= RECORD
	STRING 								Obs_Id;
	UNICODE								Entity_ID;
	STRING								Entity_Info;
	Common.Types.Point		Loc;	
	Calendar.DateTime			CaptureDt;
END;