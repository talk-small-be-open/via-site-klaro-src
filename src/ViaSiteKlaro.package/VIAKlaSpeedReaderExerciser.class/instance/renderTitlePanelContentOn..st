rendering
renderTitlePanelContentOn: html
	html span class: 'modeIndicator'; with: [
		self isModeAutomatic ifTrue: [ html iconAutomaticMode ].
		self isModeManual ifTrue: [ html iconManualMode ] ].