rendering
renderAutomaticTimerOn: html
	| js |
	js := JSStream new.
	
	js nextPutAll: 'countdown_init('.
	js nextPutAll: self currentText readDurationSeconds asString.
	js nextPutAll: ', '.
	js javascript: (html jsPagerAction: [ self gotoNext ]) asFunction.
	js nextPutAll: ');'.
	
	(self isFirstText and: [ self isFirstStep ]) ifFalse: [ js nextPutAll: 'countdown_start();' ].
	
	html scriptDefer: js.
	
"	html script: ((html jsPagerAction: [ self gotoNext ]) setTimeout: 3 second)"

	html span
		class: 'playPauseButton';
		onClick: 'countdown_toggle();';
		with: [ 
			html imgSignPlay ]