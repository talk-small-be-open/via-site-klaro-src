rendering
renderSpeedTextAreaOn: html with: aRenderable
	html div
		class: 'speedTextArea';
		class: self currentText styleName;
		with: [
			html div
				class: 'speedTextAreaContent';
				with: aRenderable]