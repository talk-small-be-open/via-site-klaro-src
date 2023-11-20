rendering
renderAutomaticStarterOverlayOn: html

	(self isFirstText and: [ self isFirstStep ]) ifTrue: [
		html div
			onClick: ((html jQuery this hide), 'countdown_start();' asJsStream);
			class: 'automaticStarter';
			with: [ 
				html div: 'START' ]
	]