rendering
renderPageContentOn: html
	self renderTopbarOn: html.

	moduleExercise ifNil: [ ^ self ].
	
	html div class: 'moduleTitle'; with: [
		html iconStation: self module indexCodeString
"		html div: self module indexCodeString" ].
	
	html div class: 'exercisePanels'; with: [
		self tasks do: [ :each |
			| taskExercise isNextTask |
			taskExercise := moduleExercise exerciseForTask: each.
			isNextTask := (each = nextTask).
			
			(self canGotoTaskExercise: taskExercise) ifTrue: [
				self
					renderGotoPage: 'exercise'
					animation: 'lottie-test'
					callback: [ :page | page gotoTaskExercise: taskExercise ]
					on: html
					with: [ 
						html div
							class: 'exercisePanel';
							with: [
								html div
									class: 'exerciseTitle';
									with: each title.
									
								taskExercise isFinished ifTrue: [
									html span class: 'progress'; with: [ html iconProgressFromPercent: 100 ].
									html span class: 'actionSymbol'; with: [ html iconRepeat ].
								] ifFalse: [
									html span class: 'progress'; with: [ html iconProgressFromPercent: 0 ].
									html span
										class: 'actionSymbol';
										class: 'nextTask' if: isNextTask;
										with: [ html iconRight ].
								].
						html div: '[INFO]'
					].
				]
			] ifFalse: [
				html div
					class: 'exercisePanel';
					with: [
						html span: 'GESPERRT' ] ]
		]].

	self renderFooterOn: html