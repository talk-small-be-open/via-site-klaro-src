as yet unclassified
uiGotoPage: aPage
	self currentPage: aPage.

"	self session addJsUiInstruction: [ :js | js alert: 'will change page ...' ]."
	
	self session addJsUiInstruction: [ :js |
		"Get the page-specific JS-piece to refresh-update its content. Default is to complete re-render.
		After that, change the page in the UI
		"
		js << (aPage jsUpdatePageOn: js)
			onComplete: ((JSStream on: 'window') call: 'pager_gotoPage' with: ('#', htmlId) with: ('#', aPage htmlId));
			yourself ].