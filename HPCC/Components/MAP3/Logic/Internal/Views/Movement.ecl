IMPORT Framework.MAP3.Contract;
IMPORT $;
IMPORT Framework.MAP3.AutoGen;

EXPORT DATASET(Contract.Schema.Movement) Movement(Autogen.Inputs InData) := FUNCTION
	base 				:= $.POI_Activity(InData);
	DistBase		:= DISTRIBUTE(Base,HASH32(Entity_Id));
	SortBase		:= SORT(DistBase,Entity_Id,CaptureDtInfo.dt,POI_Id,LOCAL);
	DedupBase 	:= DEDUP(SortBase,Entity_Id,POI_ID,LOCAL,KEEP 1);
	rMovement		:= {Contract.Schema.Movement,UNICODE Entity_Id2};
	XFormedBase	:= PROJECT(DedupBase, TRANSFORM(rMovement,
																								SELF.Start_dt							:= LEFT.CaptureDtInfo.dt;
																								SELF.Start_Loc 						:= LEFT.Loc;
																								SELF.Start_POI_Id 				:= LEFT.POI_Id;
																								SELF.Start_POI_Info 			:= LEFT.POI_Info;
																								SELF.Entity_Id						:= LEFT.Entity_Id;
																								SELF 											:= [];
																								));
	
	rMovement	UpdateNextLoc(rMovement L, rMovement R) := TRANSFORM
		SELF.Entity_Id					:= L.Entity_Id2;
		SELF.Start_dt						:= L.End_dt;
		SELF.Start_Loc					:= L.End_Loc;
		SELF.Start_POI_Id 			:= L.End_POI_Id;
		SELF.Start_POI_Info 		:= L.End_POI_Info;
		SELF.End_dt					 		:= R.Start_dt;
		SELF.End_Loc						:= R.Start_Loc;
		SELF.End_POI_Id					:= R.Start_POI_Id;
		SELF.End_POI_Info				:= R.Start_POI_Info;
		SELF.Entity_Id2					:= R.Entity_Id;
	END;

	LocationUpdated := ITERATE(XFormedBase,UpdateNextLoc(LEFT,RIGHT));
	MovementDS 			:= PROJECT(LocationUpdated(Entity_Id = Entity_Id2),TRANSFORM(Contract.Schema.Movement, SELF := LEFT)): PERSIST(InData.PersistPath + 'MAP3::Movement');
	RETURN MovementDS;
END;
	
	