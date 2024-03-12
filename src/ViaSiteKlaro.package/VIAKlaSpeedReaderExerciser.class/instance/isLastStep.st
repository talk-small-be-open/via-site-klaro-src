as yet unclassified
isLastStep
	
	"blitz sequence"
	self isSequenceBlitz ifTrue: [ ^ self isStepRead ].
	
	"Normal sequence"
	^ self isStepListen