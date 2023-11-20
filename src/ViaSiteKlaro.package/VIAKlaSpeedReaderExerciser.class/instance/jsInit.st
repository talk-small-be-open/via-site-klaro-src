as yet unclassified
jsInit
	| js |
	js := JSStream new.
	
	self allTexts do: [ :each |
		each audioAsset ifNotNil: [ :audio |
			| id |
			id := audio uuidString.
			
			js nextPutAll: 'if (!PIXI.sound.exists("'.
			js nextPutAll: id.
			js nextPutAll: '")) {'.
			js nextPutAll: 'PIXI.sound.add("'.
			js nextPutAll: id.
			js nextPutAll: '", "'.
			js nextPutAll: audio audioUrl.
			js nextPutAll: '")}'
		]
	].

	^ js