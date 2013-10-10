IMPORT Bundles.Calendar;
IMPORT Framework.MAP3.Contract;

EXPORT Activity_Expanded := RECORD
		Contract.Schema.Activity;
		Calendar.dtObject	CaptureDtInfo;
END;