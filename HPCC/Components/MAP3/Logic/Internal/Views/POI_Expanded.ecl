IMPORT Framework.MAP3.Contract;
IMPORT Framework.MAP3.Logic.Internal;
IMPORT $;
IMPORT Common.Utils.GenerateNumberTable;
IMPORT Common.Utils.Geometry;
IMPORT Common;
IMPORT Framework.MAP3.AutoGen;

EXPORT DATASET(Internal.Schema.POI_Expanded) POI_Expanded(Autogen.Inputs InData) := FUNCTION
	PrefilledPOI := $.POI_Prefill(InData.Zones);
	MinX := (INTEGER2)Min(PrefilledPOI,MinX);
	MaxX := (INTEGER2)Max(PrefilledPOI,MaxX);
	MinY := (INTEGER2)Min(PrefilledPOI,MinY);
	MaxY := (INTEGER2)Max(PrefilledPOI,MaxY);
	MinZ := (INTEGER2)Min(PrefilledPOI,MinZ);
	MaxZ := (INTEGER2)Max(PrefilledPOI,MaxZ);
	
	XAxis := GenerateNumberTable.Legal(MinX,MaxX);
	YAxis := GenerateNumberTable.Legal(MinY,MaxY);
	ZAxis := GenerateNumberTable.Legal(MinZ,MaxZ);
	
	ZX := JOIN(ZAxis,XAxis,1=1,TRANSFORM(Internal.Schema.POI_Expanded,
																							SELF.Z := LEFT.Num; 
																							SELF.X := RIGHT.Num; 
																							SELF	 := []),ALL);
																							
	ZXY := JOIN(ZX,YAxis,1=1,TRANSFORM(Internal.Schema.POI_Expanded,
																							SELF.Y:= RIGHT.Num; 
																							SELF	:= LEFT; 
																							SELF	 := []),ALL); 
																							
	ExpandedPOI := JOIN(ZXY,InData.Zones,Geometry.IsPointInPolygon(ROW({LEFT.X,LEFT.Y,LEFT.Z},Common.Types.Point),RIGHT.Polygon),
									TRANSFORM(Internal.Schema.POI_Expanded,
														SELF := RIGHT;
														SELF := LEFT;
														),LOOKUP,LOCAL,ALL);
	
	SortedPOI	:= SORT(ExpandedPOI,Z,X,Y,LOCAL) : PERSIST(InData.PersistPath + 'MAP3::POI_Expanded');
	RETURN SortedPOI;
END;
