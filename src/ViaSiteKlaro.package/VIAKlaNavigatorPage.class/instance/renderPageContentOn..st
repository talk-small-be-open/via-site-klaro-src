rendering
renderPageContentOn: html

	html div: 'NAVIGATOR/PFAD:'.

	modules do: [ :each | "self currentPortfolio exerciseForModule: module."
		self
			renderGotoPage: 'station'
			callback: [ :page | page gotoModule: each ]
			on: html
			with: 'Zu station ' , each indexCodeString , ' ...'.
			
		html break.
	].

	self renderLottieTestOn: html