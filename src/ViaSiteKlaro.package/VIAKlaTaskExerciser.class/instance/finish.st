as yet unclassified
finish

	"Mehrfach-Robustheit"
	self isFinished ifTrue: [^self].
	
	exercise beFinished.
"	self removeDecoration: formDecoration.
	formDecoration := nil."
	
"	self show: ((VIAAurExerciserFinishedComponent exercise: exercise)
		displayCongratulation;
		yourself) onAnswer: [self close]."

	self close