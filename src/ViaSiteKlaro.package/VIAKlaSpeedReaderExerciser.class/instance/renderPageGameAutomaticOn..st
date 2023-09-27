rendering
renderPageGameAutomaticOn: html

	self isStepRead ifTrue: [ self renderAutomaticStepReadOn: html ].
	self isStepSpeak ifTrue: [ self renderAutomaticStepSpeakOn: html ].
	self isStepListen ifTrue: [ self renderAutomaticStepListenOn: html ].
	
	self renderProgressOn: html.
