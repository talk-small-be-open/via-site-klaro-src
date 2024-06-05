rendering
renderManualStepListenOn: html
	| jsSoundFinished |
	
	jsSoundFinished := (html jQuery id: gameBoardId) addClass: 'hasPlayedSpeech'.
	
	self renderMainPlayAreaOn: html with: [
	
		self renderSpeedTextAreaOn: html with: [
			html imgSignSound
		].
			
		self renderNavigationAreaOn: html with: [
			html pagerAction: [ self gotoStepRead ] with: [ self renderButtonReadOn: html ].
			self renderButtonSpeakOn: html.
			html div class: 'listenButtons'; with: [
				self renderButtonListenOn: html.
				self renderButtonListenReplayOn: html ].
	"		html pagerAction: [ self gotoStepRead ] with: [ html span: 'back' ].
			html pagerAction: [ self gotoNext ] with: [ html span: 'next' ]."
		].
		self renderSubNavigationAreaOn: html with: [
			html div class: 'redoDoneButtons'; with: [
				html pagerAction: [ self gotoStepRead ] with: [
					html span class: 'redoButton'; with: [ 
						html svgImage: 'bewertung_links_1' ] ].
				html pagerAction: [ self gotoNext ] with: [
					html span class: 'doneButton'; with: [ 
						html svgImage: 'bewertung_rechts_1' ]
				]
	"			self renderButtonNextOn: html"
			].
		].
		self renderProgressOn: html.
	].

"Delay war störend	html script: ((self jsPlayCurrentTextThen: jsSoundFinished) setTimeout: 0.2 second)."
	html scriptDefer: (self jsPlayCurrentTextThen: jsSoundFinished)
