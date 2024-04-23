rendering
renderSettingsOn: html
	html heading level2; t: 'myProfile:settings'.
	html form: [
		html label: [
			html checkbox on: #useAutologin of: user.
			html space.
			html sT: 'myProfile:autologin'].
		html div with: [
			html submitButton
				t: 'form:save'
		]
	]