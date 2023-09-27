as yet unclassified
uiGotoPage: aPage
	self currentPage: aPage.
	
	self session addJsUiInstruction: [ :js |
		js << (((js jQuery id: aPage htmlId) load)
			html: [ :h | self renderPage: aPage contentOn: h ];
			onComplete: ((JSStream on: 'window') call: 'pager_gotoPage' with: ('#', htmlId) with: ('#', aPage htmlId));
			yourself) ].