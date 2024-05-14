rendering
renderTopbarCenterOn: html
	self currentUser hasName ifTrue: [
		html text: 'Hallo '.
		html text: self currentUser firstName.
		html text: '!' ]