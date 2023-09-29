rendering
jsCurrentPageReloaderOn: html
	| js |
	js := JSStream new.
	js nextPutAll: 'function pager_getPager() { return '.
	js javascript: (html jQuery id: htmlId).
	js nextPutAll: '} '.
	js nextPutAll: 'async function pager_reloadCurrentPage() {'.
	js nextPutAll: 'await '.
	js javascript: ((((html jQuery id: htmlId) find: 'div.klaroPage.current') load)
		html: [ :h | self renderCurrentPageContentOn: h ];
		onComplete: (((JSStream on: 'window') call: 'processHtmlDocument' with: ('div.klaroPage.current')) asFunction);
		yourself).
	js nextPutAll: '}'.

	^ js