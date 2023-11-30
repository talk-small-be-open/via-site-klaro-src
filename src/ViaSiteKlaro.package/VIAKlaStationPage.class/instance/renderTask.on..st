rendering
renderTask: aTask on: html

	| taskExercise isNextTask animation |
	taskExercise := moduleExercise exerciseForTask: aTask.
	isNextTask := (aTask = nextTask).

	animation := taskExercise isFinished ifTrue: [ nil ] ifFalse: [ 'lottie-test' ].
	
	(self canGotoTaskExercise: taskExercise) ifTrue: [
		self
			renderGotoPage: 'exercise'
			animation: animation
			callback: [ :page | page gotoTaskExercise: taskExercise ]
			on: html
			with: [ 
				html div
					class: 'exercisePanel';
					with: [
						html div: [
							html div
								class: 'exerciseTitle';
								with: aTask title.
							(html clickSpan: (html javascript alert: 'TODO'))
								class: 'infoButton';
	"							callback: [ self showInfoTask: aTask ];"
								with: 'Info'. ].
						html div: [
							taskExercise isFinished ifTrue: [
"									html span class: 'progress'; with: [ html iconProgressFromPercent: 100 ]."
								html span class: 'actionSymbol'; with: [
									html imgSignRepeatManual.

									html
										clickSpan: (self jsGotoPage: 'exercise' callback: [ :page | page gotoTaskExercise: taskExercise auto: true ] on: html)
										with: [ html imgSignRepeatAutomatic ].
								].
							] ifFalse: [
"									html span class: 'progress'; with: [ html iconProgressFromPercent: 0 ]."
								html span
									class: 'actionSymbol';
									class: 'nextTask' if: isNextTask;
									with: [ html imgSignRight ].
					]]
			]
		]
	] ifFalse: [
		html div
			class: 'exercisePanel';
			with: [
				html span: 'GESPERRT' ] ]