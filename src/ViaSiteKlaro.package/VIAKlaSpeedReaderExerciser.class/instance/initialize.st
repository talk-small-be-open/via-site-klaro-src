initialization
initialize
	super initialize.
	gameBoardId := UUID new asString36.
	hasPlayedIntroAudio := false.

"	self beSpeedNormal.
	self beSequenceNormal."

"wird immer von aussen gestartet, manuell oder auto	self gotoModeManual."
	
"	self start"