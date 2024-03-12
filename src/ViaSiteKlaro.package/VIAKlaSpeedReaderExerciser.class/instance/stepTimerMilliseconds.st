as yet unclassified
stepTimerMilliseconds
	| factor limit |
	
	factor := 1.
	limit := 1000.

	"Timer is AFTER audio has played. So its more a pause-timer. 1 sec"
	self isStepListen ifTrue: [ ^ 1000 ].

	self isStepRead ifTrue: [
		
		self isSpeedSlow ifTrue: [ factor := 1.0. limit := 4000 ].
		self isSpeedNormal ifTrue: [ factor := 0.3. limit := 2000 ].
		self isSpeedFast ifTrue: [ factor := 0.15. limit := 1000 ].
	].

	"Faster on page speak"
	self isStepSpeak ifTrue: [
		
		"66% as long as reading, but not slower than normal speed"
		self isSpeedSlow ifTrue: [ factor := 0.2. limit := 3000 ].
		self isSpeedNormal ifTrue: [ factor := 0.2. limit := 2000 ].
		self isSpeedFast ifTrue: [ factor := 0.1. limit := 1000 ].
	].
	
	^ ((self currentText readDurationMilliseconds * factor) rounded) max: limit