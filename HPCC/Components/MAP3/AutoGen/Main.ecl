IMPORT $;
IMPORT Framework.MAP3.Logic;
IMPORT Framework.MAP3.Contract;

EXPORT Main(Contract.In.Stream InStream,Contract.In.Scalar InScalar,Contract.Config InConfig) := MODULE
	/* 	This is the call to the function that has to be implemented by the developer of the framework. 
			This Function returns a module that implemented the interface $.Outputs. 
  */
	 InData 			:= MODULE(InScalar,Instream,InConfig)
									 END;
	
	SHARED RetVal 			:= Logic.Run(PROJECT(InData,$.Inputs));	
	EXPORT ErrorStream 	:= PROJECT(RetVal,Contract.Out.ErrorStream);
	EXPORT Stream 			:= PROJECT(RetVal,Contract.Out.Stream);
	EXPORT Scalar 			:= PROJECT(RetVal,Contract.Out.Scalar);
	EXPORT Indices 			:= PROJECT(RetVal,Contract.Out.Indices);
END;


		