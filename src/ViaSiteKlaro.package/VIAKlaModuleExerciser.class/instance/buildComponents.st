as yet unclassified
buildComponents

	exerciserComponents := Array new: model tasks size.
	
	model tasks do: [:each |
		| taskIndex taskExerciser |
		taskIndex := model tasks indexOf: each.

		taskExerciser := self buildExerciseComponentForTask: each.
		taskExerciser onAnswer: [self finish].

"			parent: self."
"Kein auto-weiter			onFinish: [self gotoNextOrFinish];"
"KEIN implizites checken der anderen			onCheckButton: [self checkAllExcept: taskExerciser];"
		
		exerciserComponents
			at: taskIndex
			put: taskExerciser
	]