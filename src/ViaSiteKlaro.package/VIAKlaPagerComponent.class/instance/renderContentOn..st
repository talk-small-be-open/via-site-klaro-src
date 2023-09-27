rendering
renderContentOn: html
	html div id: htmlId; with: [
"		html render: currentPage.
		self nonCurrentPages do: [ :each |
			html render: each
		]"

		pages do: [ :each |
			html render: each
		]

	].

	"current page ajax reloader"
	html script: (self jsCurrentPageReloaderOn: html)