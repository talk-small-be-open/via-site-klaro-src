rendering
renderContentOn: html

	"Add some sounds globally"
	html script: (
		(html pixiSoundAdd id: 'swipe'; url: '/site/sounds/516704_Uebergang.m4a'),
		(html pixiSoundAdd id: 'button-click'; url: '/site/sounds/button-click.wav'),
		(html pixiSoundAdd id: 'reward'; url: '/site/sounds/379993_Zauber.m4a')
	).


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