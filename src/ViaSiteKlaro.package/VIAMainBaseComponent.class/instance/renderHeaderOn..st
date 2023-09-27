rendering
renderHeaderOn: html
	html div class: 'klaroHeader'; with: [ 
		self renderNavbarContentOn: html.
		self renderOffcanvasOn: html.
	]