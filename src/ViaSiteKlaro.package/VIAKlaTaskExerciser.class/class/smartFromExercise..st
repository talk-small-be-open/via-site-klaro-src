as yet unclassified
smartFromExercise: aTaskExercise

	"Es gibt keinen finished Zustand, der anders wäre. Man kann die Übung einfach nochmals
	durchmachen"
"	aTaskExercise isFinished ifTrue: [
		^VIAAurExerciserFinishedComponent exercise: aTaskExercise]."

	^ self exercise: aTaskExercise