rendering
renderContentOn: html
	| jsClose |
	
	jsClose := (html jsPagerAction: [ self close ]).
	
	self hasBackgroundAudio ifTrue: [
		| script |
		script := JSScript new.
		script << (html pixiSoundAdd audioAsset: backgroundAudioAsset).
		script << (html pixiSoundPlay audioAsset: backgroundAudioAsset).
		
		html script: script
	].

	html div class: 'lottieAnimation';
"		class: 'lottieAnimation';"
		class: animationName;
		class: cssClass;
		onClick: jsClose;
		with: [
			html lottiePlayer
				src: ('/site/animations/', animationName, '.lottie');
				autoplay: true;
				onComplete: jsClose ].