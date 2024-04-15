rendering
renderTitlePanelOn: html
	html div class: 'titlePanel'; with: [
		html div class: 'moduleStatusIndicator'; with: [
			html iconStation: self module indexCodeString.
			self renderScoreOn: html ].
		html div class: 'exerciserStatusIndicator'; with: [
			currentExerciser renderTitlePanelContentOn: html ].
	]