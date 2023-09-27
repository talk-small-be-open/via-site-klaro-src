rendering
renderPageContentOn: html
	html div: 'This is page ', name, ' at time ', DateAndTime now asString.
	
	self renderGotoPage: 'navigator' with: 'Back to navigator ...' on: html.
