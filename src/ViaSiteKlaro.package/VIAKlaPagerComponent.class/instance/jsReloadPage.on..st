as yet unclassified
jsReloadPage: aPageName on: canvas
	| page |
	page := self pageNamed: aPageName.

	^ ((canvas jQuery id: page htmlId) load)
		html: [ :h | self renderPage: page contentOn: h ];
		yourself