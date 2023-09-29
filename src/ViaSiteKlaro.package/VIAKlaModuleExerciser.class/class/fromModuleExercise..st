as yet unclassified
fromModuleExercise: aModuleExercise
	^self basicNew
		setModel: aModuleExercise module;
		setModuleExercise: aModuleExercise;
		initialize;
		start;
		yourself.