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
	jsPreloader value: 'new-word' value: '/site/sounds/585256_neues_Wort.m4a'.
	jsPreloader value: 'new-word-magic-spell' value: '/site/sounds/379993_Zauber.m4a'.
	
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