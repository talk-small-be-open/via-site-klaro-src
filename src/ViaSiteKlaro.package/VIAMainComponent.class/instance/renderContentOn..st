rendering
renderContentOn: html

	self renderTopOn: html.
	self renderFlashMessagesOn: html.
	self renderSystemMessageOn: html.
	self renderCoreOn: html.

	self renderFooterOn: html.
	
	self renderAdminFrontendToolsOn: html.
	
	self ifDevelopment: [
		self renderDevelopmentToolsOn: html
	].
