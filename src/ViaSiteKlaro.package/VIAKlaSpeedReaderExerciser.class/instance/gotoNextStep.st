as yet unclassified
gotoNextStep
	self isStepRead ifTrue: [ ^ self gotoStepSpeak ].
	self isStepSpeak ifTrue: [ ^ self gotoStepListen ].
	self isStepListen ifTrue: [ ^ self gotoNextText ].