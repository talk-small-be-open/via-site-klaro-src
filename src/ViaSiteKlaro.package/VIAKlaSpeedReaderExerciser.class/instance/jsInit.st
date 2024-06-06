as yet unclassified
jsInit
	| js |
	js := JSScript new.
	
	"Preload some funky sounds"
	js << (js pixiSoundAdd preload: true; id: 'new-word'; url: '/site/sounds/neues-wort.m4a').
	js << (js pixiSoundAdd preload: true; id: 'new-word-magic-spell'; url: '/site/sounds/zauber.m4a').
		
	"Preload all audio for this exercise"
	self allTexts do: [ :each |
		each audioAsset ifNotNil: [ :audio |
			js << (js pixiSoundAdd audioAsset: audio; preload: true).
		]
	].

	^ js