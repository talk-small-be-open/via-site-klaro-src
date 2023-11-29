rendering
renderContentOn: html
	
"	self addJavascript: '/js/outofthebox/tandem_sequence.js' on: html."

	html div id: gameBoardId; class: 'speedReader'; class: step; class: taskBrick uiStyle; with: [
		self renderPageLogicOn: html.

		"Outside of AJAX reload area. P2P needs to be active all the time"
"		self renderP2pSynchronizationOn: html."
"		self renderToolbarOn: html"
"		self renderTestdriveToolsOn: html."
		self renderBetatestOn: html with: [
			html span: 'BETATEST: '.
			html anchor callback: [ self restart ]; with: 'RESTART'.
			html space.
			html anchor callback: [ self gotoModeAutomatic ]; with: 'GOTO-AUTO'.
		]
	].

	html scriptDefer: 	self jsInit