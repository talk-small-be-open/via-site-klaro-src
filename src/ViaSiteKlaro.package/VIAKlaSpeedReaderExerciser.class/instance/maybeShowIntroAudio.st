initialization
maybeShowIntroAudio
	| introAudio audioName module task mNum tNum |

	"Avoid re-play during the same exercise session"
	hasPlayedIntroAudio ifTrue: [ ^ self ].
	
	hasPlayedIntroAudio := true.

	module := self module. 
	task := self task.
	mNum := module indexCode firstNumber asTwoCharacterString.
	tNum := (module indexOfTask: task) asTwoCharacterString.
	
	audioName := 'audio-intro-station', mNum, '-task', tNum.
	
	"Check if we have an intro audio?"
	introAudio := (self wd findAssetsByTitle: audioName) firstOrNil.
	
	introAudio
		ifNil: [
"			self show: ((VIAKlaLottieAnimation named: 'lottie-test' css: 'startManual')
				autoClose: true; yourself)" ]
		ifNotNil: [
			| animationComponent |
			animationComponent := VIAKlaLottieAnimationViewer new
				animation: (VIAKlaAnimation new
					animationName: 'HW-Hexenuebergang-Loop';
					cssClass: 'startManual';
					backgroundAudioAsset: introAudio;
					yourself);
"for testing				autoClose: false;"
				yourself.
			
			self show: animationComponent
		]
