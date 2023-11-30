rendering
renderContentOn: html
	html div: title.
	html div: body.
	
	html anchorButton
		callback: [ self close ];
		with: 'Schliessen'