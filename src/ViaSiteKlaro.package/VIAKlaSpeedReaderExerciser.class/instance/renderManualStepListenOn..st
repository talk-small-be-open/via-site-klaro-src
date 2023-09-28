rendering
renderManualStepListenOn: html
	self renderCurrentTextOn: html.

	self renderNavigationAreaOn: html with: [
		html pagerAction: [ self gotoStepRead ] with: [ self renderButtonReadOn: html ].
		self renderButtonSpeakOn: html.
		self renderButtonListenOn: html.
"		html pagerAction: [ self gotoStepRead ] with: [ html span: 'back' ].
		html pagerAction: [ self gotoNext ] with: [ html span: 'next' ]."
	].
	self renderSubNavigationAreaOn: html with: [
		html pagerAction: [ self gotoStepRead ] with: [
			html span class: 'nextButton'; with: [ 
				html svgImage: 'bewertung_links_1' ] ].
		html pagerAction: [ self gotoNext ] with: [
			html span class: 'nextButton'; with: [ 
				html svgImage: 'bewertung_rechts_1' ]
"			self renderButtonNextOn: html"
		].
	].

	html script: (self jsPlayCurrentText setTimeout: 0.2 second)