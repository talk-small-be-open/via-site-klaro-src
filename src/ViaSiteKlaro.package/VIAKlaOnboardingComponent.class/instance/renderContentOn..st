rendering
renderContentOn: html

	html div class: 'narrowContainer'; with: [
		html heading t: 'onboarding:title'.
		
		html imgKlaraWaving.
		
		html div pT: 'onboarding:info'.

		html form: [
			html label: [
				html sT: 'onboarding:nickName'.
			].
			html div: [
				html textInput
					script: (html jQuery this triggerFocus);
					noAuto;
"					placeholder: 'hexli84';"
					on: #firstName of: user ].
			html div class: 'topBuffer'; with: [
				html submitButton
					callback: [ self goAhead ];
					t: 'onboarding:goAhead'.
			]
		] ]