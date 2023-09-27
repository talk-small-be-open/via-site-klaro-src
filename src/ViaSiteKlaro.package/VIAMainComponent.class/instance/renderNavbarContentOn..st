rendering
renderNavbarContentOn: html
	html div class: 'menubarLeft'; with: [
"		self renderLogoOn: html."
		self coreComponent renderMainTopLeftOn: html
	].
	html div class: 'menubarCenter'; with: [
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
	html div class: 'menubarRight'; with: [
		html unorderedList class: 'uk-navbar-nav'; with: [
			html listItem: [
				html anchor
					class: 'mainMenuToggler';
					ukToggleTarget: '#mainMenu';
					with: [
						html iconMenu.
			]]
		]
	].

"	self renderOffcanvasOn: html."
