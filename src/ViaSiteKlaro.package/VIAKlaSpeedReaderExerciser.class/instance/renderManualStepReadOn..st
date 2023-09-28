rendering
renderManualStepReadOn: html

	self renderCurrentTextOn: html.
	self renderNavigationAreaOn: html with: [
		self renderButtonReadOn: html.
		html pagerAction: [ self gotoNext ] with: [ self renderButtonSpeakOn: html ].
		self renderButtonListenOn: html.
	].
	self renderSubNavigationAreaOn: html with: [
		html pagerAction: [ self gotoNext ] with: [ self renderButtonNextOn: html ].
	]