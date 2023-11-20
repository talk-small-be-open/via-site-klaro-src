rendering
renderPageContentOn: html

	self renderAnimationOn: html.

	"Failsafe button, if lottie hangs"
	nextPageName ifNotBlank: [
		self renderGotoPage: nextPageName callback: nextPageCallback on: html with: 'Weiter ...' ]