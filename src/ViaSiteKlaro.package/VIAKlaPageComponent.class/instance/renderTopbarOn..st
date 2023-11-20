rendering
renderTopbarOn: html

	html div
		class: 'topbar';
		with: [ "	self renderOffcanvasOn: html."
			html div
				class: 'topbarLeft';
				with: [ "		self renderLogoOn: html." 
					self renderGotoPage: 'navigator' on: html with: [
						html iconBack.
						html text: 'zurück'
					] ].
			html div
				class: 'topbarCenter';
				with: [ "html unorderedList with: [
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
			html div
				class: 'topbarRight';
				with: [ 
					html anchor
						class: 'mainMenuToggler';
						with: [ 
"							html text: 'MENU'"
							html iconMenu ] ] ]