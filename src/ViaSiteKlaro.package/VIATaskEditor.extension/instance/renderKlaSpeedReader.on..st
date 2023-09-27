*ViaSiteKlaro
renderKlaSpeedReader: aSpeedReader on: html
	self renderInputEditorFor: aSpeedReader on: html with: [
		self renderOn: html quickHelp: 'Each line a text. The corresponding audio asset must be named by rules.'.
		
		html label: 'Add new texts:'.
		
		html textArea
			callback: [ :value | aSpeedReader addTextsString: value website: self website ].

		aSpeedReader texts do: [ :each |
			each acceptRenderingVisitor: self on: html ].

	]