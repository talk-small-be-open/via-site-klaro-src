as yet unclassified
gotoAnimationThenModeAutomatic
	self
		show: (VIAKlaLottieAnimationViewer animation: (VIAKlaAnimation named: '01-HW-Uebergang-Schildkroete' css: 'manualToAutomatic'))
		onAnswer: [ self gotoModeAutomatic ]