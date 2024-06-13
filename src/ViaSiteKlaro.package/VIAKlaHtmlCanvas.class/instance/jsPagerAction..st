pager
jsPagerAction: aCallbackBlock
	"Like an anchor inside the page. Runs the callback and reloads just that page.
	Like a minibrowser."

"	^ ((self jQuery ajax)
		callback: aCallbackBlock;
		onSuccess: 'pager_reloadCurrentPage();')"
		
	^ self jQuery ajax
		script: [ :js |
			| promiseThen |
			
			aCallbackBlock value.
			
			"Postpone all JS after the page has been reloaded (async ajax)"
			promiseThen := JSFunction context: js renderContext.
			self session jsUiInstructionsOn: promiseThen.
			
			js << (((JSStream on: 'pager_reloadCurrentPage()') call: 'then' with: promiseThen)
				call: 'catch' with: 'javascriptErrorStandardBehaviour();' asFunction).
"			self session jsUiInstructionsOn: js."
		];
		onError: 'javascriptErrorStandardBehaviour();'