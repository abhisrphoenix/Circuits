IMPORT Bundles.Calendar;
IMPORT Framework.MAP3.Contract;
IMPORT $;
IMPORT Framework.MAP3.AutoGen;

EXPORT DATASET(Contract.Schema.ActivityByTime) ActivityByTime(Autogen.Inputs Indata) := FUNCTION
	Base := $.Sorted_POI_Activity_Date_Loc(InData);
	
	trActivityByTime := RECORD
		Year 										:= Base.CaptureDtInfo.Year;
		Month										:= Base.CaptureDtInfo.Month;
		Day 										:= Base.CaptureDtInfo.Day;
		Hour 										:= Base.CaptureDtInfo.Hour;
		UNSIGNED1 QuarterOfHour := (Base.CaptureDtInfo.Minute/15) + 1;
		Minute 									:= Base.CaptureDtInfo.Minute;
		DayOfWeek 							:= Base.CaptureDtInfo.DayOfWeek;
		DayOfYear 							:= Base.CaptureDtInfo.DayOfYear;
		POI_Id									:= Base.POI_Id;
		POI_Info 								:= Base.POI_Info;
		EntityCount 						:= COUNT(GROUP);
	END;
		
	GroupedBase := TABLE(Base,trActivityByTime,CaptureDtInfo.Year,
															CaptureDtInfo.Month,
															CaptureDtInfo.Day,
															CaptureDtInfo.Hour,
															CaptureDtInfo.Minute,
															CaptureDtInfo.DayOfWeek,
															CaptureDtInfo.DayOfYear,
															POI_Id,
															POI_Info) : PERSIST(Indata.PersistPath + 'MAP3::Activity_By_Time');
	
	RETURN PROJECT(GroupedBase, TRANSFORM(Contract.Schema.ActivityByTime, SELF := LEFT;));
	
END;
