rendering
renderCurrentTextOn: html
	self renderSpeedTextAreaOn: html with: [
		html div
			class: 'speedText';
			class: 'long' if: self currentText characterCount > 20;
			class: 'longWord' if: self currentText longestWordSize > 10;
			with: [
				html pillar: self currentText textPillar pillarDocument ].
			
"		self currentText styleName ifNotBlank: [ :style |
			style = 'magic-spell' ifTrue: [  ]
		]"
	]