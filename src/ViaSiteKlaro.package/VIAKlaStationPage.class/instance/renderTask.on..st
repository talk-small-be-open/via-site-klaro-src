rendering
renderTask: aTask on: html

	| taskExercise isNextTask animation |
	taskExercise := moduleExercise exerciseForTask: aTask.
	isNextTask := (aTask = nextTask).

	animation := taskExercise isFinished ifTrue: [ nil ] ifFalse: [ VIAKlaAnimation named: '01-HW-Uebergang-Schildkroete' ].
	
	(self canGotoTaskExercise: taskExercise) ifTrue: [
		self pager
			renderGotoPage: 'exercise'
			showAnimation: animation
			in: 'slide'
			out: 'appear'
			callback: [ :page | page gotoTaskExercise: taskExercise ]
			on: html
			with: [ self renderTaskPanel: aTask class: nil on: html ]
	] ifFalse: [
		self renderTaskPanel: aTask class: 'disabled' on: html
	]