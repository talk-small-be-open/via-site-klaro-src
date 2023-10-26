rendering
renderScoreOn: html
	html span class: 'moduleScore'; with: [
		self taskExercises withIndexDo: [:each :index |
			html iconProgressFromPercent: each percentFinished.
	]]