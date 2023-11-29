rendering
renderAutomaticTimerOn: html
	| js |
	js := JSStream new.
	
	js nextPutAll: 'speedReaderTimer.init('.
	js javascript: gameBoardId.
	js nextPutAll: ', '.
	js nextPutAll: self readDurationSeconds asString.
	js nextPutAll: ', '.
	js javascript: (html jsPagerAction: [ self gotoNext ]) asFunction.
	js nextPutAll: ');'.
	
	(self isFirstText and: [ self isFirstStep ]) ifFalse: [ js nextPutAll: 'speedReaderTimer.start();' ].
	
	html scriptDefer: js.
	
"	html script: ((html jsPagerAction: [ self gotoNext ]) setTimeout: 3 second)"

	html span
		class: 'playPauseButton';
		onClick: 'speedReaderTimer.toggle();';
		with: [ 
			html imgSignPause class: 'pause'.
			html imgSignPlay class: 'play'.
			html div class: 'speedChooser play'; with: [
				html div
					class: 'speed';
					onClick: (html jQuery ajax callback: [ self beSpeedSlow ]);
					with: [
						self isSpeedSlow ifTrue: [ html iconChecked ] ifFalse: [ html iconEmpty ].
						html span: 'langsam'].
				html div
					class: 'speed';
					onClick: (html jQuery ajax callback: [ self beSpeedNormal ]);
					with: [
						self isSpeedNormal ifTrue: [ html iconChecked ] ifFalse: [ html iconEmpty ].
						html span: 'normal'].
				html div
					class: 'speed';
					onClick: (html jQuery ajax callback: [ self beSpeedFast ]);
					with: [
						self isSpeedFast ifTrue: [ html iconChecked ] ifFalse: [ html iconEmpty ].
						html span: 'schnell'].
			]
		]