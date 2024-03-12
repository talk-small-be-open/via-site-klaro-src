as yet unclassified
jsPlayCurrentTextThen: aJsCallbackScript
	| js |
	
	self currentAudioAsset ifNil: [ 

		"Having no audio is like having a zero-length audio. Its like immediately played"
		js := aJsCallbackScript

	] ifNotNil: [ :audio |

		| options |

		js := JSStream new.
		
		"See https://pixijs.io/sound/docs/PlayOptions.html"
		options := { #loop->false. #singleInstance->true } aD.
		
		aJsCallbackScript ifNotBlank: [ options at: #complete put: aJsCallbackScript asFunction ].
		
		js nextPutAll: 'if (PIXI.sound.exists('.
		js javascript: audio uuidString.
		js nextPutAll: ')) '.
		js nextPutAll: 'PIXI.sound.play('.
		js javascript: audio uuidString.
		js nextPutAll: ','.
		js javascript: options.
		js nextPutAll: ');'.
		
	].

	^ js