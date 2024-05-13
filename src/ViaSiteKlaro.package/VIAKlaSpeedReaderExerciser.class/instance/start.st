initialization
start
	| introAudio audioName module task mNum tNum |
	
	self gotoModeManual.
	
	module := self module. 
	task := self task.
	mNum := module indexCode firstNumber asTwoCharacterString.
	tNum := (module indexOfTask: task) asTwoCharacterString.
	
	audioName := 'audio-intro-station', mNum, '-task', tNum.
	
	introAudio := (self wd findAssetsByTitle: audioName) firstOrNil.
	
	introAudio
		ifNil: [
"			self show: ((VIAKlaLottieAnimation named: 'lottie-test' css: 'startManual')
				autoClose: true; yourself)" ]
		ifNotNil: [
			| animationComponent |
			animationComponent := VIAKlaLottieAnimationViewer new
				animation: (VIAKlaAnimation new
					animationName: 'klara';
					cssClass: 'startManual';
					backgroundAudioAsset: introAudio;
					yourself);
				yourself.
			
			self show: animationComponent
		]
