rendering
renderButtonReadOn: html
	html span
		class: 'mainButton read';
"		class: 'active' if: self isStepRead;"
		with: [
			html imgSignRead: self isStepRead
"			html imgSignRead" ]