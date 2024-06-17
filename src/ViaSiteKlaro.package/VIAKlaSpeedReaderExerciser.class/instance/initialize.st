initialization
initialize
	super initialize.
	gameBoardId := UUID new asString36.
	hasPlayedIntroAudio := false.
	isRunning := true.

	isAnyLongWord := self allRegularTexts anySatisfy: [ :each | each longestWordSize >= 10 ]. "see also renderCurrentText"
	isAnySentence := self allRegularTexts anySatisfy: [ :each | each wordsCount >= 2 ].
			
"	self beSpeedNormal.
	self beSequenceNormal."

"wird immer von aussen gestartet, manuell oder auto	self gotoModeManual."
	
"	self start"