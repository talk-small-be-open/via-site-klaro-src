rendering
renderAutomaticStepListenOn: html
	self renderSpeedTextAreaOn: html with: [
		html imgSignSound
	].

	self preloadTimerAnimeOn: html with: [ :animeJs |
		animeJs
			targets: 'div.speedTextArea svg.sign.sound';
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
	].


	html script: (self jsPlayCurrentText setTimeout: 0.1 second)