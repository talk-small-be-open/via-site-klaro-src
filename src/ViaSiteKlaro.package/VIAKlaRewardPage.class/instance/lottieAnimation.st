accessing
lottieAnimation
	lottieAnimation ifNil: [
		| animationName animationObject |
		animationName := 'Hexenhaus_', self rewardNumber asTwoCharacterString.
		animationObject := (VIAKlaAnimation named: animationName) startSoundFile: 'zauber'; yourself.
		lottieAnimation := VIAKlaLottieAnimationViewer animation: animationObject.
		lottieAnimation autoClose: false.
	].
	
	^ lottieAnimation