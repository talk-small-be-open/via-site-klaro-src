as yet unclassified
gotoNextStep
	"Steps sequencer logic"

	"Blitz-Modus sequence. Just show the word, then next word"
	"Probably never gets into here, because the first is also the LAST step, and therefore
	will be set earlier in the logic. But anyway:"
	self isSequenceBlitz ifTrue: [
		self isStepRead ifTrue: [ ^ self gotoNextText ].
		"Should never be there, but initially maybe"
		self isStepSpeak ifTrue: [ ^ self gotoNextText ].
		self isStepListen ifTrue: [ ^ self gotoNextText ].
	].
	
	"Default sequence"
	self isStepRead ifTrue: [ ^ self gotoStepSpeak ].
	self isStepSpeak ifTrue: [ ^ self gotoStepListen ].
	self isStepListen ifTrue: [ ^ self gotoNextText ].