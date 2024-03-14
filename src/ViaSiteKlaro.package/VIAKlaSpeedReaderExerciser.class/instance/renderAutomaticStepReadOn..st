rendering
renderAutomaticStepReadOn: html
	self renderAutomaticStarterOverlayOn: html.

	self preloadTimerAnimeOn: html with: [ :animeJs |
		animeJs
			targets: 'div.speedText';
			easing: 'easeInExpo';
			color: '#BB1264'
	].

	self renderMainPlayAreaOn: html with: [
		self renderCurrentTextOn: html.

		self renderNavigationAreaOn: html with: [
			self renderButtonReadOn: html.
			self renderButtonSpeakOn: html.
			self renderButtonListenOn: html.
		].
		self renderSubNavigationAreaOn: html with: [
	"		html pagerAction: [ self gotoFirstStep ] with: [ html span: 'back' ]."
			self renderAutomaticTimerOn: html.
		].
		self renderProgressOn: html.
	]