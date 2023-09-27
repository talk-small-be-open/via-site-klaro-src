rendering
renderAutomaticStepReadOn: html
	self renderCurrentTextOn: html.

	self renderNavigationAreaOn: html with: [
		self renderButtonReadOn: html.
		self renderButtonSpeakOn: html.
		self renderButtonListenOn: html.
	].
	self renderSubNavigationAreaOn: html with: [
"		html pagerAction: [ self gotoFirstStep ] with: [ html span: 'back' ]."
		self renderAutomaticTimerOn: html.
	]