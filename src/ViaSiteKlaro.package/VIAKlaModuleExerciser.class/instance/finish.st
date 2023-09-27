as yet unclassified
finish
"	self inform: 'moduleExerciser:exerciseIsFinished'"
	self close.
	
	self session addJsUiInstruction: [ :js | js alert: 'module exercise finished' ]