rendering
renderAutomaticPlayPauseButtonOn: html
	html span
		class: 'playPauseButton';
		class: 'gameDefaultButton';
		onFastPointer: ('speedReaderTimer.toggle();' asJsStream);
"		onClick: 'speedReaderTimer.toggle();';"
		with: [ 
			html imgSignPause class: 'pause'.
			html imgSignPlay class: 'play'.
		].