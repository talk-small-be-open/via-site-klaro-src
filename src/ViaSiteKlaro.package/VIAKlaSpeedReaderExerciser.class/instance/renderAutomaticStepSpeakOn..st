rendering
renderAutomaticStepSpeakOn: html

	self preloadTimerAnimeOn: html with: [ :animeJs |
		animeJs
			targets: 'svg.sign.ellipsis circle.light';
			easing: 'easeInExpo';
			fill: '#BB1264'.
"			color: '#BB1264'"
	].


	self renderMainPlayAreaOn: html with: [

		self renderSpeedTextAreaOn: html with: [
			html imgSignEllipsis
		].

		self renderNavigationAreaOn: html with: [
			self renderAutomaticNavButtonsOn: html
		].

		self renderSubNavigationAreaOn: html with: [
	"		html pagerAction: [ self gotoFirstStep ] with: [ html span: 'back' ]."
			self renderAutomaticPlayPauseButtonOn: html.
		].
		self renderAutomaticTimerOn: html.
		self renderProgressOn: html.
	].

	self preloadTimerAnimeOn: html with: [ :animeJs |
		animeJs
			targets: 'div.speedTextArea svg.sign.ellipsis';
			easing: 'easeInExpo';
			color: '#BB1264'
	].
