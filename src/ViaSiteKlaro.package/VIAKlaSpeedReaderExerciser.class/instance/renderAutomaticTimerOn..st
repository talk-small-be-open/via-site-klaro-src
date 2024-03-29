rendering
renderAutomaticTimerOn: html
	| js |
	js := JSStream new.
	
	js nextPutAll: 'speedReaderTimer.init('.
	js javascript: gameBoardId.
	js nextPutAll: ', '.
	js nextPutAll: self stepTimerMilliseconds asString.
	js nextPutAll: ', '.
	js javascript: (html jsPagerAction: [ self gotoNext ]) asFunction.
	js nextPutAll: ', '.
	js javascript: ((
			html jQuery ajax callback: [:d | self syncFromJsClient: d ] json: ('data' asJsStream)
		) asFunction: #(data)).
	js nextPutAll: ');'.
	
	"Auto start timer, but not first page, and not step listen"
	((self isFirstText and: [ self isFirstStep ]) or: [ self isStepListen ]) ifTrue: [
		"DO NOT start timer here, will be triggered elsewhere"
	] ifFalse: [
		"Start timer automatically, if not in pause state"
		self isRunning ifTrue: [
			js nextPutAll: 'speedReaderTimer.autostart();'
		]
	].
	
	html scriptDefer: js.
	
"	html script: ((html jsPagerAction: [ self gotoNext ]) setTimeout: 3 second)"

	html span
		class: 'playPauseButton';
		class: 'gameDefaultButton';
		onFastPointer: ('speedReaderTimer.toggle();' asJsStream);
"		onClick: 'speedReaderTimer.toggle();';"
		with: [ 
			html imgSignPause class: 'pause'.
			html imgSignPlay class: 'play'.
		].
	
	self renderAutomaticSpeedChooserOn: html.
		