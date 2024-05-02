as yet unclassified
taskIsFinished

	"Check if we have just finished the whole module"
	((moduleWasFinished = false) and: [moduleExercise isFinished]) ifTrue: [
		self moduleIsFinishedForFirstTime.
		^ self
	].

	self uiGotoPageNamed: 'station'.