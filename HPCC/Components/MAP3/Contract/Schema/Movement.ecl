IMPORT Bundles.Calendar;
IMPORT Common;

EXPORT Movement := RECORD
	UNICODE							Entity_ID;
	Calendar.DateTime		Start_dt;
	Common.Types.Point	Start_Loc;	
	UNICODE							Start_POI_Id;
	STRING 							Start_POI_Info;
	Calendar.DateTime		End_dt;	
	Common.Types.Point	End_Loc;	
	UNICODE							End_POI_Id;
	STRING 							End_POI_Info;
END;