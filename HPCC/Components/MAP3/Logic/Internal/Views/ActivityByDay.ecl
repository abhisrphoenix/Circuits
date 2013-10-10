IMPORT Framework.MAP3.Contract;
IMPORT Framework.MAP3.Logic.Internal;
IMPORT Framework.MAP3.AutoGen;

EXPORT DATASET(Contract.Schema.ActivityByDay) ActivityByDay(Autogen.Inputs InData) := FUNCTION
	base 			:= Internal.Views.ActivityByTime(InData)(InData.POI_Id_Filter = '' OR POI_ID = InData.POI_ID_Filter);
	Xformed		:= PROJECT(base, TRANSFORM(Contract.Schema.ActivityByDay,
																				SELF.Hour:= LEFT.Hour;
																				SELF.Sun := IF(LEFT.DayOfWeek= 'SUN',LEFT.EntityCount,0); 
																				SELF.Mon := IF(LEFT.DayOfWeek = 'MON',LEFT.EntityCount,0); 
																				SELF.Tue := IF(LEFT.DayOfWeek = 'TUE',LEFT.EntityCount,0); 
																				SELF.Wed := IF(LEFT.DayOfWeek = 'WED',LEFT.EntityCount,0); 
																				SELF.Thu := IF(LEFT.DayOfWeek = 'THU',LEFT.EntityCount,0); 
																				SELF.Fri := IF(LEFT.DayOfWeek = 'FRI',LEFT.EntityCount,0); 
																				SELF.Sat := IF(LEFT.DayOfWeek = 'SAT',LEFT.EntityCount,0); 
																				));
	trOut := 	RECORD
		Hour := XFormed.Hour;
		Sun	 := SUM(GROUP,XFormed.Sun);
		Mon  := SUM(GROUP,XFormed.Mon);
		Tue  := SUM(GROUP,XFormed.Tue);
		Wed  := SUM(GROUP,XFormed.Wed);
		Thu  := SUM(GROUP,XFormed.Thu);
		Fri  := SUM(GROUP,XFormed.Fri);
		Sat  := SUM(GROUP,XFormed.Sat);
	END;
	
	tblout := TABLE(Xformed,trOut,Hour,FEW,MERGE);
	RETURN SORT(PROJECT(tblOut,TRANSFORM(Contract.Schema.ActivityByDay, SELF := LEFT)),Hour);
END;