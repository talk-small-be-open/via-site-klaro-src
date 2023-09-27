actions
revealAnswers
	| solution |
	solution := VIAAurExerciserSolutionComponent new
		exercise: exercise;
"		addBackButton;"
		yourself.

	self show: solution onAnswer: [self restart]