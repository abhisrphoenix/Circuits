IMPORT Framework.MAP3.Contract;
IMPORT Framework.MAP3.Logic.Internal;
IMPORT Framework.MAP3.Contract.In;
IMPORT Framework.MAP3.AutoGen;

EXPORT DATASET(Contract.Schema.ActivityByMonth) ActivityByMonth(Autogen.Inputs Indata) := FUNCTION
	base 			:= $.ActivityByTime(Indata)(Indata.POI_Id_Filter = '' OR POI_ID = Indata.POI_ID_Filter);
	Xformed		:= PROJECT(base, TRANSFORM(Contract.Schema.ActivityByMonth,
																				SELF.Hour:= LEFT.Hour;
																				SELF.Jan := IF(LEFT.Month = 1,LEFT.EntityCount,0); 
																				SELF.Feb := IF(LEFT.Month = 2,LEFT.EntityCount,0); 
																				SELF.Mar := IF(LEFT.Month = 3,LEFT.EntityCount,0); 
																				SELF.Apr := IF(LEFT.Month = 4,LEFT.EntityCount,0); 
																				SELF.May := IF(LEFT.Month = 5,LEFT.EntityCount,0); 
																				SELF.Jun := IF(LEFT.Month = 6,LEFT.EntityCount,0); 
																				SELF.Jul := IF(LEFT.Month = 7,LEFT.EntityCount,0); 
																				SELF.Aug := IF(LEFT.Month = 8,LEFT.EntityCount,0); 
																				SELF.Sep := IF(LEFT.Month = 9,LEFT.EntityCount,0); 
																				SELF.Oct := IF(LEFT.Month = 10,LEFT.EntityCount,0); 
																				SELF.Nov := IF(LEFT.Month = 11,LEFT.EntityCount,0); 
																				SELF.Dec := IF(LEFT.Month = 12,LEFT.EntityCount,0);
																				));
	trOut := 	RECORD
		Hour := XFormed.Hour;
		Jan	 := SUM(GROUP,XFormed.Jan);
		Feb  := SUM(GROUP,XFormed.Feb);
		Mar  := SUM(GROUP,XFormed.Mar);
		Apr  := SUM(GROUP,XFormed.Apr);
		May  := SUM(GROUP,XFormed.May);
		Jun  := SUM(GROUP,XFormed.Jun);
		Jul  := SUM(GROUP,XFormed.Jul);
		Aug  := SUM(GROUP,XFormed.Aug);
		Sep  := SUM(GROUP,XFormed.Sep);
		Oct  := SUM(GROUP,XFormed.Oct);
		Nov  := SUM(GROUP,XFormed.Nov);
		Dec  := SUM(GROUP,XFormed.Dec);
	END;
	
	tblout := TABLE(Xformed,trOut,Hour,FEW,MERGE);
	RETURN SORT(PROJECT(tblOut,TRANSFORM(Contract.Schema.ActivityByMonth, SELF := LEFT)),Hour);
END;