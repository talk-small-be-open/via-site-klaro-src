rendering
renderAutomaticStepListenOn: html

"Ich glaub das macht kein Sinn:"
"	self preloadTimerAnimeOn: html with: [ :animeJs |
		animeJs
			targets: 'svg.sign.sound path.light';
			easing: 'easeInExpo';
			fill: '#BB1264'.
	]."


	self renderMainPlayAreaOn: html with: [

		self renderSpeedTextAreaOn: html with: [
			html imgSignSound
		].

		self renderNavigationAreaOn: html with: [
			self renderAutomaticNavButtonsOn: html
		].

		self renderSubNavigationAreaOn: html with: [
			self renderAutomaticPlayPauseButtonOn: html.
		].
		self renderAutomaticTimerOn: html.
		self renderProgressOn: html.
	].

	"Start audio, timer, next page"
	html scriptDefer: (
		(self jsPlayCurrentTextThen: (JSStream on: 'speedReaderTimer.autostart();')) setTimeout: 500
	).

	"Fallback: In case of audio not working, we go to the next step after 8 seconds or so"
	"PROBLEM: This timer will run in page-background, too ..."
"	html script: (jsAction setTimeout: 8 second )"
