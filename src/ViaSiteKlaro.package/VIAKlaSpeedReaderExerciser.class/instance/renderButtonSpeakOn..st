rendering
renderButtonSpeakOn: html
	html span
		class: 'mainButton speak';
		with: [
			| isActive |
			
			isActive := self isStepSpeak or: [ self isSequenceBlitz ].
			
			html imgSignSpeak: isActive ]