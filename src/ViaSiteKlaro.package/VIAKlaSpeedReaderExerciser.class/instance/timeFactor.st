as yet unclassified
timeFactor
	| f |
	f := 1.

	self isStepRead ifTrue: [
		
		self isSpeedSlow ifTrue: [ f := 1.0 ].
		self isSpeedNormal ifTrue: [ f := 0.3 ].
		self isSpeedFast ifTrue: [ f := 0.2 ].
	].

	"Faster on page speak"
	self isStepSpeak ifTrue: [
		"66% as long as reading, but not slower than normal speed"
		self isSpeedSlow ifTrue: [ f := 0.2 ].
		self isSpeedNormal ifTrue: [ f := 0.2 ].
		self isSpeedFast ifTrue: [ f := 0.133 ].
	].
	
	^ f