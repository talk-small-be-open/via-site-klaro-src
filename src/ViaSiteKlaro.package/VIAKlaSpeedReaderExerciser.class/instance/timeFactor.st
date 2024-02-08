as yet unclassified
timeFactor
	| f |
	f := 1.
	
	self isSpeedNormal ifTrue: [ f := 0.8 ].

	self isSpeedSlow ifTrue: [ f := 1.5 ].
	self isSpeedFast ifTrue: [ f := 0.3 ].

	"Faster on page speak"
	self isStepSpeak ifTrue: [ f := f * (2/3) ].
	
	^ f