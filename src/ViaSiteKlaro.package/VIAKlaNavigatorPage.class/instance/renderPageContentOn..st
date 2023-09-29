rendering
renderPageContentOn: html

	html heading: 'NAVIGATOR/PFAD (TODO Grafik)'.

	moduleExercises do: [ :each |
		(self canGotoModuleExercise: each) ifTrue: [
			self
				renderGotoPage: 'station'
				callback: [ :page | page gotoModuleExercise: each ]
				on: html
				with: 'Zu Station ', each module indexCodeString, ' ...'.
		] ifFalse: [
			html span: 'Station '.
			html span: each module indexCodeString.
			html span: ' gesperrt'.
		].
			
		html break.
	].

	html break; break; break.
	self renderLottieTestOn: html.
	
	self renderBetatestOn: html with: [
		html anchor
			callback: [ self resetAllExercises ];
			with: 'BETATEST: Clear portfolio' ]