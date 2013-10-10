IMPORT Framework.MAP3.Contract;
IMPORT Bundles.Calendar;
IMPORT $;
IMPORT Framework.MAP3.AutoGen;

EXPORT DATASET(Contract.Schema.Snapshot) Snapshot(Autogen.Inputs InData) := FUNCTION
	MovementDS := $.Movement(InData);
	RETURN PROJECT(MovementDS,TRANSFORM(Contract.Schema.Snapshot,
																				SELF.Start_dt := LEFT.Start_dt;
																				SELF.End_dt		:= Calendar.DATEADD(Calendar.DatePartEnum.Seconds,-1,LEFT.End_dt);
																				SELF.X				:= LEFT.Start_Loc.X;
																				SELF.Y				:= LEFT.Start_Loc.Y;
																				SELF.Z				:= LEFT.Start_Loc.Z;)
								);
END;
																																								
