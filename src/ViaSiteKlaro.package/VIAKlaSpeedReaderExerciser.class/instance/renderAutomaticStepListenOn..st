rendering
renderAutomaticStepListenOn: html
	self renderCurrentTextOn: html.

	self renderNavigationAreaOn: html with: [
		self renderButtonReadOn: html.
		self renderButtonSpeakOn: html.
		self renderButtonListenOn: html.
	].

	self renderSubNavigationAreaOn: html with: [
"		html pagerAction: [ self gotoFirstStep ] with: [ html span: 'back' ]."

"Oder evt. hier ein STOP und nur weiter auf Knopdruck?"
		self renderAutomaticTimerOn: html.
	].


	html script: (self jsPlayCurrentText setTimeout: 0.1 second)