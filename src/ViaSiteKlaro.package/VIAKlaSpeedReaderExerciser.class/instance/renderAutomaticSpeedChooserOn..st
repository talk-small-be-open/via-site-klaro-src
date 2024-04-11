rendering
renderAutomaticSpeedChooserOn: html

"	html div class: 'speedChooser'; with: [
		html div
			class: 'speed';
			with: [
				self isSpeedSlow ifTrue: [ html iconChecked ] ifFalse: [ html iconEmpty ].
				html pagerAction: [ self beSpeedSlow ] with: [ html span: 'langsam' ].
			].
		html div
			class: 'speed';
			with: [
				self isSpeedNormal ifTrue: [ html iconChecked ] ifFalse: [ html iconEmpty ].
				html pagerAction: [ self beSpeedNormal ] with: [ html span: 'normal' ].
			].
		html div
			class: 'speed';
			with: [
				self isSpeedFast ifTrue: [ html iconChecked ] ifFalse: [ html iconEmpty ].
				html pagerAction: [ self beSpeedFast ] with: [ html span: 'schnell' ].
			].
		html div
			class: 'speed';
			with: [
""				self isSpeedFast ifTrue: [ html iconChecked ] ifFalse: [ html iconEmpty ].""
				html pagerAction: [ self beSequenceBlitz ] with: [ html span: 'TBD Blitz' ].
			].
	]"


	html div class: 'speedChooser'; with: [
		html div
			class: 'speed';
			with: [
				html pagerAction: [ self beSpeedSlow ] with: [
					html span: 'langsam'.
					self isSpeedSlow ifTrue: [ html iconRadioButtonChecked ] ifFalse: [ html iconRadioButton ]
				].
			].

		html div class: 'line'.

		html div
			class: 'speed';
			with: [
				html pagerAction: [ self beSpeedNormal ] with: [ self isSpeedNormal ifTrue: [ html iconRadioButtonChecked ] ifFalse: [ html iconRadioButton ] ].
			].

		html div class: 'line'.

		html div
			class: 'speed';
			with: [
				html pagerAction: [ self beSpeedFast ] with: [
					self isSpeedFast ifTrue: [ html iconRadioButtonChecked ] ifFalse: [ html iconRadioButton ].
					html span: 'schnell'.
				].
			].
"		html div
			class: 'speed';
			with: [
				html pagerAction: [ self beSequenceBlitz ] with: [ html span: 'TBD Blitz' ].
			]."
	]