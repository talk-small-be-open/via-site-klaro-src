rendering
renderManualStepSpeakOn: html

	self renderSpeedTextAreaOn: html with: [
		html imgSignEllipsis
	].
	
	self renderNavigationAreaOn: html with: [
		html pagerAction: [ self gotoStepRead ] with: [ self renderButtonReadOn: html ].
		self renderButtonSpeakOn: html.
		html pagerAction: [ self gotoStepListen ] with: [ self renderButtonListenOn: html ].
	].
	self renderSubNavigationAreaOn: html with: [
		html pagerAction: [ self gotoNext ] with: [ self renderButtonNextOn: html ].
	]
