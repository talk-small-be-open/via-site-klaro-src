rendering
renderPageContentOn: html

	self renderAnimationOn: html.

	"Failsafe button, if lottie hangs"
	nextPageName ifNotBlank: [
		self pager renderGotoPage: nextPageName callback: nextPageCallback on: html with: 'Weiter ...' ]