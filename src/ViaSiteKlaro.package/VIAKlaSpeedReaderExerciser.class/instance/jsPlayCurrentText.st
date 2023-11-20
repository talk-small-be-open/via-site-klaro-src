as yet unclassified
jsPlayCurrentText
	| js |
	js := JSStream new.
	
	self currentAudioAsset ifNotNil: [ :audio |
		js nextPutAll: ('PIXI.sound.play("', (audio uuidString), '");') ].

	^ js