as yet unclassified
jsInit
	| js jsPreloader |
	js := JSScript new.

	jsPreloader := [ :id :url |
		js << (js pixiSoundAdd
			id: id;
			url: url;
			yourself).
	].
	
	"Preload some funky sounds"
	jsPreloader value: 'new-word' value: '/site/sounds/585256_neues_Wort.mp3'.
	
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