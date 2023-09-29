actions
refresh
	nextTask := self tasks detect: [ :each | (moduleExercise exerciseForTask: each) isFinished not ] ifNone: [ nil ]