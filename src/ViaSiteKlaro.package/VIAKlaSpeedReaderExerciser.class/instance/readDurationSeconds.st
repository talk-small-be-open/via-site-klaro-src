as yet unclassified
readDurationSeconds
	| factor limit |
	
	factor := 1.
	limit := 1.

	self isStepRead ifTrue: [
		
		self isSpeedSlow ifTrue: [ factor := 1.0. limit := 4 ].
		self isSpeedNormal ifTrue: [ factor := 0.3. limit := 2 ].
		self isSpeedFast ifTrue: [ factor := 0.15. limit := 1 ].
	].

	"Faster on page speak"
	self isStepSpeak ifTrue: [
		
		"66% as long as reading, but not slower than normal speed"
		self isSpeedSlow ifTrue: [ factor := 0.2. limit := 3 ].
		self isSpeedNormal ifTrue: [ factor := 0.2. limit := 1 ].
		self isSpeedFast ifTrue: [ factor := 0.1. limit := 1 ].
	].
	
	^ ((self currentText readDurationSeconds * factor) roundTo: 0.1) max: limit