rendering
renderCurrentTextOn: html
	self renderSpeedTextAreaOn: html with: [
		html div
			class: 'speedText';
			with: [
				html pillar: self currentText textPillar pillarDocument ].
			
		self currentText styleName ifNotBlank: [ :style |
			style = 'magic-spell' ifTrue: [ "TODO add Animation magic wand" ]
		]
	]