accessing
lottieAnimation
	lottieAnimation ifNil: [
		lottieAnimation := VIAKlaLottieAnimationViewer animation: (VIAKlaAnimation named: '01-HW-Uebergang-Bravo').
		lottieAnimation autoClose: false.
	].
	
	^ lottieAnimation