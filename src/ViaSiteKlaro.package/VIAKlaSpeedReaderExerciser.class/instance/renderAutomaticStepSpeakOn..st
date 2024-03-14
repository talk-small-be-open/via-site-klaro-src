rendering
renderAutomaticStepSpeakOn: html

	self renderMainPlayAreaOn: html with: [

		self renderSpeedTextAreaOn: html with: [
			html imgSignEllipsis
		].

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
	].

	self preloadTimerAnimeOn: html with: [ :animeJs |
		animeJs
			targets: 'div.speedTextArea svg.sign.ellipsis';
			easing: 'easeInExpo';
			color: '#BB1264'
	].
