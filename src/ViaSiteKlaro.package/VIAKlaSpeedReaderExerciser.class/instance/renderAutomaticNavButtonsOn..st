rendering
renderAutomaticNavButtonsOn: html

	self isSequenceNormal ifTrue: [
		self renderButtonReadOn: html.
		self renderButtonSpeakOn: html.
		self renderButtonListenOn: html.
	].

	self isSequenceBlitz ifTrue: [
		self renderButtonSpeakOn: html.
	]