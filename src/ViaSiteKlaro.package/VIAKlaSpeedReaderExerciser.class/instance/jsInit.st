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