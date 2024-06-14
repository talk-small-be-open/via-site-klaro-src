rendering
renderScoreOn: html
	html span class: 'moduleScore'; with: [
		self taskExercises withIndexDo: [:each :index |
"			html span: each percentFinished asString."
			html iconProgressPercent: each percentFinished active: self currentTaskExercise = each.
	]]