testing
canGotoTaskExercise: aTaskExercise
	^ aTaskExercise isDone or: [ nextTask = aTaskExercise task ]