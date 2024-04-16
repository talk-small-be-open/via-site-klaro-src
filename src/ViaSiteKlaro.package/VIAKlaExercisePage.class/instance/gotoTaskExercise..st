actions
gotoTaskExercise: aTaskExercise
	| autoMode |

	"DIRTY This means, that the manual mode has been started, but not the automatic. So
	we go to auto then. Hm, maybe to dirty."
	autoMode := aTaskExercise isDone and: [ aTaskExercise isFinished not ].

	^ self gotoTaskExercise: aTaskExercise auto: autoMode