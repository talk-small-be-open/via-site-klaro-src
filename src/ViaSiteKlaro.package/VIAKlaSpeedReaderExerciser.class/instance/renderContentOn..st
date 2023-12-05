rendering
renderContentOn: html
	
	html div id: gameBoardId; class: 'speedReader'; class: step; class: taskBrick uiStyle; with: [
		self renderPageLogicOn: html.

		self renderBetatestOn: html with: [
			html span: 'BETATEST: '.
			html anchor callback: [ self restart ]; with: 'RESTART'.
			html space.
			html anchor callback: [ self gotoModeAutomatic ]; with: 'GOTO-AUTO'.
		]
	].

	html scriptDefer: 	self jsInit