initialization
finish
	gameMode := #finished.

	self
		show: (VIAKlaLottieAnimationViewer animation: (VIAKlaAnimation named: 'klara' css: 'finish'))
		onAnswer: [ self close ]
	
	"Will close this exerciser, which in turn will end the task, etc."
"	self close"
