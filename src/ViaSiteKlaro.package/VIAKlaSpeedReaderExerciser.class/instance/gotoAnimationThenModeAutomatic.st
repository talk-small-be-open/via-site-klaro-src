as yet unclassified
gotoAnimationThenModeAutomatic
	self
		show: (VIAKlaLottieAnimationViewer animation: (VIAKlaAnimation named: '01-HW-Uebergang-Hase-white' css: 'manualToAutomatic'))
		onAnswer: [ self gotoModeAutomatic ]