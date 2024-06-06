rendering
renderContentOn: html

	"Add some sounds globally"
	html scriptDefer: (
		(html pixiSoundAdd preload: true; soundFile: 'uebergang'),
		(html pixiSoundAdd preload: true; soundFile: 'button-click')
"		(html pixiSoundAdd soundFile: 'zauber')"
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

	"define current page ajax reloader JS function"
	html script: (self jsCurrentPageReloaderOn: html)