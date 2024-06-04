accessing
lottieAnimation
	lottieAnimation ifNil: [
		| animationName |
		animationName := 'Hexenhaus_', self rewardNumber asTwoCharacterString.
		lottieAnimation := VIAKlaLottieAnimationViewer animation: (VIAKlaAnimation named: animationName).
		lottieAnimation autoClose: false.
	].
	
	^ lottieAnimation