rendering
renderAutomaticStarterOverlayOn: html

	(self isFirstText and: [ self isFirstStep ]) ifTrue: [
		html div
			onClick: ((html jQuery this hide), 'speedReaderTimer.start();' asJsStream);
			class: 'automaticStarter';
			with: [ 
				html div: [
					html div: 'START'.
					html imgSignPlayGross.
				] ]
	]