initialization
finish
	gameMode := #finished.

	"Will close this exerciser, which in turn will end the task, etc."

	"If we are repeating the exercise we dont show the animation"
"	self taskExerciser isFinished
		ifFalse: ["
			self
				show: (VIAKlaLottieAnimationViewer animation: (VIAKlaAnimation named: '01-HW-Uebergang-Bravo' css: 'finish'))
				onAnswer: [ self close ]
		"]
		ifTrue: [ self close ]"