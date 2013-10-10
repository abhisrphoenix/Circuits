IMPORT Framework.MAP3.AutoGen;
IMPORT Framework.MAP3.Logic.Internal.Views;

EXPORT Snapshot(Autogen.Inputs InData) := FUNCTION
	SnapshotTbl :=	Views.Snapshot(InData);
	SnapshotKey := INDEX(SnapshotTbl,{start_dt,end_dt},{x,y,z},InData.IndexPath + 'MAP3::Key::Snapshot');
	RETURN SnapshotKey;
END;