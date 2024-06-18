as yet unclassified
stepTimerMilliseconds
	| factor limit |
	
	factor := 1.
	limit := 1000.

	"Timer is AFTER audio has played. So its more a pause-timer. 0 = no timer, a bit DIRTY.
	But we need some tiny amount of ms, see JS timer method 'enabled'.
	Will also be limited by the timers step which is minimum 250ms currently"
	self isStepListen ifTrue: [ ^ 100 ].

	self isStepRead ifTrue: [
		
		self isSpeedSlow ifTrue: [
			factor := self isSequenceBlitz ifTrue: [ 0.5 ] ifFalse: [ 1.0 ].
			limit := 4000.
		].
		self isSpeedNormal ifTrue: [
			factor := self isSequenceBlitz ifTrue: [ 0.25 ] ifFalse: [ 0.3 ].
			limit := 2000.
		].
		self isSpeedFast ifTrue: [
			factor := self isSequenceBlitz ifTrue: [ 0.12 ] ifFalse: [ 0.15 ].
			limit := 1000.
		].
	].

	"Faster on page speak"
	self isStepSpeak ifTrue: [
		
		"66% as long as reading, but not slower than normal speed"
		self isSpeedSlow ifTrue: [ factor := 0.2. limit := 3000 ].
		self isSpeedNormal ifTrue: [ factor := 0.2. limit := 2000 ].
		self isSpeedFast ifTrue: [ factor := 0.2. limit := 1000 ].
	].
	
	^ ((self currentText readDurationMilliseconds * factor) rounded) max: limit