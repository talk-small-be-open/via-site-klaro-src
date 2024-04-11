rendering
renderTitlePanelContentOn: html
	html span class: 'modeIndicator'; with: [
		self isModeAutomatic ifTrue: [
			self isSequenceBlitz
				ifTrue: [ html span: 'BLITZ' ]
				ifFalse: [ html iconAutomaticMode ]
		].
		self isModeManual ifTrue: [ html iconManualMode ]
	].
	
	self isModeAutomatic ifTrue: [
		html span class: 'modeControls'; with: [
			html anchor
				callback: [ self gotoModeManual ];
				with: [ html iconManualMode ].
			self isSequenceNormal ifTrue: [
				html anchor
					callback: [ self beSequenceBlitz ];
					with: [ html span: 'BLITZ' ]
			] ifFalse: [
				html anchor
					callback: [ self beSequenceNormal ];
					with: [ html iconAutomaticMode ]
			].
				
		]
	]