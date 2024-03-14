initialization
finish
	gameMode := #finished.

	self show: (VIAKlaLottieAnimation named: 'lottie-test' css: 'manualToAutomatic') onAnswer: [ self close ]
	
	"Will close this exerciser, which in turn will end the task, etc."
"	self close"
