rendering
renderTaskPanel: aTask class: aClassString on: html

	| taskExercise isNextTask |
	taskExercise := moduleExercise exerciseForTask: aTask.
	isNextTask := (aTask = nextTask).

	html div
		class: 'exercisePanel';
		class: aClassString;
		with: [
			html div class: 'rowOne'; with: [
				html div: [ 
					html div
						class: 'exerciseTitle';
						with: aTask title.
					aTask hasTeacherNotes ifTrue: [
						html div: [
							self renderInfoPanel: [ html span class: 'infoButton'; with: 'Info' ] on: html with: [
								html heading level1; with: aTask title.
								html div class: 'teacherNotes'; with: [ 
								html pillar: aTask teacherNotesPillar ] ] ] ]
				].
				html div: [

					| percent doneManual |
					percent := taskExercise percentFinished.
						
					doneManual := percent >=50.
"					doneAutomatic := percent >=100."
					
					"Am Arbeiten oder fertig gearbeitet"
					doneManual ifTrue: [
						html span class: 'actionSymbol'; with: [
							isNextTask ifTrue: [
								html
									clickSpan: (self pager jsGotoPage: 'exercise' callback: [ :page | page gotoTaskExercise: taskExercise auto: false ] on: html)
									with: [ html imgSignRepeatManual ]
							] ifFalse: [ html imgSignRepeatManual ].

							isNextTask ifTrue: [
								html span
									class: 'actionSymbol';
									class: 'nextTask' if: isNextTask;
									with: [ html imgSignRightShort ]
							] ifFalse: [
								html
									clickSpan: (self pager jsGotoPage: 'exercise' callback: [ :page | page gotoTaskExercise: taskExercise auto: true ] on: html)
									with: [
											html imgSignRepeatAutomatic
										].
							].
						].
					] ifFalse: [
"									html span class: 'progress'; with: [ html iconProgressFromPercent: 0 ]."
						"Completely untouched exercise"
						isNextTask ifTrue: [
							html span
								class: 'actionSymbol';
								class: 'nextTask' if: isNextTask;
								with: [ html imgSignRight ] ].
					]
				]
			].

"			html div class: 'rowTwo'; with: [
				aTask hasTeacherNotes ifTrue: [
					self renderInfoPanel: [ html span class: 'infoButton'; with: 'Info' ] on: html with: [
						html heading level1; with: aTask title.
						html div class: 'teacherNotes'; with: [ 
						html pillar: aTask teacherNotesPillar ] ] ]
			]."


"				html anchor
					class: 'infoButton';
					callback: [ self showInfoTask: aTask ];
					with: 'Info'"
	].
