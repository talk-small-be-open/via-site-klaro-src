rendering
renderTitlePanelOn: html
	html div class: 'titlePanel'; with: [ 
		html span: self module indexCodeString.
		html space; space.
		self renderScoreOn: html.
		currentExerciser renderTitlePanelContentOn: html.
	]