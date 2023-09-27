as yet unclassified
jsUiInstructionsOn: jsScript
	jsUiInstructions ifNotBlank: [
		jsUiInstructions do: [ :each |
			each value: jsScript
		].
		self clearJsUiInstructions
	]