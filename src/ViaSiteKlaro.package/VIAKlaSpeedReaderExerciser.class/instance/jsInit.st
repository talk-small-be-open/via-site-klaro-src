as yet unclassified
jsInit
	| js |
	js := JSStream new.
	
	self allTexts do: [ :each |
		| id |
		id := each audioAsset uuidString.
		
		js nextPutAll: 'if (!PIXI.sound.exists("'.
		js nextPutAll: id.
		js nextPutAll: '")) {'.
		js nextPutAll: 'PIXI.sound.add("'.
		js nextPutAll: id.
		js nextPutAll: '", "'.
		js nextPutAll: each audioAsset audioUrl.
		js nextPutAll: '")}'
	].

	^ js