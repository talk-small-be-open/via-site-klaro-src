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
			self renderAutomaticNavButtonsOn: html
		].
		self renderSubNavigationAreaOn: html with: [
	"		html pagerAction: [ self gotoFirstStep ] with: [ html span: 'back' ]."
			self renderAutomaticPlayPauseButtonOn: html.
		].
		self renderAutomaticTimerOn: html.
		self renderProgressOn: html.
	]