rendering
renderSpeedTextAreaOn: html with: aRenderable
	html div
		class: 'speedTextArea';
		class: self currentText styleName;
		with: aRenderable