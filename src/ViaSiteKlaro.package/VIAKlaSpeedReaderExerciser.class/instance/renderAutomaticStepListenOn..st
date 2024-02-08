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

"no timer, but after audio		self renderAutomaticTimerOn: html."
	].


	html script: (
		(self jsPlayCurrentTextThen: (
			( html jsPagerAction: [ self gotoNext ] ) setTimeout: 1 second )
		) setTimeout: 0.2 second
	)