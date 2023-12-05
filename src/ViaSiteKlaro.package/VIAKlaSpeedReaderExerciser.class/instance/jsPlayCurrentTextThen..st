as yet unclassified
jsPlayCurrentTextThen: aJsCallback
	| js |
	js := JSStream new.
	
	self currentAudioAsset ifNotNil: [ :audio |
		| options |
		
		"See https://pixijs.io/sound/docs/PlayOptions.html"
		options := { #loop->false. #singleInstance->true } aD.
		
		aJsCallback ifNotBlank: [ options at: #complete put: aJsCallback asFunction ].
		
		js nextPutAll: 'PIXI.sound.play('.
		js javascript: audio uuidString.
		js nextPutAll: ','.
		js javascript: options.
		js nextPutAll: ');'.
		
	].

	^ js