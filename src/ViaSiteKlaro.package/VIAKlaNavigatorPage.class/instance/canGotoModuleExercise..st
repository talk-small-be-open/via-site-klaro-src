testing
canGotoModuleExercise: aModuleExercise
	^ aModuleExercise isUntouched not or: [ currentExercise = aModuleExercise ]