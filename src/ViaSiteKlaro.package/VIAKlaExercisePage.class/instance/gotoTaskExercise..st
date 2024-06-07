actions
gotoTaskExercise: aTaskExercise
	| autoMode |

	"DIRTY This means, that the manual mode has been started, but not the automatic. So
	we go to auto then. Hm, maybe to dirty."
"	autoMode := aTaskExercise isDone and: [ aTaskExercise isFinished not ]."
	autoMode := aTaskExercise percentFinished >=50 and: [ aTaskExercise isFinished not ].

	"DIRTY Cheap solution. Switch off music, so it is not always there. After we choose
	an exercise, we can switch it off."
"	self session soundMusicEnabled: false."

	^ self gotoTaskExercise: aTaskExercise auto: autoMode