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
		ifNil: [ 	self show: (VIAKlaLottieAnimation named: '01-HW-Uebergang' css: 'startManual') ]
		ifNotNil: [
			self show: ((VIAKlaLottieAnimation named: '01-HW-Uebergang' css: 'startManual')
				backgroundAudioAsset: introAudio;
				yourself)		
		]
