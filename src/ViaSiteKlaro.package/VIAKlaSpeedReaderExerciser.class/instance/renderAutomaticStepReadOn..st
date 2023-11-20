rendering
renderAutomaticStepReadOn: html
	self renderAutomaticStarterOverlayOn: html.

	self renderCurrentTextOn: html.
	
	self preloadTimerAnimeOn: html with: [ :animeJs |
		animeJs
			targets: 'div.speedText';
			easing: 'easeInExpo';
			color: '#BB1264'
	].

	self renderNavigationAreaOn: html with: [
		self renderButtonReadOn: html.
		self renderButtonSpeakOn: html.
		self renderButtonListenOn: html.
	].
	self renderSubNavigationAreaOn: html with: [
"		html pagerAction: [ self gotoFirstStep ] with: [ html span: 'back' ]."
		self renderAutomaticTimerOn: html.
	]