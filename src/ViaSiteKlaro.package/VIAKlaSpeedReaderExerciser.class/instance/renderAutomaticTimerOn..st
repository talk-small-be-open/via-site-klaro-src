rendering
renderAutomaticTimerOn: html
	| js |
	js := JSStream new.
	
	js nextPutAll: 'countdown_start('.
	js nextPutAll: self currentText readDurationSeconds asString.
	js nextPutAll: ', '.
	js javascript: (html jsPagerAction: [ self gotoNext ]) asFunction.
	js nextPutAll: ');'.
	html scriptDefer: js.
	
"	html script: ((html jsPagerAction: [ self gotoNext ]) setTimeout: 3 second)"

	html span
		onClick: 'countdown_toggle();';
		with: 'pause/play'