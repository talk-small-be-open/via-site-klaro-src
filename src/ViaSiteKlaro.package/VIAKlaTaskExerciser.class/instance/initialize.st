initialization
initialize
	super initialize.

	"Ungenerischer Spezialfall: Speed Reader muss früh schon erzeugt werden, da wir im Kopf
	ein Partial rendern.
	Falls noch weitere Übungstypen dazukommen, dies hier mit einem Visitor machen ala prepareExercisers"
	
	"a bit dirty but OK"
	exercise task children firstOrNil ifNotNil: [ :brick |
		(brick isKindOf: VIAKlaSpeedReader) ifTrue: [
			mainSpeedReader := self exerciserFor: brick class: VIAKlaSpeedReaderExerciser.
			
			mainSpeedReader onAnswer: [ self finish "close" ]
		]
	]