testing
canGotoTaskExercise: aTaskExercise
	| m |
	m := self module.
	
	"Only the first half of exercises are demo accessible"
	
	^ m isForDemo and: [ (m indexOfTask: aTaskExercise task) <= (m tasksCount / 2) ]