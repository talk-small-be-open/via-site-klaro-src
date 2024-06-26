rendering
renderTitlePanelContentOn: html

	self isModeAutomatic ifTrue: [
		html span class: 'modeControls'; with: [
			html anchor
				callback: [ self gotoModeManual ];
				with: [ html iconManualModeSwitch ].
			self isSequenceNormal ifTrue: [
				html anchor
					callback: [ self gotoSequenceBlitz ];
					with: [ html iconBlitzSequenceSwitch ]
			] ifFalse: [
				html anchor
					callback: [ self gotoSequenceNormal ];
					with: [ html iconAutomaticModeSwitch ]
			].
				
		]
	].

	html span class: 'modeIndicator'; with: [
		self isModeAutomatic ifTrue: [
			self isSequenceBlitz
				ifTrue: [ html iconBlitzSequence ]
				ifFalse: [ html iconAutomaticMode ]
		].
		self isModeManual ifTrue: [ html iconManualMode ]
	]