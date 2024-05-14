rendering
renderSettingsOn: html
"	html heading level2; t: 'myProfile:settings'."
	html form: [
		html label: [
			html sT: 'myProfile:optionalFirstName'.
			html space.
			html textInput on: #firstName of: user.
		].
		html label: [
			html checkbox on: #useAutologin of: user.
			html space.
			html sT: 'myProfile:autologin'].
		html div with: [
			html submitButton
				callback: [ self saveAndClose ];
				t: 'form:save'.
			html anchorButton
				callback: [ self close ];
				t: 'general:close'
	
		]
	]