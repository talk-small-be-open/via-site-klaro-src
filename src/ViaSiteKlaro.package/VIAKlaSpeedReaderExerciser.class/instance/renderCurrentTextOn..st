rendering
renderCurrentTextOn: html
	self renderSpeedTextAreaOn: html with: [
		html div
			class: 'speedText';
			with: [
				html pillar: self currentText textPillar pillarDocument ] ]