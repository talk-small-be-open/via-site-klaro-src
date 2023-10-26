rendering
renderTitlePanelOn: html
	html div class: 'titlePanel'; with: [
		html div: [
			html iconStation: self module indexCodeString.
			self renderScoreOn: html ].
		html div: [
			currentExerciser renderTitlePanelContentOn: html ].
	]