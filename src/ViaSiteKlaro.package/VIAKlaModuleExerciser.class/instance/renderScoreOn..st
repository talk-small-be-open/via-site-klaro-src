rendering
renderScoreOn: html
	html span class: 'moduleScore'; with: [
		self taskExercises withIndexDo: [:each :index |
			html iconProgressPercent: each percentFinished active: self currentTaskExercise = each.
	]]