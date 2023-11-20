accessing
addTextsString: aString website: aWebsite
	aString ifBlank: [ ^ self ].

	aString lines copyWithoutBlanks do: [ :each |
		| text |
		text := VIAKlaSpeedReadText new.
		text textPillar pillarString: each.
		self addText: text.
		
		text findAudioAssetInWebsite: aWebsite.

	]