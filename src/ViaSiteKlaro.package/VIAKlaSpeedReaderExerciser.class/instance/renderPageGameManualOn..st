rendering
renderPageGameManualOn: html
"	taskBrick showHistory ifTrue: [
		self renderHistoryOn: html.
	]."

	self isStepRead ifTrue: [ self renderManualStepReadOn: html ].
	self isStepSpeak ifTrue: [ self renderManualStepSpeakOn: html ].
	self isStepListen ifTrue: [ self renderManualStepListenOn: html ].
	
	self renderProgressOn: html.
"	gameOnceJs ifNotNil: [ html scriptDefer: gameOnceJs. gameOnceJs := nil ]."