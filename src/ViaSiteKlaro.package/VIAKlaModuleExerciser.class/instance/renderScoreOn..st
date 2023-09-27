rendering
renderScoreOn: html
	html span class: 'moduleScore'; with: [
		self taskExercises withIndexDo: [:each :index |
"			html span: each percentFinished."
			each percentFinished = 100 ifTrue: [
				html svgImage: 'exercise_100_percent' ] ifFalse: [
					each percentFinished >= 50
						ifTrue: [ html svgImage: 'exercise_50_percent' ]
						ifFalse: [ html svgImage: 'exercise_0_percent' ]
				].
	]]
