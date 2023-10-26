icons
iconProgressFromPercent: anInteger

	anInteger = 0 ifTrue: [ ^ self svgImage: 'exercise_0_percent'. ].
	anInteger < 50 ifTrue: [ ^ self svgImage: 'exercise_50_percent'. ].
	anInteger <= 100 ifTrue: [ ^ self svgImage: 'exercise_100_percent'. ].
