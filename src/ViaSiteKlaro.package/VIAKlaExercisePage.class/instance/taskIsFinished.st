as yet unclassified
taskIsFinished

	"If it was the last task, we have finished the whole module!"
	moduleExercise isFinished ifTrue: [
		self moduleIsFinished.
		^ self ].

	self uiGotoPageNamed: 'station'.