rendering
renderBetatestOn: html
	self renderBetatestOn: html with: [
		html span: 'BETATEST EXERCISE PAGE: '.
		html anchor callback: [ self moduleIsFinishedForFirstTime ]; with: 'Show-Reward'.
	].
