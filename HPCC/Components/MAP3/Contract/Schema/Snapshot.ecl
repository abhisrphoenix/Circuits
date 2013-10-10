IMPORT * FROM Bundles;

EXPORT Snapshot := RECORD
	Calendar.DateTime		Start_dt;
	Calendar.DateTime		End_dt;
	INTEGER2						X;
	INTEGER2						Y;
	INTEGER2						Z;
END;