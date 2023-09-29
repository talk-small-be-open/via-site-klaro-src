rendering
renderPageContentOn: html
	self renderTopbarOn: html.

	moduleExercise ifNil: [ ^ self ].
	
	html div class: 'title'; with: [
		html div: self module indexCodeString ].
	
	self tasks do: [ :each |
		| taskExercise |
		taskExercise := moduleExercise exerciseForTask: each.
		
		html div
			class: 'exercisePanel';
			with: [
				(self canGotoTaskExercise: taskExercise) ifTrue: [
					self
						renderGotoPage: 'exercise'
						animation: 'lottie-test'
						callback: [ :page | page gotoTaskExercise: taskExercise ]
						on: html
						with: [ 
							html div
								class: 'exerciseLink';
								with: [ 
									html span: each title.
									taskExercise isFinished
										ifTrue: [ html span: 'o <>' ]
										ifFalse: [ html span: '. ->' ].
								].
						].
					html div: '[INFO]'
				] ifFalse: [ 
					html span: 'GESPERRT' ]
			]
	].

