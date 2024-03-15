as yet unclassified
uiGotoPage: aPage
	| oldPage |
	
	oldPage := self currentPage.
	
	self gotoPage: aPage.

"	self session addJsUiInstruction: [ :js | js alert: 'will change page ...' ]."
	
	self session addJsUiInstruction: [ :js |
		"Get the page-specific JS-piece to refresh-update its content. Default is to complete re-render.
		After that, change the page in the UI
		"
		js << (oldPage jsOnHidePageOn: js).
		js << (aPage jsOnShowPageOn: js).
		js << ((JSStream on: 'window') call: 'pager_gotoPage' with: ('#', htmlId) with: ('#', aPage htmlId)).


"			onComplete: ((JSStream on: 'window') call: 'pager_gotoPage' with: ('#', htmlId) with: ('#', aPage htmlId));"
	]