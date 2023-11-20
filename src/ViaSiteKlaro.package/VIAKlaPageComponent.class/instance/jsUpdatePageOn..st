as yet unclassified
jsUpdatePageOn: js
	"Get the JS-object to reload myself.
	subclasses might go another strategy for updating the page, instead
	of a default full reload"
	^ ((js jQuery id: self htmlId) load)
		html: [ :h | self renderPageContentOn: h ];
		yourself