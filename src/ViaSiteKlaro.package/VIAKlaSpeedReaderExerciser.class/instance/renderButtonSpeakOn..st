rendering
renderButtonSpeakOn: html
	html span
		class: 'mainButton speak';
		class: 'active' if: self isStepSpeak;
		with: [ 
			html imgSignSpeak ]