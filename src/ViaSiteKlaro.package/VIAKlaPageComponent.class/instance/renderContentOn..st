rendering
renderContentOn: html
	| isCurrent |
	
	isCurrent := self isCurrent.
	
	html div
		class: 'klaroPage';
"		class: 'current' if: self isCurrent else: 'nonCurrent';"
		class: 'current' if: isCurrent;
		class: 'noScroll' if: self isNoScroll else: 'withScroll';
		id: htmlId;
		with: [
			isCurrent ifTrue: [
				self renderPageContentOn: html
			] ifFalse: [ 
				self renderHiddenPageContentOn: html.
			]
		].
	
	html scriptDefer: (self jsPreparePageOn: html)