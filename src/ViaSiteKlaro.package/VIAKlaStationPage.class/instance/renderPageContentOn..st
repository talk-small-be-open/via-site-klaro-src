rendering
renderPageContentOn: html
	self renderTopbarOn: html.

	module ifNil: [ ^ self ].
	
	html div class: 'title'; with: [
		html div: module indexCodeString ].
	
	module tasks do: [ :each | 
		html div
			class: 'exercisePanel';
			with: [ 
				self
					renderGotoPage: 'exercise'
					animation: 'lottie-test'
					callback: [ :page | page gotoModule: module task: each ]
					on: html
					with: [ 
						html div
							class: 'exercisePanel';
							with: [ 
								html span: each title
							]
	] ] ].

	self ifDevelopment: [ 
		html anchor
			callback: [ self currentPortfolio clear ];
			with: 'DEV: Clear portfolio' ]