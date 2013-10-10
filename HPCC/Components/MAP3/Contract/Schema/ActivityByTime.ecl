IMPORT $;
	
EXPORT ActivityByTime := RECORD
	UNSIGNED2 		Year;
	UNSIGNED1 		Month;
	UNSIGNED1 		Day;
	UNSIGNED1 		Hour;
	UNSIGNED1			QuarterOfHour;
	UNSIGNED1 		Minute;
	STRING  			DayOfWeek;
	UNSIGNED2 		DayOfYear;
	UNICODE				POI_Id;
	STRING 				POI_Info;
	INTEGER				EntityCount;
END;
