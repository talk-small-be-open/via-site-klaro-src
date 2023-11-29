rendering
renderDevelopmentToolsOn: html
	html div class: 'developmentTools'; with: [
		html div: 'DEVELOPMENT TOOLS'.
		html div: [ 
			html span: 'Pending JS UI instructions: '.
			html span: self session jsUiInstructions size asString ].
		html div: [ 
			html span: 'main component: '.
			html span: self app asString ]
	]