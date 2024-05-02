rendering
renderContentOn: html
	html heading level2 with: 'Info für Klaro'.
	html div: 'Extra Intro Audio pro Übung, so benennen:'.
	html div: 'audio-intro-station01-task03'.
	
	html heading level2 with: 'Tests'.
	html anchor
		callback: [ self showLottieTest ];
		with: 'Lottie Test'.
	html break.
	html anchor
		callback: [ self showLottieLightweightTest ];
		with: 'Lottie Test Lightweight Player'.
	html break.
	html anchor
		callback: [ self showLottieTestWebComponent ];
		with: 'Lottie Test Web Component'.