as yet unclassified
jsInit
	| js jsPreloader |
	js := JSStream new.

	jsPreloader := [ :id :url |
		| urls options |
		urls := { url }. "TODO: All alternatives ogg, mp3 for browser support"
			
		options := { #url->urls. #preload->true. #singleInstance->true } aD.

		js nextPutAll: 'if (!PIXI.sound.exists("'.
		js nextPutAll: id.
		js nextPutAll: '")) {'.
		js nextPutAll: 'PIXI.sound.add("'.
		js nextPutAll: id.
		js nextPutAll: '", '.
		js javascript: options.
		js nextPutAll: ')}'
	].
	
	"Preload some funky sounds"
	jsPreloader value: 'new-word' value: '/site/sounds/new-word.wav'.
	
	"Preload all audio for this exercise"
	self allTexts do: [ :each |
		each audioAsset ifNotNil: [ :audio |
			| id url |
			id := audio uuidString.
			url := audio audioUrl.
			jsPreloader value: id value: url.
		]
	].

	^ js