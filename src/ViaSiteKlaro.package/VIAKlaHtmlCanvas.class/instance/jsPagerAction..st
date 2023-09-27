pager
jsPagerAction: aCallbackBlock
	"Like an anchor inside the page. Runs the callback and reloads just that page.
	Like a minibrowser."

"	^ ((self jQuery ajax)
		callback: aCallbackBlock;
		onSuccess: 'pager_reloadCurrentPage();')"
		
	^ self jQuery ajax
		script: [ :js |
			aCallbackBlock value.
			js << (JSStream on: 'pager_reloadCurrentPage()').
			self session jsUiInstructionsOn: js.
		]