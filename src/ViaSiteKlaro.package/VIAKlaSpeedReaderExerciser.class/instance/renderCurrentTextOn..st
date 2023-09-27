rendering
renderCurrentTextOn: html
	self renderSpeedTextAreaOn: html with: [
		html div
			class: 'speedText';
			with: self currentText text ]