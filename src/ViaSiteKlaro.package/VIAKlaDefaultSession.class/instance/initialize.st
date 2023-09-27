initialization
initialize
	super initialize.
	
	jsUiInstructions := OrderedCollection new.
"	self clearJsUiInstructions."
	
	self addJsUiInstruction: [ :js | js alert: 'Hihihoho!' ]