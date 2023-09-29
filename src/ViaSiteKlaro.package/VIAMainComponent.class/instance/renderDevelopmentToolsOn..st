rendering
renderDevelopmentToolsOn: html
	html div class: 'developmentTools'; with: [
		html div: 'DEVELOPMENT TOOLS'.
		html span: 'Pednding JS UI instructions: '.
		html span: self session jsUiInstructions size asString
	]