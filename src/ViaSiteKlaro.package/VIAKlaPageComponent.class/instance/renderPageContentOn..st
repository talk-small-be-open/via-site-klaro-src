rendering
renderPageContentOn: html

	html div:
		'This is page ' , name , ' at time ' , DateAndTime now asString.

	self pager
		renderGotoPage: 'navigator'
		on: html
		with: 'Back to navigator ...'