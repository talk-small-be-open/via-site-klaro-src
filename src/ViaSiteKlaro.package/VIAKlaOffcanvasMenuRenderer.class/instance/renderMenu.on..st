rendering
renderMenu: aMenu on: html
	html unorderedList
		class: aMenu css;
		with: [
"			html listItem class: 'uk-nav-header'; with: 'MENU'."
"			html listItem class: 'uk-nav-divider'."
			aMenu itemsDo: [:each |
				html listItem
					class: each css;
					class: 'isOpen' if: (each isCollapsible and: [each isCollapsed not]);
					with: [
						each acceptRender: self on: html
			]]]