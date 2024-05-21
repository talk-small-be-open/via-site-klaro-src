rendering
renderContentOn: html

	html scriptDefer: (html pixiSoundAdd id: 'swipe'; url: '/site/sounds/516704_Uebergang.m4a').

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