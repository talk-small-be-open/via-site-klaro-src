as yet unclassified
timeFactor
	self isSpeedNormal ifTrue: [ ^ 1 ].

	self isSpeedSlow ifTrue: [ ^ 2 ].
	self isSpeedFast ifTrue: [ ^ 0.5 ].