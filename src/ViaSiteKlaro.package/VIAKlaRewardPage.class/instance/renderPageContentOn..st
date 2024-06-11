rendering
renderPageContentOn: html

"	self renderTopbarOn: html."

	html render: self lottieAnimation.
	
	html div class: 'goAhead'; with: [
		self pager renderGotoPage: 'navigator' on: html with: [
"			html iconBack."
			html span class: 'standardButton'; sT: 'reward:goAhead' ] ].
	
	
"	html scriptDefer: (html pixiSoundPlay soundFile: 'zauber'; volume: 1)"