rendering
renderPageContentOn: html

	self renderTopbarOn: html.

	moduleExercise ifNil: [ ^ self ].
	
	html div class: 'moduleTitle'; with: [
		html iconStation: self stationNumber asString.
"		html div: self module indexCodeString" ].
	
	html div class: 'exercisePanels'; with: [
		self tasks do: [ :each |
			self renderTask: each on: html.
	]].

	self renderFooterOn: html