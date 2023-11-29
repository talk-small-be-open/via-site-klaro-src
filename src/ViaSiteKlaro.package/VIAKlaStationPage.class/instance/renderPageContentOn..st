rendering
renderPageContentOn: html

	self renderTopbarOn: html.

	moduleExercise ifNil: [ ^ self ].
	
	html div class: 'moduleTitle'; with: [
		html iconStation: self module indexCodeString
"		html div: self module indexCodeString" ].
	
	html div class: 'exercisePanels'; with: [
		self tasks do: [ :each |
			| taskExercise isNextTask animation |
			taskExercise := moduleExercise exerciseForTask: each.
			isNextTask := (each = nextTask).
	
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
										with: each title.
									html span
										class: 'infoButton';
										onClick: (('event.stopPropagation()' asJsStream), (html javascript alert: 'TODO'));
			"							callback: [ self showInfoTask: each ];"
										with: 'Info'. ].
								html div: [
									taskExercise isFinished ifTrue: [
	"									html span class: 'progress'; with: [ html iconProgressFromPercent: 100 ]."
										html span class: 'actionSymbol'; with: [
											html imgSignRepeatManual.
											html imgSignRepeatAutomatic.
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
		]].

	self renderFooterOn: html