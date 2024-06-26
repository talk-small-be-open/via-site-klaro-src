rendering
renderDevelopmentToolsOn: html
	html div class: 'developmentTools'; with: [
		html div: 'DEVELOPMENT TOOLS'.
		html div: [ 
			html span: 'Pending JS UI instructions: '.
			html span: self session jsUiInstructions size asString ].
		html anchor
			callback: [ self currentUser resetLoginCount ];
			with: 'Reset login counter'.
		html break.
		html pagerAction: [
			self session addJsUiInstruction: [ :js |
				js << ('blablaSomethingStupid();' asJsStream) ].
		] with: 'Throw JS error, should reload browser'
	]