rendering
renderAutomaticStepListenOn: html
	| jsAction |

	self renderSpeedTextAreaOn: html with: [
		html imgSignSound
	].

"	self preloadTimerAnimeOn: html with: [ :animeJs |
		animeJs
			targets: 'div.speedTextArea svg.sign.sound';
			easing: 'easeInExpo';
			color: '#BB1264'
	]."


	self renderNavigationAreaOn: html with: [
		self renderButtonReadOn: html.
		self renderButtonSpeakOn: html.
		self renderButtonListenOn: html.
	].

	self renderSubNavigationAreaOn: html with: [
"		html pagerAction: [ self gotoFirstStep ] with: [ html span: 'back' ]."

		self renderAutomaticTimerOn: html.
	].


	"JS goto next action, but with run-once wrapper, since we call it from different timers"
"	html script: (updateScript asFunction assignLocalTo: 'prepareNavigatorStageOnce').
	jsAction := (html jsPagerAction: [ self gotoNext ]) asOnceFunction."

"	jsAction := (html jsPagerAction: [ self gotoNext ])."

	"Start audio, timer, next page"
	html scriptDefer: (
"		(self jsPlayCurrentTextThen: (jsAction setTimeout: 1 second ))" " setTimeout: 0.1 second"
		self jsPlayCurrentTextThen: (JSStream on: 'speedReaderTimer.autostart();')

	).

	"Fallback: In case of audio not working, we go to the next step after 8 seconds or so"
	"PROBLEM: This timer will run in page-background, too ..."
"	html script: (jsAction setTimeout: 8 second )"
