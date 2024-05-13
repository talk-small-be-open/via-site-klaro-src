rendering
renderContentOn: html
	| jsClose |
	
	jsClose := (html jsPagerAction: [ self close ]).
	
	animation hasBackgroundAudio ifTrue: [
		| script play |
		script := JSScript new.
		script << (html pixiSoundAdd audioAsset: animation backgroundAudioAsset).

		play := html pixiSoundPlay audioAsset: animation backgroundAudioAsset.
		
		autoClose ifTrue: [
			play onComplete: jsClose ].

		script << play.
		
		html script: script
	].

	html div class: 'lottieAnimation';
"		class: 'lottieAnimation';"
		class: animation animationName;
		class: animation cssClass;
		onClick: jsClose;
		with: [
			| player |
			
			player := animation createLottiePlayerOn: html.

			animation hasBackgroundAudio ifTrue: [ player loop: true ].
				
			autoClose ifTrue: [
				animation hasBackgroundAudio ifFalse: [
					player onComplete: jsClose ]
			].	
		].