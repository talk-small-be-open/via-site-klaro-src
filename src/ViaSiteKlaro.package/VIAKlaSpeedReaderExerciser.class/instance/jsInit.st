as yet unclassified
jsInit
	| js |
	js := JSStream new.
	
	"Preload all audio for this exercise"
	self allTexts do: [ :each |
		each audioAsset ifNotNil: [ :audio |
			| id urls |
			id := audio uuidString.
			
			urls := { audio audioUrl. }. "TODO: All alternatives ogg, mp3 for browser support"
			
			js nextPutAll: 'if (!PIXI.sound.exists("'.
			js nextPutAll: id.
			js nextPutAll: '")) {'.
			js nextPutAll: 'PIXI.sound.add("'.
			js nextPutAll: id.
			js nextPutAll: '", '.
			js javascript: urls.
			js nextPutAll: ')}'
		]
	].

	^ js