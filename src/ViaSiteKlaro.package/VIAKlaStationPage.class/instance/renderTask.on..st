rendering
renderTask: aTask on: html

	| taskExercise isNextTask animation |
	taskExercise := moduleExercise exerciseForTask: aTask.
	isNextTask := (aTask = nextTask).

	animation := taskExercise isFinished ifTrue: [ nil ] ifFalse: [ '01-HW-Uebergang-APP-Schildkroete' ].
	
	(self canGotoTaskExercise: taskExercise) ifTrue: [
		self
			renderGotoPage: 'exercise'
			animation: animation
			callback: [ :page | page gotoTaskExercise: taskExercise ]
			on: html
			with: [ self renderTaskPanel: aTask class: nil on: html ]
	] ifFalse: [
		self renderTaskPanel: aTask class: 'disabled' on: html
	]