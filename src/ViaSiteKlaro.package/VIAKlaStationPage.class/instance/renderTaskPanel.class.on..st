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
				html div
					class: 'exerciseTitle';
					with: aTask title.
				html div: [
					"Am Arbeiten oder fertig gearbeitet"
					taskExercise isDone ifTrue: [
"									html span class: 'progress'; with: [ html iconProgressFromPercent: 100 ]."
						html span class: 'actionSymbol'; with: [
							html imgSignRepeatManual.

							html
								clickSpan: (self jsGotoPage: 'exercise' callback: [ :page | page gotoTaskExercise: taskExercise auto: true ] on: html)
								with: [
									isNextTask ifTrue: [
										html span
											class: 'actionSymbol';
											class: 'nextTask' if: isNextTask;
											with: [ html imgSignRightShort ]
									] ifFalse: [
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

			html div class: 'rowTwo'; with: [
				aTask hasTeacherNotes ifTrue: [
					self renderInfoPanel: [ html span class: 'infoButton'; with: 'Info' ] on: html with: [
						html heading level1; with: aTask title.
						html div class: 'teacherNotes'; with: [ 
						html pillar: aTask teacherNotesPillar ] ] ]
			].


"				html anchor
					class: 'infoButton';
					callback: [ self showInfoTask: aTask ];
					with: 'Info'"
	].
