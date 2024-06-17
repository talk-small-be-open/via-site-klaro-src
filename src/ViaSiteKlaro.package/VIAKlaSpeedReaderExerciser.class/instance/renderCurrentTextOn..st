rendering
renderCurrentTextOn: html
	self renderSpeedTextAreaOn: html with: [
		html div
			class: 'speedText';
			class: 'anySentence' if: isAnySentence;
			class: 'anyLongWord' if: isAnyLongWord;
			class: 'sentence' if: self currentText wordsCount >= 2;
			class: 'longWord' if: self currentText longestWordSize >= 10; "see also initialize"
			with: [
				html pillar: self currentText textPillar pillarDocument ].
			
"		self currentText styleName ifNotBlank: [ :style |
			style = 'magic-spell' ifTrue: [  ]
		]"
	]