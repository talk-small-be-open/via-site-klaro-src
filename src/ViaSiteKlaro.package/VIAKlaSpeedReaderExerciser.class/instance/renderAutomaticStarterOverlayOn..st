rendering
renderAutomaticStarterOverlayOn: html

	html div
"		onClick: ((html jQuery this hide), 'speedReaderTimer.start();' asJsStream);"
		class: 'automaticStarter';
		with: [ 
			html div: [
				self isSequenceBlitz
					ifTrue: [ html iconBlitzSequence ]
					ifFalse: [ html iconAutomaticMode ].
			].
			html div class: 'starterButton'; with: [
				html pagerAction: [ self startAutoNormal ] with: [
					html div: 'START'.
					html imgSignPlayGross ].
		].

		html div class: 'speedChooser'; with: [
			html div
				class: 'speed labeled left';
				with: [
					html pagerAction: [ self startAutoSlow ] with: [
						html imgSignPlayGross.
						html span class: 'label'; with: 'langsam'.
					].
				].

"			html div class: 'line'.

			html div
				class: 'speed';
				with: [
					html iconRadioButtonChecked.
				].

			html div class: 'line'."

			html div
				class: 'speed labeled right';
				with: [
					html pagerAction: [ self startAutoFast ] with: [
						html imgSignPlayGross.
						html span class: 'label'; with: 'schnell'.
					].
				]
		]
	]