as yet unclassified
uiGotoPage: aPage
	| oldPage isUiBackwards |
	
	oldPage := self currentPage.

	"Poor man solution to find out, if it is UI rather backwards"
	isUiBackwards := self isBackwardsFrom: oldPage to: aPage.
	
	self gotoPage: aPage.

"	self session addJsUiInstruction: [ :js | js alert: 'will change page ...' ]."
	
	self session addJsUiInstruction: [ :js |
		"Get the page-specific JS-piece to refresh-update its content. Default is to complete re-render.
		After that, change the page in the UI
		"
		js << (oldPage jsOnHidePageOn: js).
		js << (aPage jsOnShowPageOn: js).
		js << ((JSStream on: 'window') call: 'pager_gotoPage' with: ('#', htmlId) with: ('#', aPage htmlId) with: isUiBackwards).


"			onComplete: ((JSStream on: 'window') call: 'pager_gotoPage' with: ('#', htmlId) with: ('#', aPage htmlId));"
	]