rendering
renderPageContentOn: html

	self renderAnimationOn: html.

	nextPageName ifNotBlank: [
		self renderGotoPage: nextPageName callback: nextPageCallback on: html with: 'Weiter ...' ]