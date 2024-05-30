initialization
initialize
	super initialize.
	
	jsUiInstructions := OrderedCollection new.
	soundMusicEnabled := true.
	soundEffectsEnabled := true.
	
"	self clearJsUiInstructions."
	
"	self addJsUiInstruction: [ :js | js alert: 'Hihihoho Test Test!' ]"