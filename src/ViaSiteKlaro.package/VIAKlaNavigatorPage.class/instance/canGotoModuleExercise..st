testing
canGotoModuleExercise: aModuleExercise
	^ aModuleExercise isUntouched not or: [ nextExercise = aModuleExercise ]