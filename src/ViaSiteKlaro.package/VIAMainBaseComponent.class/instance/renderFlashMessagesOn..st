rendering
renderFlashMessagesOn: html
	flashMessages ifNotEmpty: [
		flashMessages do: [:each |
			| textMessage |
			textMessage := each t.
			html div: [
				html iconFlashMessage; space.
				html span: textMessage].
		].

	self clearFlashMessages ]