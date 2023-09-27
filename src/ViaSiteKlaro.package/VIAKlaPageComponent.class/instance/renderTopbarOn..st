rendering
renderTopbarOn: html
	html div class: 'topbar'; with: [
		html div class: 'topbarLeft'; with: [
	"		self renderLogoOn: html."
			self renderGotoPage: 'navigator' with: '<- Zurück' on: html
		].
		html div class: 'topbarCenter'; with: [
			"html unorderedList with: [
				html listItem
					with: [
						html anchor
							callback: [ self gotoKlaroStart ];
							with: [
								html iconHome.
								html span class: 'menuLabel'; with: [
									html sT: 'main:fastAccess:start']]
				].
			]."
		].
		html div class: 'topbarRight'; with: [
			html anchor
				class: 'mainMenuToggler';
				with: [
					html text: 'MENU'
	"				html iconMenu."
		]]
	]
	"	self renderOffcanvasOn: html."
