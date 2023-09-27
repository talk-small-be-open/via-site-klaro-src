as yet unclassified
prepareExercise: anExercise
	self childBricksDo: [:each |
		each prepareExercise: anExercise]