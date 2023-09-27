initialization
initialize
	super initialize.
	
	modules := (1 to: 18) collectNonBlank: [ :each |
		self wd findModuleByIndexCode: each asString ].