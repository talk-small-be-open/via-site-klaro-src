accessing
addTextsString: aString website: aWebsite
	aString ifBlank: [ ^ self ].

	aString lines copyWithoutBlanks do: [ :each |
		| text |
		text := VIAKlaSpeedReadText new.
		text pillarString: each.
		self addText: text.
		
		text findAudioAssetInWebsite: aWebsite.

	]