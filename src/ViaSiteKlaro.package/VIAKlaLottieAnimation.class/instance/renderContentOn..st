rendering
renderContentOn: html
	| jsClose |
	
	jsClose := (html jsPagerAction: [ self close ]).
	
	self hasBackgroundAudio ifTrue: [
		| script play |
		script := JSScript new.
		script << (html pixiSoundAdd audioAsset: backgroundAudioAsset).

		play := html pixiSoundPlay audioAsset: backgroundAudioAsset.
		
		autoClose ifTrue: [
			play onComplete: jsClose ].

		script << play.
		
		html script: script
	].

	html div class: 'lottieAnimation';
"		class: 'lottieAnimation';"
		class: animationName;
		class: cssClass;
		onClick: jsClose;
		with: [
			| player |
			
			player := html lottiePlayer
				src: ('/site/animations/', animationName, '.lottie');
				loop: self hasBackgroundAudio not;
				autoplay: true.
				
			autoClose ifTrue: [
				self hasBackgroundAudio ifFalse: [
					player onComplete: jsClose ]
			].	
		].